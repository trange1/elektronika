<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	TreeToRL.xslt
	This transforms XML representation of the Mathcad UI tree into math request language blocks, which are embedded in 
	place of math regions when Mathcad files are saved as XML.

	2/25/04 NLK: Created
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  
xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
xmlns:n="urn:rl-tree-name-map" 
xmlns:ws="http://schemas.mathsoft.com/worksheet30" 
xmlns:ml="http://schemas.mathsoft.com/math30" 
xmlns:u="http://schemas.mathsoft.com/units10" 
xmlns:p="http://schemas.mathsoft.com/provenance10" 
exclude-result-prefixes="msxsl n ml u p">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
	<ws:math>
		<xsl:apply-templates/>
	</ws:math>
</xsl:template>

<!-- ####################################
	                       TOP LEVEL
      #################################### -->

	<!-- just translate children -->
	<xsl:template match="EROOT">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- add a message attribute to the current <math> element -->
	<xsl:template match="SERROR">
		<xsl:copy-of select="@*"/>
		<xsl:apply-templates/>
	</xsl:template>

	<!-- add a message attribute to the current <math> element -->
	<xsl:template match="NERROR">
		<xsl:apply-templates select="*[1]"/>
	</xsl:template>

	<!-- left child is the expression, right child is an OVALUE, left child of OVALUE is an ODISP -->
	<xsl:template match="COMPUTE">
		<ml:eval>
			<!-- copy the OVALUE style attributes -->
			<xsl:copy-of select="OVALUE/@*"/>
			
			<xsl:apply-templates select="*[1]"/>
			
			<xsl:if test="OVALUE">
				<xsl:variable name="units">
					<xsl:apply-templates select="OVALUE" mode="unit-override"/>
				</xsl:variable>
				<xsl:if test="$units">
					<xsl:copy-of select="$units"/>
				</xsl:if>
				<xsl:apply-templates select="OVALUE/ml:result" mode="result"/>				
			</xsl:if>
		</ml:eval>
	</xsl:template>

<!-- ####################################
	                      RESULT
      #################################### -->
      
      <xsl:template match="ml:* | u:*" mode="result">
      		<xsl:copy>
      			<xsl:apply-templates select="ml:* | u:* | @* | node()" mode="result"/>
      		</xsl:copy>
      </xsl:template>
      
      <xsl:template match="@* | node()" mode="result">
      		<xsl:copy/>
      </xsl:template>
      
     <xsl:template match="@symbol | @quantity" mode="result">
     		<!-- eat the symbol and quantity attributes, they are used internally and not actually part of the schema -->
      </xsl:template>
      
      <xsl:template match="ml:functionRef" mode="result">
      		<ml:str>[function]</ml:str>
      </xsl:template>

	<xsl:template match="OVALUE" mode="unit-override">		
			<xsl:apply-templates select="*[1]" mode="units"/>
	</xsl:template>
	

	<!-- FIXME!!! for now don't do any translation on the units -->
	<!-- units in which an expression is being forced to reevaluate -->
	<xsl:template match="*[ name() != 'NULLO' ]" mode="units">
		<ml:unitOverride>
			<xsl:apply-templates select="."/>
		</ml:unitOverride>
	</xsl:template>

<!-- ####################################
	                         ANNOTATION
      #################################### -->

	<!-- match annotation - call the annot function with the translated body -->
	<xsl:template match="ANNOT">
		<ml:provenance>
			<xsl:copy-of select="@expr-id"/>
			<xsl:apply-templates select="*" mode="annot"/>
		</ml:provenance>	
	</xsl:template>

	<!-- copy originRef, parentRef, and comment elements as-is -->	
	<xsl:template match="ws:box | p:originRef | p:parentRef | p:comment | p:originComment | p:contentHash" mode="annot">
		<xsl:copy-of select="."/>
	</xsl:template>
	
	<!-- apply normal match to all other elements -->
	<xsl:template match="*" mode="annot">
		<xsl:apply-templates select="."/>
	</xsl:template>
	
	<!-- FIXME!!! add provenance attributes -->
	<!-- translate an annotation - add all necessary attributes -->
	<xsl:template name="annot">
		<xsl:param name="body"/>
		<ml:provenance>
			<xsl:apply-templates select="*[following-sibling::*]" mode="annot"/>
			<xsl:copy-of select="$body"/>
		</ml:provenance>
	</xsl:template>

<!-- ####################################
	                       DEFINITION
      #################################### -->

	<!-- match a global definition -->
	<xsl:template match="GLOBEQ">
		<ml:globalDefine>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates mode="define"/>
		</ml:globalDefine>
	</xsl:template>

	<!-- WRITE-like function definition -->
	<xsl:template match="PAIR/NAME" mode="write">
		<xsl:if test="text() = 'APPEND' or
					text() = 'APPENDPRN' or
					text() = 'WRITE_HLS' or
					text() = 'WRITE_HSV' or 
					text() = 'WRITE_RGB' or
					text() = 'WRITEWAV' or
					text() = 'WRITEBMP' or 
					text() = 'WRITERAW' or
					text() = 'WRITEBIN' or
					text() = 'WRITEPRN'">
			<xsl:copy-of select="."/>
		</xsl:if>
	</xsl:template>

	<!-- match a definition -->
	<xsl:template match="DEFINE">
		<xsl:variable name="write">
			<xsl:apply-templates select="*[1]" mode="write"/>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="write">
				<ml:apply fixity="define">					
					<xsl:copy-of select="$write"/>					
					<xsl:apply-templates select="*[1]/*[2]" mode="define"/>
					<xsl:apply-templates select="*[2]" mode="define"/>
				</ml:apply>
			</xsl:when>
			<xsl:otherwise>
				<ml:define>
					<xsl:copy-of select="@*"/>
					<xsl:apply-templates select="*[1]" mode="define"/>
					<xsl:apply-templates select="*[2]"/>
				</ml:define>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- match annotation within the left-hand side of a definition -->
	<xsl:template match="ANNOT" mode="define">
		<xsl:call-template name="annot">
			<xsl:with-param name="body">
				<xsl:apply-templates select="*[not(following-sibling::*)]"		mode="define"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

	<!-- match function definition -->
	<xsl:template match="PAIR" mode="define">
		<ml:function>
			<xsl:copy-of select="PARENS/@*" />
			<xsl:apply-templates select="*[1]"/>
			<ml:boundVars>
				<xsl:apply-templates select="*[2]/*" mode="sequence"/>
			</ml:boundVars>
		</ml:function>
	</xsl:template>
		

	<!-- if not a function definition, then just do regular translation -->
	<xsl:template match="*" mode="define">
		<xsl:apply-templates select="."/>
	</xsl:template>

<!-- ####################################
	      NAME, NUM, STRING, NULLO
      #################################### -->

	<!-- match identifiers -->
	<xsl:template match="NAME">
		<ml:id>
			<xsl:copy-of select="@* | text()"/>
		</ml:id>
	</xsl:template>

	<!-- Special handling for polyroots, ODESolve, PDESolve, Find, minerr, minimize, maximize, genfit -->
	<xsl:template match="NAME[@is-solve | @is-ode | @is-pde | @is-polyroots | @is-genfit]">
			<xsl:variable name="elname"	>
				<xsl:choose>
					<xsl:when test="@is-solve"><xsl:apply-templates select="." mode="firstCaps"/></xsl:when>
					<xsl:when test="@is-ode">ml:Odesolve</xsl:when>
					<xsl:when test="@is-pde">					
						<xsl:choose>
							<xsl:when test="string(.)='numol'">ml:numol</xsl:when>
							<xsl:otherwise>ml:Pdesolve</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="@is-polyroots">ml:polyroots</xsl:when>
					<xsl:when test="@is-genfit">ml:genfit</xsl:when>
					<xsl:otherwise><xsl:message terminate="yes">special-name failed</xsl:message></xsl:otherwise>	
				</xsl:choose>		
			</xsl:variable>
			<xsl:element name="{$elname}">
				<xsl:copy-of select="@*[name() != 'xml:space' and name() != 'is-solve' and name() != 'is-ode' and name() != 'is-pde' and name() != 'is-polyroots' and name() != 'is-genfit' ]"/>	
			</xsl:element>
	</xsl:template>

	<!-- match negative numbers -->
	<xsl:template match="UMINUS[ name(*[1]) = 'NUM' ]" priority="1">
		<xsl:call-template name="number">
			<xsl:with-param name="num" select="*[1]"/>
			<xsl:with-param name="negative">true</xsl:with-param> 
		</xsl:call-template>
	</xsl:template>

	<!-- match real or imaginary numbers that are not results -->
	<xsl:template match="NUM">
		<xsl:call-template name="number">
			<xsl:with-param name="num" select="."/>
		</xsl:call-template>
	</xsl:template>

	<!-- helper function to set number attributes -->
	<xsl:template name="number">
		<xsl:param name="num"/>
		<xsl:param name="negative"/>
		<xsl:variable name="tag">
			<xsl:choose>
				<xsl:when test="$num[@symbol]">imag</xsl:when>
				<xsl:otherwise>real</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="ml:{$tag}">
			<xsl:copy-of select="$num/@*"/>
			<xsl:if test="$negative">-</xsl:if>
			<xsl:value-of select="."/>
		</xsl:element>
	</xsl:template>

	<!-- match strings -->
	<xsl:template match="STRING">
		<ml:str>
			<xsl:copy-of select="@* | text()"/>	
		</ml:str>
	</xsl:template>

	<!-- match placeholder -->
	<xsl:template match="NULLO">
		<ml:placeholder/>
	</xsl:template>

<!-- ####################################
	      MATRIX, SEQUENCE, LIST
      #################################### -->

	<!-- matrix -->
	<xsl:template match="MAT">
		<ml:matrix>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</ml:matrix>
	</xsl:template>
	
	<xsl:template match="MAT"	mode="sequence">
		<xsl:apply-templates select="."/>
	</xsl:template>

	<!-- matrix internal representation -->
	<xsl:template match="INARRAY">
		<xsl:apply-templates select="*[2]"/>
		<xsl:if test="name(*[1]) != 'NULLO' ">
			<xsl:apply-templates select="*[1]"/>
		</xsl:if>
	</xsl:template>

	<!-- list of symbolic commands -->
	<xsl:template match="LIST" mode="list">
		<xsl:apply-templates mode="list"/>
	</xsl:template>

	<xsl:template match="*" mode="list">
		<ml:command>
			<xsl:apply-templates select="."/>
		</ml:command>
	</xsl:template>

	<!-- outer sequence node -->
	<xsl:template match="SEQUENCE">
		<ml:sequence>
			<xsl:apply-templates mode="sequence"/>
		</ml:sequence>
	</xsl:template>

	<!-- nested sequence node -->
	<xsl:template match="SEQUENCE" mode="sequence">
		<xsl:apply-templates mode="sequence"/>
	</xsl:template>

	<!-- sequence element -->
	<xsl:template match="*" mode="sequence">
		<xsl:apply-templates select="."/>
	</xsl:template>

<!-- ####################################
	      OPERATORS
      #################################### -->

	<!-- function application -->
	<xsl:template match="PAIR">
		<xsl:call-template name="apply">
			<xsl:with-param name="applicator" select="*[1]"/>			
			<xsl:with-param name="applicatee" select="*[2]/*"/>
		</xsl:call-template>
	</xsl:template>

	<xsl:template match="PAIR[name(*[2]) = 'LOCAL_ASSIGN'] ">
		<ml:localDefine>
			<xsl:copy-of select="@*"/>			
			<ml:function>
				<xsl:apply-templates select="*[1]"/>
				<ml:boundVars>
					<xsl:apply-templates select="*[2]/*[1]/*[1]" mode="sequence"/>
				</ml:boundVars>
			</ml:function>								
			<xsl:apply-templates select="*[2]/*[2]"/>
		</ml:localDefine>
	</xsl:template>
	
	<!-- Capitalize the first char of the matched string, lowercase all subsequence chars -->
	<xsl:template match="*" mode="firstCaps">
		<xsl:variable name="ret">
			ml:<xsl:value-of select="translate(substring(text(),1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
			<xsl:value-of select="translate(substring(text(),2),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>		
		</xsl:variable>
		<xsl:value-of select="normalize-space(string($ret))"/>
	</xsl:template>
	
	<!--
		 Function application template 
		 Applies the "applicator" parameter to the "applicatee" param, using the supplied fixity.
		 Special handling for solve block and other idiosyncratic terminators.
	 -->
	<xsl:template name="apply">
		<xsl:param name="fixity">none</xsl:param>
		<xsl:param name="applicator"/>			
		<xsl:param name="applicatee"/>
		<ml:apply>
			<xsl:copy-of select="PARENS/@*"/>
			<xsl:if test="$fixity != 'none'">
				<xsl:attribute name="fixity"><xsl:value-of select="$fixity"/></xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="$applicator"/>
			<xsl:apply-templates select="$applicatee"/>
		</ml:apply>
	</xsl:template>
		
	<!-- Prefix function application -->
	<xsl:template match="PREFIX">		
			<xsl:call-template name="apply">
				<xsl:with-param name="fixity">prefix</xsl:with-param>
				<xsl:with-param name="applicator" select="*[1]"/>
				<xsl:with-param name="applicatee"	 select="*[2]"/>
			</xsl:call-template>					
	</xsl:template>

	<!-- special case for log function -->
	<xsl:template match="PREFIX[name(*[1]) = 'SUBSCRIPT' and name(*[1]/*[1]) = 'NAME' and *[1]/*[1]/text() = 'log' ]">
		<ml:apply>
			<ml:log/>
			<xsl:apply-templates select="*[1]/*[2]"/>
			<xsl:apply-templates select="*[2]"/>
		</ml:apply>
	</xsl:template>

	<!-- Postfix function application -->
	<xsl:template match="POSTFIX">
		<xsl:call-template name="apply">
			<xsl:with-param name="fixity">postfix</xsl:with-param>
			<xsl:with-param name="applicator" select="*[2]"/>			
			<xsl:with-param name="applicatee" select="*[1]"/>
		</xsl:call-template>		
	</xsl:template>

	<!-- Infix function aplication -->
	<xsl:template match="INFIX">
		<xsl:call-template name="apply">
			<xsl:with-param name="fixity">infix</xsl:with-param>			
			<xsl:with-param name="applicator" select="BIND/*[1]"/>			
			<xsl:with-param name="applicatee" select="*[1] | BIND/*[2]"/>					
		</xsl:call-template>	
	</xsl:template>

	<!-- Function application, fixity = tree -->
	<xsl:template match="TREE_INFIX">
		<xsl:call-template name="apply">
			<xsl:with-param name="fixity">tree</xsl:with-param>			
			<xsl:with-param name="applicator" select="BIND/*[1]"/>			
			<xsl:with-param name="applicatee" select="*[1] | BIND/*[2]"/>					
		</xsl:call-template>
	</xsl:template>	
		
	<!-- unary and binary operator match -->
	<xsl:template match="*">
		<xsl:variable name="element-name">
			<xsl:apply-templates select="$operator-map">
				<xsl:with-param name="op" select="name()"/>
			</xsl:apply-templates>
		</xsl:variable>	
		<xsl:choose>
			<xsl:when test="string-length($element-name)>0">
				<ml:apply>						
					<xsl:element name="ml:{$element-name}">
						<xsl:copy-of select="@*"/>
					</xsl:element>
					<xsl:apply-templates/>
				</ml:apply>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>	
			</xsl:otherwise>	
		</xsl:choose>						
	</xsl:template>

	 <!-- name map lookup template -->
	<xsl:template match="n:map">
		<xsl:param name="op"/>
		<xsl:value-of select="key('map-operator', $op)/@ml"/>
	 </xsl:template>

	<!-- Define a key to map tree element names to RL element names  -->
	 <xsl:key name="map-operator" match="n:name" use="@tree"/>
 
 	<xsl:variable name="operator-map" select="document('')/*/n:map"/>
	<n:map>
		<!-- binary operators -->
		<n:name tree="AND" 			ml="and"/>
		<n:name tree="CROSSPROD" 	ml="crossProduct"/>
		<n:name tree="DIVIDE" 			ml="div"/>
		<n:name tree="EQUALS" 		ml="equal"/>
		<n:name tree="GTEQ" 			ml="greaterOrEqual"/>
		<n:name tree="GTHAN" 			ml="greaterThan"/>
		<n:name tree="SUBSCRIPT" 		ml="indexer"/>
		<n:name tree="LTEQ"	 		ml="lessOrEqual"/>
		<n:name tree="LTHAN" 			ml="lessThan"/>
		<n:name tree="MATROW"		ml="matrow"/>
		<n:name tree="MATCOL"		ml="matcol"/>
		<n:name tree="MINUS" 			ml="minus"/>
		<n:name tree="TIMES" 			ml="mult"/>
		<n:name tree="NOTEQUALS" 	ml="notEqual"/>
		<n:name tree="NTHROOT" 		ml="nthRoot"/>
		<n:name tree="OR" 				ml="or"/>
		<n:name tree="OPHOLDER" 		ml="unknownOp"/>
		<n:name tree="PLUS" 			ml="plus"/>
		<n:name tree="POWER" 			ml="pow"/>
		<n:name tree="XOR" 			ml="xor"/>

		<!-- unary operators -->		
		<n:name tree="CONJUGATE" 	ml="conjugate"/>
		<n:name tree="FACTORIAL" 		ml="factorial"/>
		<n:name tree="UMINUS" 			ml="neg"/>
		<n:name tree="NOT" 			ml="not"/>
		<n:name tree="SQRT" 			ml="sqrt"/>
		<n:name tree="TRANSPOSE" 	ml="transpose"/>
		<n:name tree="VECTORIZE" 		ml="vectorize"/>
		<n:name tree="SIGMASUM" 		ml="vectorSum"/>
	</n:map>

	<xsl:template match="IDIVIDE">
		<ml:apply>
			<ml:div inline="true"/>
			<xsl:apply-templates/>
		</ml:apply>
	</xsl:template>

	<xsl:template match="EQNSPLIT">
		<ml:apply>
			<ml:plus split="true"/>
			<xsl:apply-templates/>
		</ml:apply>
	</xsl:template>

<!-- ####################################
	      BIG OPERATORS
      #################################### -->

	<xsl:template match="DERIVATIVE">
		<ml:apply>
			<ml:derivative>
				<xsl:copy-of select="@*"/>
			</ml:derivative>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="*[1]"/>
				<xsl:with-param name="body" select="*[2]"/>
			</xsl:call-template>
		</ml:apply>
	</xsl:template>

	<xsl:template match="NTH_DERIV">
		<ml:apply>
			<ml:derivative>
				<xsl:copy-of select="@*"/>
			</ml:derivative>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="BIND/*[1]"/>
				<xsl:with-param name="body" select="BIND/*[2]"/>
			</xsl:call-template>
			<ml:degree>
				<xsl:apply-templates select="*[1]"/>
			</ml:degree>
		</ml:apply>
	</xsl:template>

	<xsl:template match="INTEGRAL">
		<ml:apply>
			<xsl:element name="ml:integral">
				<xsl:copy-of select="@*"/>
			</xsl:element>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="*[2]/*[1]"/>
				<xsl:with-param name="body" select="*[2]/*[2]"/>
			</xsl:call-template>
			<ml:bounds>
				<xsl:apply-templates select="*[1]/* "/>
			</ml:bounds>
		</ml:apply>
	</xsl:template>

	<xsl:template match="INDEFINTG">
		<ml:apply>
			<ml:integral/>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="*[1]"/>
				<xsl:with-param name="body" select="*[2]"/>
			</xsl:call-template>
		</ml:apply>
	</xsl:template>

	<xsl:template match="LIMIT">
		<ml:apply>
			<ml:limit/>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="BIND/*[1]"/>
				<xsl:with-param name="body" select="BIND/*[2]"/>
			</xsl:call-template>
			<xsl:apply-templates select="*[1]"/>
		</ml:apply>
	</xsl:template>

	<xsl:template match="LIMITPLUS">
		<ml:apply>
			<ml:limit direction="right"/>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="BIND/*[1]"/>
				<xsl:with-param name="body" select="BIND/*[2]"/>
			</xsl:call-template>
			<xsl:apply-templates select="*[1]"/>
		</ml:apply>
	</xsl:template>

	<xsl:template match="LIMITMIN">
		<ml:apply>
			<ml:limit direction="left"/>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="BIND/*[1]"/>
				<xsl:with-param name="body" select="BIND/*[2]"/>
			</xsl:call-template>
			<xsl:apply-templates select="*[1]"/>			
		</ml:apply>
	</xsl:template>

	<xsl:template match="SUM">
		<ml:apply>
			<ml:summation/>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="*[1]"/>
				<xsl:with-param name="body" select="*[2]"/>
			</xsl:call-template>
		</ml:apply>
	</xsl:template>

	<xsl:template match="VBINDSUM">
		<ml:apply>
			<ml:summation/>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="*[2]/*[1]"/>
				<xsl:with-param name="body" select="*[2]/*[2]"/>
			</xsl:call-template>
			<ml:bounds>
				<xsl:apply-templates select="*[1]/* "/>
			</ml:bounds>
		</ml:apply>
	</xsl:template>

	<xsl:template match="PROD">
		<ml:apply>
			<ml:product/>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="*[1]"/>
				<xsl:with-param name="body" select="*[2]"/>
			</xsl:call-template>
		</ml:apply>
	</xsl:template>

	<xsl:template match="VBINDPROD">
		<ml:apply>
			<ml:product/>
			<xsl:call-template name="lambda">
				<xsl:with-param name="boundVars" select="*[2]/*[1]"/>
				<xsl:with-param name="body" select="*[2]/*[2]"/>
			</xsl:call-template>
			<ml:bounds>
				<xsl:apply-templates select="*[1]/* "/>
			</ml:bounds>
		</ml:apply>
	</xsl:template>

	<xsl:template name="lambda">
		<xsl:param name="boundVars"/>
		<xsl:param name="body"/>
		<ml:lambda>
			<ml:boundVars>
				<xsl:apply-templates select="$boundVars"/>
			</ml:boundVars>
			<xsl:apply-templates select="$body"/>
		</ml:lambda>
	</xsl:template>

<!-- ####################################
	      OTHER
      #################################### -->
      
	<!-- Special case: Obsolete KRONECKER operator gets turned into a function call -->
      <xsl:template match="KRONECKER">
      	<ml:apply>      		
			<ml:id>kronecker</ml:id>			
			<xsl:apply-templates/>
		</ml:apply> 
      </xsl:template>

	<xsl:template match="SOLVE">
		<ml:symEval>
			<xsl:copy-of select="@*"/>
			<xsl:choose>
				<xsl:when test="name(*[1]) = 'LIST' ">
					<xsl:apply-templates select="LIST/*[1]"/>
					<xsl:apply-templates select="LIST/*[2]" mode="list"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="*[1]"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="*[2]">
				<ml:symResult>
					<xsl:apply-templates select="*[2]"/>
				</ml:symResult>
			</xsl:if>
		</ml:symEval>
	</xsl:template>

	<xsl:template match="RANGE">
		<ml:range>
			<xsl:apply-templates/>
		</ml:range>
	</xsl:template>

	<xsl:template match="MIXEDNUM">
		<ml:mixed>
			<ml:whole>
				<xsl:apply-templates select="*[1]"/>
			</ml:whole>
			<ml:numerator>
				<xsl:apply-templates select="BIND/*[1]"/>
			</ml:numerator>
			<ml:denominator>
				<xsl:apply-templates select="BIND/*[2]"/>
			</ml:denominator>
		</ml:mixed>
	</xsl:template>

	<xsl:template match="CHEMELEM">
		<ml:chem>
			<xsl:apply-templates/>
		</ml:chem>
	</xsl:template>

	<xsl:template match="PARENS">
		<xsl:element name="ml:parens">
			<xsl:copy-of select="@* "/>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
		
	<xsl:template match="ABSVAL[@type='det']">
		<ml:apply>
			<ml:determinant/>
			<xsl:apply-templates/>
		</ml:apply>
	</xsl:template>
	
	<xsl:template match="ABSVAL[@type='abs']">
		<ml:apply>
			<ml:absval/>
			<xsl:apply-templates/>
		</ml:apply>
	</xsl:template>
	

<!-- ####################################
	      PROGRAMMING
      #################################### -->

	<xsl:template match="PROGRAM">
		<ml:program>
			<xsl:apply-templates mode="program"/>
		</ml:program>
	</xsl:template>

	<xsl:template match="PROGRAM" mode="program">
		<xsl:apply-templates mode="program"/>
	</xsl:template>

	<xsl:template match="*" mode="program">
		<xsl:apply-templates select="."/>
	</xsl:template>

	<xsl:template match="LOCAL_ASSIGN[PAIR[not(preceding-sibling::*)]]">
		<ml:localDefine>
			<xsl:copy-of select="@*"/>
			<ml:function>
				<xsl:copy-of select="PAIR[1]/PARENS/@*" />
				<xsl:apply-templates select="PAIR[1]/*[1]"/>
				<ml:boundVars>
					<xsl:apply-templates select="PAIR[1]/PARENS/*[1]" mode="sequence"/>
				</ml:boundVars>
			</ml:function>
			<xsl:apply-templates select="*[2]" mode="sequence"/>
		</ml:localDefine>
	</xsl:template>
	
	<xsl:template match="LOCAL_ASSIGN">
		<ml:localDefine>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</ml:localDefine>
	</xsl:template>

	<xsl:template match="IFTHEN">
		<ml:ifThen>
			<xsl:apply-templates select="*[2]"/>
			<xsl:apply-templates select="*[1]"/>
		</ml:ifThen>
	</xsl:template>

	<xsl:template match="ELSE">
		<ml:otherwise>
			<xsl:apply-templates/>
		</ml:otherwise>
	</xsl:template>

	<xsl:template match="FOR">
		<ml:for>
			<xsl:apply-templates select="*[2]/*"/>
			<xsl:apply-templates select="*[1]"/>
		</ml:for>
	</xsl:template>

	<xsl:template match="WHILE">
		<ml:while>
			<xsl:apply-templates select="*[2]"/>
			<xsl:apply-templates select="*[1]"/>

		</ml:while>
	</xsl:template>

	<xsl:template match="RETURN">
		<ml:return>
			<xsl:apply-templates/>
		</ml:return>
	</xsl:template>

	<xsl:template match="ONERROR">
		<ml:tryCatch>
			<xsl:apply-templates select="*[2]"/>
			<xsl:apply-templates select="*[1]"/>
		</ml:tryCatch>
	</xsl:template>

	<xsl:template match="BREAK">
		<ml:break/>
	</xsl:template>

	<xsl:template match="CONTINUE">
		<ml:continue/>
	</xsl:template>

</xsl:stylesheet>
