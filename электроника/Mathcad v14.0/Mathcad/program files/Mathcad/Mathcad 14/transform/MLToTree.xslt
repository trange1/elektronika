<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	RLToTree.xslt
	This transforms XML math request language blocks into an essentially direct XML representation of the Mathcad UI tree.  Each math content region in a worksheet undergoes this transform. The result then gets parsed by Mathcad to build the tree in memory.

2/25/04 JSL: Created
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:trans="urn:mc-transform-extension" 
xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
xmlns:n="urn:rl-tree-name-map" 
xmlns:ws="http://schemas.mathsoft.com/worksheet30" 
xmlns:ml="http://schemas.mathsoft.com/math30"  
xmlns:u="http://schemas.mathsoft.com/units10" 
xmlns:p="http://schemas.mathsoft.com/provenance10" 
exclude-result-prefixes="trans msxsl n ws ml u p">	

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:include href="Assert.xslt"/>
	<xsl:include href="UnitsToTree.xslt"/>
	
	<!-- Indicates whether we should format numbers in results -->
	<xsl:param name="format-numbers" select="true()" />
	<!-- Is this a result tree? -->
	<xsl:param name="result" select="false()" />
	<!-- Display nested matrices? -->
	<xsl:param name="displayNested" select="false()" />
	
	<!-- Duplicates xsl:copy-of, but throws out any namespace -->
	<xsl:template match="@*" mode="copy-of">
		<xsl:attribute name="{local-name(.)}">
			<xsl:value-of select="."/>
		</xsl:attribute>
	</xsl:template>
	
	<xsl:template match="text()" mode="copy-of">
		<xsl:value-of select="."/>
	</xsl:template>

	<!-- Duplicates xsl:copy-of, but throws out any namespace -->
	<xsl:template match="*" mode="copy-of">
		<xsl:element name="{local-name(.)}">
			<xsl:apply-templates select="@* | * | text()" mode="copy-of"/>
		</xsl:element>
	</xsl:template>	
	
	<!-- Define a key to map RL element names to tree element names  -->
	<xsl:key name="name-lookup" match="n:name" use="@ml"/>
	
	<!-- variable pointing to the map of ml-to-tree element names defined below -->
	<xsl:variable name="genElementsTop" select="document('')/*/n:map[@name='genElements']"/>

	<!-- variable pointing to the map of ml names to both simple and bounded lambda operator names-->
	<xsl:variable name="lambdaOpsTop" select="document('')/*/n:map[@name='lambdaOps']"/>

	<!-- variable pointing to the map of ml-to-tree number tags defined below -->
	<xsl:variable name="numbers" select="document('')/*/n:map[@name='numbers']"/>

	<!-- 
	 	Translation table of ml-to-tree element names.
	 	Element names not appearing hear are simply uppercased/
	 -->
	<n:map name="genElements">
		<n:name ml="chem" tree="CHEMELEM"/>
		<n:name ml="div" tree="DIVIDE"/>
		<n:name ml="equal" tree="EQUALS"/>
		<n:name ml="globalEquals" tree="GLOBEQ"/>
		<n:name ml="globalDefine" tree="GLOBEQ"/>
		<n:name ml="greaterOrEqual" tree="GTEQ"/>
		<n:name ml="greaterThan" tree="GTHAN"/>
		<n:name ml="indexer" tree="SUBSCRIPT"/>
		<n:name ml="lessOrEqual" tree="LTEQ"/>
		<n:name ml="lessThan" tree="LTHAN"/>
		<n:name ml="localDefine" tree="LOCAL_ASSIGN"/>
		<n:name ml="math" tree="EROOT"/>
		<n:name ml="mult" tree="TIMES"/>
		<n:name ml="neg" tree="UMINUS"/>
		<n:name ml="notEqual" tree="NOTEQUALS"/>
		<n:name ml="otherwise" tree="ELSE"/>
		<n:name ml="pow" tree="POWER"/>
		<n:name ml="crossProduct" tree="CROSSPROD"/>
		<n:name ml="summation" tree="SUM"/>
		<n:name ml="vectorSum" tree="SIGMASUM"/>
		<n:name ml="placeholder" tree="NULLO"/>
		<n:name ml="unknownOp" tree="OPHOLDER"/>
	</n:map>
	
	<!-- translation of lambda operator names to simple and bounded tree node names -->
	<n:map name="lambdaOps">
		<n:name ml="summation" simple="SUM" bounded="VBINDSUM"/>
		<n:name ml="product" simple="PROD" bounded="VBINDPROD"/>
		<n:name ml="integral" simple="INDEFINTG" bounded="INTEGRAL"/>
	</n:map>
			
	<!-- Template to look up an entry one of the n:map lists defined above -->
	<xsl:template name="mapLookup">
		<xsl:param name="mlname"/>
		<xsl:param name="keyname"/>
		<xsl:param name="attrname">tree</xsl:param>
		<xsl:variable name="elname">
			<xsl:value-of select="key($keyname, $mlname)/@*[local-name()=$attrname]"/>
		</xsl:variable>
		<xsl:choose>
			<!-- if name translation is found in the lookup table, use it -->
			<xsl:when test="string-length($elname)>0">
				<xsl:value-of select="$elname"/>
			</xsl:when>
			<!-- otherwise, generate the uppercase of $mlname -->
			<xsl:otherwise>
				<xsl:value-of select="translate( $mlname, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- name map lookup template -->
	<xsl:template match="n:map">
		<xsl:param name="mlname"/>
		<xsl:param name="attrname">tree</xsl:param>
		<xsl:call-template name="mapLookup">
			<xsl:with-param name="mlname" select="$mlname"/>
			<xsl:with-param name="keyname">name-lookup</xsl:with-param>
			<xsl:with-param name="attrname" select="$attrname"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- TRANSFORM STARTS HERE -->
	<xsl:template match="/">
		<xsl:apply-templates select="//ws:math"/>
	</xsl:template>
	
	<!-- outer-most math element match -->
	<xsl:template match="ws:math">
		<EROOT>
			<xsl:apply-templates select="*"/>
		</EROOT>
	</xsl:template>

	<xsl:template match="ws:math[@error]">
		<EROOT>
			<SERROR>
				<xsl:apply-templates select="@error" mode="copy-of"/>
				<xsl:apply-templates select="*"/>
			</SERROR>
		</EROOT>
	</xsl:template>
	
	<!-- Outputs the context node and following siblings as a recursive SEQUENCE-like tree.
		The actual element name is passed in as a parameter (can be SEQUENCE or LIST)	-->
	<xsl:template match="ml:*" mode="sequencecount">
		<xsl:param name="nodes-to-sequence"/>
		<xsl:param name="element-name"/>

		<xsl:choose>
			<xsl:when test="$nodes-to-sequence = 1">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="{$element-name}">
					<xsl:apply-templates select="." mode="sequencecount">
						<xsl:with-param name="nodes-to-sequence" select="$nodes-to-sequence - 1"/>
						<xsl:with-param name="element-name" select="$element-name"/>
					</xsl:apply-templates>
					<xsl:apply-templates select="following-sibling::*[$nodes-to-sequence - 1]"/>			
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Outputs the context node and following siblings as a recursive SEQUENCE tree -->
	<xsl:template match="ml:*" mode="sequence">
		<xsl:apply-templates select="." mode="sequencecount">
			<!-- Pass in the number of elements to be sequenced -->
			<xsl:with-param name="nodes-to-sequence" select="count(.) + count(following-sibling::*)"/>
			<xsl:with-param name="element-name">SEQUENCE</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	
	<!-- 
		*******************************************************
		*VALUE TYPES (numbers, strings, matrices) *
		*******************************************************
	-->
	
	<!-- id value type -->
	<xsl:template match="ml:id">
		<NAME>
			<xsl:apply-templates select="@* | text()" mode="copy-of"/>
		</NAME>
	</xsl:template>
	
	<xsl:template match="*" mode="strip-minus">
		<xsl:apply-templates select="@*" mode="copy-of"/>
		<xsl:value-of select="normalize-space(substring(normalize-space(.),2))"/>
	</xsl:template>
	
	<!-- Real number literal (i.e. non-result) -->
	<xsl:template match="ml:real" mode="literal">
		<xsl:choose>
			<xsl:when test="substring(normalize-space(.),1,1) = '-' ">
				<UMINUS>
					<NUM>
						<xsl:apply-templates select="." mode="strip-minus"/>
					</NUM>
				</UMINUS>				
			</xsl:when>
			<xsl:otherwise>
				<NUM>
					<xsl:apply-templates select="@* | text()" mode="copy-of"/>
				</NUM>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Special case for NaN -->
	<xsl:template match="ml:real[string()='NaN']" mode="literal">
		<xsl:call-template name="NaN"/>
	</xsl:template>	
	
	<!-- Imaginary number literal (non-result) -->
	<xsl:template match="ml:imag" mode="literal">
		<xsl:choose>
			<xsl:when test="substring(normalize-space(.),1,1) = '-' ">
				<UMINUS>
					<INUM>
						<xsl:apply-templates select="." mode="strip-minus"/>
					</INUM>
				</UMINUS>
			</xsl:when>	
			<xsl:otherwise>
				<INUM>
					<xsl:apply-templates select="@* | text()" mode="copy-of"/>
				</INUM>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- real or imaginary number, dispatches to correct modal handler depending on $result and $symbolic parameters -->
	<xsl:template match="ml:real | ml:imag">
		<xsl:choose>
			<xsl:when test="$result and $format-numbers">
				<xsl:apply-templates select="." mode="result"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="." mode="literal"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Real number in a result.  We call back into MathDLL code to build the UI tree for this, since
	 	it involves complex logic and worksheet-level tolerance considerations -->	
	<xsl:template match="ml:real" mode="result">		
		<!-- Build the tree in code, applying zero tolerances as necessary -->
		<TREE_NODE_PTR>
			<xsl:value-of select="trans:MakeComplexTree(string(.),'0',0)"/>
		</TREE_NODE_PTR>
	</xsl:template>
	
	<!-- Special case for NaN in a result -->	
	<xsl:template match="ml:real[string()='NaN']" mode="result">
		<xsl:call-template name="NaN"/>
	</xsl:template>	
		
	<xsl:template match="ml:imag" mode="result">		
		<!-- Build the tree in code, applying zero tolerances as necessary -->
		<TREE_NODE_PTR>
			<xsl:value-of select="trans:MakeComplexTree('0',string(.),0)"/>
		</TREE_NODE_PTR>
	</xsl:template>
	
	<!-- NaN generator -->
	<xsl:template name="NaN">
		<NAME>NaN</NAME>
	</xsl:template>
	
	<xsl:template match="ml:complex[ml:real[string()='NaN'] or ml:imag[string()='NaN']]">
		<xsl:call-template name="NaN"/>
	</xsl:template>
	
	<!-- Complex value type -->
	<xsl:template match="ml:complex">		
		<xsl:param name="united" select='number(0)'/>
		<xsl:variable name="real">
			<xsl:choose>
				<xsl:when test="ml:real">
					<xsl:value-of select="ml:real"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>			
		</xsl:variable>
		<xsl:variable name="imag">
			<xsl:choose>
				<xsl:when test="ml:imag">
					<xsl:value-of select="ml:imag"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="$result and $format-numbers">
				<TREE_NODE_PTR>				
					<xsl:value-of select="trans:MakeComplexTree(string($real),string($imag),$united)"/>
				</TREE_NODE_PTR>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>					
					<xsl:when test="$real = '0' and $imag = '0'">
						<!-- Both parts zero -->
						<NUM>0</NUM>						
					</xsl:when>
					<xsl:when test="$real != '0' and $imag = '0'">
						<!-- Real part only -->
						<xsl:apply-templates select="ml:real" mode="literal"/>
					</xsl:when>
					<xsl:when test="$real = '0' and $imag != '0'">
						<!-- Imag part only -->
						<xsl:apply-templates select="ml:imag" mode="literal"/>
					</xsl:when>
					<xsl:when test="substring(normalize-space(string($imag)), 1, 1) = '-' ">
						<!-- Real - Imag -->
						<MINUS>
							<xsl:apply-templates select="ml:real" mode="literal"/>
							<INUM><xsl:apply-templates select="ml:imag" mode="strip-minus"/></INUM>
						</MINUS>
					</xsl:when>
					<xsl:otherwise>
						<!-- Real + Imag -->
						<PLUS>
							<xsl:apply-templates select="ml:real" mode="literal"/>
							<xsl:apply-templates select="ml:imag" mode="literal"/>
						</PLUS>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>		
	</xsl:template>
	
	<!-- this is here because of a bug in MSXSLT which translates @xml:space into http://www.w3.org/XML/1998/namespace:space -->
	<xsl:template match="@xml:space" mode="copy-of">
		<xsl:attribute name="xml:space"><xsl:value-of select="string()"/></xsl:attribute>
	</xsl:template>
		
	<!-- String vlaue type -->
	<xsl:template match="ml:str">
		<STRING>
			<xsl:apply-templates select="@* | text()" mode="copy-of"/>
		</STRING>
	</xsl:template>
	
	<!-- Mixed number -->
	<xsl:template match="ml:mixed">
		<MIXEDNUM>
			<xsl:apply-templates select="ml:whole/*"/>
			<BIND>
				<xsl:apply-templates select="ml:numerator/*"/>
				<xsl:apply-templates select="ml:denominator/*"/>
			</BIND>
		</MIXEDNUM>
	</xsl:template>
	
	<!-- Matrix elements to INARRAY -->
	<xsl:template match="ml:*[following-sibling::*]" mode="inarray">
		<INARRAY>
			<xsl:apply-templates select="following-sibling::*[1]" mode="inarray"/>
			<xsl:apply-templates select="."/>
		</INARRAY>
	</xsl:template>
	
	<xsl:template match="ml:matrix/ml:apply">
		<xsl:apply-templates select="ml:*"/>
	</xsl:template>
	
	<!-- Matrix elements to INARRAY -->
	<xsl:template match="ml:*" mode="inarray">
		<INARRAY>
			<NULLO/>
			<xsl:apply-templates select="."/>
		</INARRAY>
	</xsl:template>
	
	
	<!-- ASSERTION CONDITION: Matrix rows * cols must equal the number of elements -->
	<xsl:template match="ml:matrix[@rows * @cols != count(*)]">
		<xsl:apply-templates mode="assertion-failed" select=".">
			<xsl:with-param name="msgid">XMalformedMatrix</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>		
		
	<!-- Matrix value type -->
	<xsl:template match="ml:matrix">	
		<xsl:choose>
			<xsl:when test="@rows * @cols > 600 and $result and (($displayNested and ancestor::ml:matrix) or not(ancestor::ml:matrix))">
				<NAME>
				<xsl:value-of select="trans:Msg('BigMatrix')"/>
				<xsl:text>{</xsl:text>
				<xsl:value-of select="@rows"/>
				<xsl:text>,</xsl:text>
				<xsl:value-of select="@cols"/>
				<xsl:text>}</xsl:text>
				</NAME>
			</xsl:when>			
			<!-- If matrix is nested and we are not displaying nested matrices, write out {rows,cols} as a name node -->
			<xsl:when test="ancestor::ml:matrix and ($result or ancestor::ml:result) and not($displayNested)">				
				<NAME>{<xsl:value-of select="@rows"/>,<xsl:value-of select="@cols"/>}</NAME>
			</xsl:when>
			<xsl:otherwise>
			<MAT>
				<xsl:apply-templates select="@*" mode="copy-of"/>
				<xsl:apply-templates select="*[1]" mode="inarray"/>
			</MAT>
			</xsl:otherwise>			
		</xsl:choose>	
	</xsl:template>
	
	<!-- United value type -->
	<xsl:template match="ml:unitedValue">
		<TIMES style="thin-space">
			<!-- output the value part -->
			<xsl:apply-templates select="*[1]">
				<xsl:with-param name="united" select="number(1)"/>
			</xsl:apply-templates>
			<!-- output the units part -->
			<xsl:apply-templates select="*[2]"/>
		</TIMES>
	</xsl:template>
	
	<!-- Numeric evaluation -->
	 <xsl:template match="ml:eval">
               <COMPUTE>
                      <!-- first child is computed result, gets ignored -->
                      <xsl:apply-templates select="*[1]"/>
                      <OVALUE>
						  <xsl:apply-templates select="@placeholderMultiplicationStyle" mode="copy-of"/>
                             <ODISP>
									 <xsl:apply-templates select="@resultMultiplicationStyle" mode="copy-of"/>
                                     <NULLO/>
                                     <NULLO/>
                             </ODISP>
                             <xsl:choose>
                                     <xsl:when test="ml:unitOverride">
                                            <xsl:apply-templates select="ml:unitOverride"/>
                                     </xsl:when>
                                     <xsl:otherwise><NULLO/></xsl:otherwise>
                             </xsl:choose>
                      </OVALUE>
               </COMPUTE>
       </xsl:template>       

	<!-- Numeric results (ignored, not read back in) -->
	<xsl:template match="ml:result"/>
	
	<!-- Symbolic evaluation (with symbolic keyword commands) -->
	<xsl:template match="ml:symEval[ml:command]">
		<SOLVE>
			<xsl:apply-templates select="@*" mode="copy-of"/>
			<LIST>
				<xsl:apply-templates select="*[1]"/>
				<xsl:apply-templates select="ml:command[1]" mode="sequencecount">
					<xsl:with-param name="nodes-to-sequence" 	select="count(ml:command)"/>
					<xsl:with-param name="element-name">LIST</xsl:with-param>
				</xsl:apply-templates>
			</LIST>
			<NULLO/>
		</SOLVE>		
	</xsl:template>

	<!-- Symbolic evaluation (without symbolic keyword commands) -->
	<xsl:template match="ml:symEval[not(ml:command)]">
		<SOLVE>
			<xsl:apply-templates select="@*" mode="copy-of"/>
			<xsl:apply-templates select="*"/>
			<NULLO/>
		</SOLVE>		
	</xsl:template>
	
	<!-- Symbolic command list builder -->
	<xsl:template match="ml:*" mode="symeval">
		<xsl:apply-templates select="."/>
		<xsl:apply-templates select="following-sibling::*[local-name()='command']" mode="sequencecount">
			<xsl:with-param name="nodes-to-sequence" 	select="count(following-sibling::*[local-name()='command'])"/>
			<xsl:with-param name="element-name">LIST</xsl:with-param>
		</xsl:apply-templates>		
	</xsl:template>
	
	<!-- Symblic command -->
	<xsl:template match="ml:command">
		<xsl:apply-templates select="*[1]" mode="sequence"/>	</xsl:template>
	
	<!-- Symbolic results, ignored -->
	<xsl:template match="ml:symResult"/>

	<!-- ASSERTION: prefix applications  must have exactly 1 argument  -->
	<xsl:template match="ml:apply[@fixity='prefix' and count(*) != 2]">
		<xsl:apply-templates mode="assertion-failed" select=".">
			<xsl:with-param name="msgid">XPrefixArgCount</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	
	<!-- Prefix function application -->
	<xsl:template match="ml:apply[@fixity='prefix']">
		<PREFIX>
			<xsl:apply-templates select="*[1]"/>
			<xsl:apply-templates select="*[2]" mode="sequence"/>
		</PREFIX>
	</xsl:template>	

		<!-- ASSERTION: prefix applications  must have exactly 1 argument  -->
	<xsl:template match="ml:apply[@fixity='postfix' and count(*) != 2]">
		<xsl:apply-templates mode="assertion-failed" select=".">
			<xsl:with-param name="msgid">XPostfixCount</xsl:with-param>
		</xsl:apply-templates>			
	</xsl:template>	
	
	<!-- Postfix function application -->
	<xsl:template match="ml:apply[@fixity='postfix']">
		<POSTFIX>
			<xsl:apply-templates select="*[2]" mode="sequence"/>
			<xsl:apply-templates select="*[1]"/>
		</POSTFIX>
	</xsl:template>
	
	<!-- ASSERTION: infix/treefix applications  must have exactly 2 arguments  -->
	<xsl:template match="ml:apply[ ( @fixity='infix' or @fixity='tree' ) and count( * ) != 3 ]">
		<xsl:apply-templates mode="assertion-failed" select=".">
			<xsl:with-param name="msgid">XInfixTreeArgCount</xsl:with-param>
		</xsl:apply-templates>	
	</xsl:template>
	
	<!-- Infix function application -->
	<xsl:template match="ml:apply[@fixity='infix']" >
		<INFIX>
			<xsl:apply-templates select="*[2]"/>
			<BIND>
				<xsl:apply-templates select="*[1]"/>
				<xsl:apply-templates select="*[3]"/>
			</BIND>
		</INFIX>
	</xsl:template>
	
	<!-- Treefix funcion application -->
	<xsl:template match="ml:apply[@fixity='tree']">
		<TREE_INFIX>
			<xsl:apply-templates select="*[2]"/>
			<BIND>
				<xsl:apply-templates select="*[1]"/>
				<xsl:apply-templates select="*[3]"/>
			</BIND>
		</TREE_INFIX>
	</xsl:template>
	
		<!-- function applications in normal f(x) notation or rather expr(x) -->
	<xsl:template match="ml:apply[not(@fixity)]">
		<xsl:apply-templates select="*[1]" mode="apply"/>
	</xsl:template>

	<!-- functional expression application (e.g. f(x)) or fixity expression application (e.g. x f y) 
		  for these the operator is translated alone and a PAIR/PARENT function application is created the apply rule translates the parameters -->
	<xsl:template match="ml:apply | ml:mixed | ml:parens | ml:provenance | ml:range | ml:sequence | ml:symEval | ml:id | ml:chem | ml:polyroots | ml:genfit | ml:define | ml:globalDefine | ml:localDefine | ml:ifThen | ml:otherwise | ml:break | ml:return | ml:contiue | ml:program | ml:while | ml:tryCatch | ml:for | ml:real | ml:imag | ml:complex | ml:str | ml:matrix | ml:placeholder | ml:unitedValue | ml:Odesolve | ml:Pdesolve | ml:Find | ml:Minimize | ml:Maximize | ml:Minerr | ml:numol" mode="apply">
		<PAIR>
			<xsl:apply-templates select="."/>
			<PARENS>
				<xsl:apply-templates select="../@unpaired" mode="copy-of"/>
				<xsl:apply-templates select="following-sibling::*[1]" mode="sequence"/>
			</PARENS>
		</PAIR>
	</xsl:template>
	
	<!-- Inline division -->
	<xsl:template match="ml:div[@inline='true']" mode="apply">
		<xsl:element name="IDIVIDE">
			<xsl:apply-templates select="following-sibling::*"/>
		</xsl:element>
	</xsl:template>
	
	<!-- Line split plus operator -->
	<xsl:template match="ml:plus[@split='true']" mode="apply">
		<xsl:element name="EQNSPLIT">
			<xsl:apply-templates select="following-sibling::*"/>
		</xsl:element>
	</xsl:template>
	
	<!-- 
		Special cases for genfit/PDE/ODE/polyroots/Solve block terminators.
		These carry along a bunch of ancillary information in attributes which must
		be copied.	-->
	<xsl:template match="ml:Find | ml:Minerr | ml:Minimize | ml:Maximize | ml:Pdesolve | ml:Odesolve | ml:numol | ml:polyroots | ml:genfit">
		<NAME>					
				<xsl:apply-templates select="@*" mode="copy-of"/>
				<xsl:value-of select="local-name(.)"/>
		</NAME>
	</xsl:template>	

	<!-- other Mathcad operator application 
		  these can only appear inside an apply and their siblings should become their children (e.g. <apply><vectorize><id/></apply> -> <VECTORIZE><id/></VECTORIZE>)-->
	<xsl:template match="ml:*" mode="apply">
		<xsl:variable name="newName">
			<xsl:apply-templates select="$genElementsTop">
				<xsl:with-param name="mlname" select="local-name()"/>
			</xsl:apply-templates>
		</xsl:variable>
		<xsl:element name="{$newName}">
			<xsl:apply-templates select="@*" mode="copy-of"/>						
			<xsl:apply-templates select="following-sibling::*"/>
		</xsl:element>
	</xsl:template>
	
	<!-- special handling for log -->
	<xsl:template match="ml:apply[ml:log]">
		<PREFIX>
			<SUBSCRIPT>
					<NAME>log</NAME>
					<xsl:apply-templates select="*[2]"/>
			</SUBSCRIPT>
			<xsl:apply-templates select="*[3]"/>
		</PREFIX>
	</xsl:template>

	<!-- The template handles function definitions -->
	<xsl:template match="ml:function">	
		<PAIR>
			<xsl:apply-templates select="*[1]"/>
			<PARENS>
				<xsl:apply-templates select="@unpaired" mode="copy-of"/>
				<xsl:apply-templates select="ml:boundVars/*[1]" mode="sequence"/>
			</PARENS>
		</PAIR>
	</xsl:template>
	
	<!-- Expression typed in to the units placeholder -->
	<xsl:template match="ml:unitOverride">
		<xsl:apply-templates select="*"/>
	</xsl:template>
	
	<!-- Placeholder with no children -->
	<xsl:template match="ml:placeholder | ml:unknownOp">
		<NULLO/>
	</xsl:template>
	
	<!-- Generic element with children -->
	<xsl:template match="ml:*">	
		<xsl:variable name="newName">
			<xsl:apply-templates select="$genElementsTop">
				<xsl:with-param name="mlname" select="local-name()"/>
			</xsl:apply-templates>
		</xsl:variable>
		<xsl:element name="{$newName}">
			<xsl:apply-templates select="@*" mode="copy-of"/>						
			<xsl:apply-templates select="*"/>						
		</xsl:element>
	</xsl:template>
	
	
	<!-- Function bound variables -->
	<xsl:template match="ml:boundVars">
		<PARENS>
				<xsl:apply-templates select="../@unpaired" mode="copy-of"/>
				<xsl:apply-templates select="*[1]" mode="sequence"/>
		</PARENS>
	</xsl:template>
	
	<!-- Sequence construct -->
	<xsl:template match="ml:sequence">
		<xsl:apply-templates select="*[1]" mode="sequence"/>
	</xsl:template>
	
	<!-- Range variable with more than 2 components (computationally invalid, but possible to type in Mathcad) -->
	<xsl:template match="ml:range[count(*)>2]">
		<RANGE>
			<xsl:apply-templates select="*" mode="sequence"/>
		</RANGE>
	</xsl:template>
	
	<!-- lambda part of a lambda-based operator application (summation, integral, etc)-->
	<xsl:template name="lambdaOpBody">
		<xsl:apply-templates select="ml:lambda/ml:boundVars/*"/>
		<xsl:apply-templates select="ml:lambda/*[2]"/>
	</xsl:template>
	
	<xsl:template match="ml:lambda">
		<NAME>function</NAME>
	</xsl:template>
	
	<!-- Nth derivative -->
	<xsl:template match="ml:apply[ml:derivative[following-sibling::*[local-name()='degree']]]" priority="1">
		<NTH_DERIV>
			<xsl:apply-templates select="@style" mode="copy-of"/>
			<xsl:apply-templates select="ml:degree/*"/>
			<BIND>
				<xsl:call-template name="lambdaOpBody"/>
			</BIND>
		</NTH_DERIV>
	</xsl:template>
	
	<!-- Unbounded versions of derivative, product, integral, and summation -->
	<xsl:template match="ml:apply[(ml:derivative | ml:product | ml:integral | ml:summation) and not(ml:bounds)]">
		<xsl:variable name="newName">
			<xsl:apply-templates select="$lambdaOpsTop">
				<xsl:with-param name="mlname" select="local-name(*[1])"/>
				<xsl:with-param name="attrname">simple</xsl:with-param>
			</xsl:apply-templates>
		</xsl:variable>
		<xsl:element name="{$newName}">
			<xsl:apply-templates select="*[1]/@*" mode="copy-of"/>
			<xsl:call-template name="lambdaOpBody"/>
		</xsl:element>
	</xsl:template>
	
	<!-- Bounded versions of derivative, product, integral, and summation -->
	<xsl:template match="ml:apply[(ml:derivative | ml:product | ml:integral | ml:summation) and ml:bounds]">
		<xsl:variable name="newName">
			<xsl:apply-templates select="$lambdaOpsTop">
				<xsl:with-param name="mlname" select="local-name(*[1])"/>
				<xsl:with-param name="attrname">bounded</xsl:with-param>
			</xsl:apply-templates>
		</xsl:variable>
		<xsl:element name="{$newName}">
			<xsl:apply-templates mode="copy-of" select="*[1]/@*"/>
			<BIND>
				<xsl:apply-templates select="ml:bounds/*"/>
			</BIND>
			<BIND>
				<xsl:call-template name="lambdaOpBody"/>
			</BIND>
		</xsl:element>
	</xsl:template>
	
	<!-- Limits -->
	<xsl:template match="ml:apply[ml:limit]">
		<xsl:variable name="limname">
			<xsl:choose>
				<xsl:when test="ml:limit/@direction='right'">LIMITPLUS</xsl:when>
				<xsl:when test="ml:limit/@direction='left'">LIMITMIN</xsl:when>
				<xsl:otherwise>LIMIT</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="{$limname}">
			<xsl:apply-templates select="*[3]"/>
			<BIND>
				<xsl:call-template name="lambdaOpBody"/>
			</BIND>
		</xsl:element>
	</xsl:template>

	<xsl:template match="ml:apply[ml:absval]">
		<ABSVAL type="abs">
			<xsl:apply-templates select="*[position()>1]"/>
		</ABSVAL>					
	</xsl:template>	
	
	<!-- Internally, determinant is represented as ABSVAL -->
	<xsl:template match="ml:apply[ml:determinant]">
		<ABSVAL type="det">
			<xsl:apply-templates select="*[position()>1]"/>
		</ABSVAL>
	</xsl:template>	
	
	<!-- Provenance -->
	<xsl:template match="ml:provenance">
		<ANNOT>
			<xsl:apply-templates select="*" mode="provenance"/>
		</ANNOT>
	</xsl:template>
	
	<!-- copy these nodes as-is -->
	<xsl:template match="p:originRef | p:parentRef | p:comment | p:originComment | p:contentHash" mode="provenance">
		<xsl:element name="p:{local-name(.)}">
			<xsl:apply-templates mode="copy-of" select="* | @* | text()"/>
		</xsl:element>
<!--		<xsl:copy-of select="."/> -->
	</xsl:template>

	<!-- anything other than the above is math, apply normal matching rules-->
	<xsl:template match="*" mode="provenance">
		<xsl:apply-templates select="."/>
	</xsl:template>
	
	
	<!-- If..then statement -->
	<xsl:template match="ml:ifThen">	
		<IFTHEN>
			<xsl:apply-templates select="*[2]"/>
			<xsl:apply-templates select="*[1]"/>			
		</IFTHEN>
	</xsl:template>
	
	<!-- Foor loop -->
	<xsl:template match="ml:for">
		<FOR>			
			<xsl:apply-templates select="*[3]"/>
			<LOCAL_ASSIGN>
				<xsl:apply-templates select="*[1]"/>
				<xsl:apply-templates select="*[2]"/>
			</LOCAL_ASSIGN>
		</FOR>
	</xsl:template>
	
	<!-- While loop -->
	<xsl:template match="ml:while">
		<WHILE>
			<xsl:apply-templates select="*[2]"/>
			<xsl:apply-templates select="*[1]"/>
		</WHILE>
	</xsl:template>
	
	<!-- Try-catch construct -->
	<xsl:template match="ml:tryCatch">
		<ONERROR>
			<xsl:apply-templates select="*[2]"/>
			<xsl:apply-templates select="*[1]"/>
		</ONERROR>
	</xsl:template>
		
	<!-- Program -->
	<xsl:template match="ml:program">
		<xsl:apply-templates select="*[1]" mode="sequencecount">
			<!-- Pass in the number of elements to be sequenced -->
			<xsl:with-param name="nodes-to-sequence" select="count(*)"/>
			<xsl:with-param name="element-name">PROGRAM</xsl:with-param>
		</xsl:apply-templates>
		
	</xsl:template>
					
</xsl:stylesheet>
