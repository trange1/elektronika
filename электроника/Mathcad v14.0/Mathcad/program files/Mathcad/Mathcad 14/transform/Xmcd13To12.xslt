<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns="http://schemas.mathsoft.com/worksheet10" 
				xmlns:trans="urn:mc-transform-extension" 
				xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
				xmlns:wsold="http://schemas.mathsoft.com/worksheet20" 
				xmlns:mlold="http://schemas.mathsoft.com/math20" 
				xmlns:ws="http://schemas.mathsoft.com/worksheet10" 
				xmlns:ml="http://schemas.mathsoft.com/math10" 
				xmlns:u="http://schemas.mathsoft.com/units10" 
				xmlns:p="http://schemas.mathsoft.com/provenance10"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				exclude-result-prefixes="trans msxsl wsold mlold xsi">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:param name="transform-host">Unknown</xsl:param>
	
	<xsl:variable name="is-designate" select="$transform-host = 'Designate'"/>
	
	<!-- apply templates on all child nodes of the current context -->
	<xsl:template name="copy-all">
			<xsl:apply-templates select="* | @* | text() | processing-instruction() | comment()"/>
	</xsl:template>

	<!-- process the root node separately in order to get the default namespace and all the
		desired namespace aliases defined on it -->
	<xsl:template match="wsold:worksheet">
		<worksheet	xmlns="http://schemas.mathsoft.com/worksheet10"
					xmlns:ws="http://schemas.mathsoft.com/worksheet10" 
					xmlns:ml="http://schemas.mathsoft.com/math10" 
					xmlns:u="http://schemas.mathsoft.com/units10" 
					xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:call-template name="copy-all"/>
		</worksheet>
	</xsl:template>

	<!-- process all nodes that don't need change of namespace -->
	<xsl:template match="* | @* | processing-instruction() | comment()">
		<xsl:copy>
			<xsl:call-template name="copy-all"/>
		</xsl:copy>
	</xsl:template>
	
	<!-- unscramble locked regions, apply the templates on the regions, and then scramble them again -->
	<xsl:template match="wsold:item[@item-id=//wsold:confidentialArea/@item-idref]">
		<xsl:if test="not($is-designate)">
			<item>
				<xsl:variable name="is-compressed" select="@content-encoding = 'gzip'"/>			
				<xsl:apply-templates select="@*"/>
				<xsl:variable name="area">
					<xsl:apply-templates select="trans:Unscramble(string(),$is-compressed)"/>
				</xsl:variable>
				<xsl:value-of select="trans:Scramble($area,$is-compressed)"/>
			</item>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="wsold:confidentialArea">
		<xsl:choose>
			<!-- Designate throws out confidential areas -->
			<xsl:when test="$transform-host='Designate'"/> 
			<xsl:otherwise>
				<xsl:call-template name="change-namespace"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- keep the u namespace alias -->
	<xsl:template match="u:*">
		<xsl:call-template name="change-namespace">
			<xsl:with-param name="newns" select="'u:'"/>
		</xsl:call-template>
	</xsl:template>
	
	<!-- change the wsold namespace to the new ws namespace (which s/b the default namespace) -->
	<xsl:template match="wsold:*">
		<xsl:call-template name="change-namespace"/>
	</xsl:template>

	<!-- change the mlold namespace to the new ml namespace -->
	<xsl:template match="mlold:*">
		<xsl:call-template name="change-namespace">
			<xsl:with-param name="newns" select="'ml:'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- change the p namespace (for provenance elements) to the ml namespace -->
	<xsl:template match="p:*">
		<xsl:call-template name="change-namespace">
			<xsl:with-param name="newns" select="'ml:'"/>
		</xsl:call-template>
	</xsl:template>

	<!-- copy the current element keeping it's local name and applying the given namespace alias -->
	<xsl:template name="change-namespace">
		<!-- Default new namespace alias to default namespace for the document -->
		<xsl:param name="newns" select="''"/>
		<xsl:element name="{$newns}{local-name()}">
			<xsl:call-template name="copy-all"/>
		</xsl:element>
	</xsl:template>

	<!-- change the schema version -->
	<xsl:template match="wsold:worksheet/@version" >
		<xsl:attribute name="version">1.0.4</xsl:attribute>
	</xsl:template>
	
	<!-- strip print-single-page-width attribute -->
	<xsl:template match="wsold:pageModel/@print-single-page-width" >
	</xsl:template>
	
	<!-- convert <genfit method="levenberg-marquardt">...</genfit> to <id>genfit</id> -->
	<xsl:template match="mlold:genfit">
		<ml:id>genfit</ml:id>
	</xsl:template>
	
	<!-- strip originComment from provenance info -->
	<xsl:template match="p:originComment">
	</xsl:template>
	
	<!-- strip comment from worksheet metadata -->
	<xsl:template match="wsold:comment">
	</xsl:template>
	
	<!-- strip symbolic evaluation attributes -->
	<xsl:template match="wsold:operators/@symbolic-evaluation | mlold:symEval/@hide-lhs | mlold:symEval/@hide-keywords | mlold:symEval/@style">
	</xsl:template>
	
	<!-- convert new spaces in strings to old <sp> elements -->
	<xsl:template match="mlold:str[@xml:space = 'preserve']">
		<ml:str>
			<xsl:call-template name="spaces-to-sp-elements"/>				
		</ml:str>
	</xsl:template>
	
	<!-- remove remaining spacing attributes from <id> and <str> -->
	<xsl:template match="@xml:space">
	</xsl:template>

	<!-- convert polyroots to Polyroots -->
	<xsl:template match="mlold:polyroots">
		<ml:Polyroots>
			<xsl:call-template name="copy-all"/>
		</ml:Polyroots>
	</xsl:template>
	
	<!-- remove provenance from references -->
	<xsl:template match="wsold:reference/*">
	</xsl:template>
	
	<!-- remove presentation language settings -->
	<xsl:template match="wsold:language">
	</xsl:template>

	<!-- remove the zero-over-zero switch -->
	<xsl:template match="wsold:calculationBehavior/@zero-over-zero">
	</xsl:template>
	
	<!-- remove deprecation switches -->
	<xsl:template match="wsold:compatibility">
	</xsl:template>
	
	<!-- Transfer @hide-arguments from ws:component to ws:inputs/ws:outputs -->
	<xsl:template match="wsold:inputs|wsold:outputs">
		<xsl:element name="{local-name()}" namespace="http://schemas.mathsoft.com/worksheet10">
			<xsl:attribute name="hide">
				<xsl:value-of select="parent::wsold:component/@hide-arguments"/>
			</xsl:attribute>			
			<xsl:call-template name="copy-all"/>
		</xsl:element>		
	</xsl:template>
	
	<!-- Copy font attributes which exist in Math10 -->
	<xsl:template match="mlold:id/@font|mlold:real/@font|mlold:imag/@font"  priority="1">
		<xsl:copy />
	</xsl:template>
	
	<!-- Eat all other font attributes (added in Math20)-->
	<xsl:template match="mlold:*/@font" priority="0" />
	
	<!--Remove ws:component/@hide-arguments -->
	<xsl:template match="wsold:component/@hide-arguments" />
	
	<!--Remove z-order attribute -->
	<xsl:template match="wsold:region/@z-order" />
	
		<!-- Convert runs of spaces to sp elements. -->
	<xsl:template name="spaces-to-sp-elements">
		<!-- text we're working on -->
		<xsl:param name="text" select="string(.)"/>
		<!-- number of contiguous spaces we've seen so far -->
		<xsl:param name="spnum" select="number(0)"/>		
		<xsl:choose>
			<xsl:when test="string-length($text)=0 and $spnum &gt; 0">
			</xsl:when>
			<!-- End condition, empty string -->
			<xsl:when test="string-length($text)=0">
				<!-- Output trailing spaces, if necessary -->
				<xsl:if test="$spnum &gt; 0">
					<xsl:call-template name="make-sp">
						<xsl:with-param name="num" select="$spnum"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<!-- End condition: entire remaining string is non-spaces -->
			<xsl:when test="string-length(substring-before($text,' '))=0">
				<xsl:value-of select="$text"/>
			</xsl:when>
			<!-- $text begins with a space, increment the counter and recurse
				 starting at the next character. -->
			<xsl:when test="starts-with($text,' ')">
				<xsl:call-template name="spaces-to-sp-elements">
					<xsl:with-param name="text" select="substring-after($text,' ')"/>
					<xsl:with-param name="spnum" select="$spnum+1"/>
				</xsl:call-template>
			</xsl:when>
			<!-- We are not done yet, $text begins with a non-space, and there is at least one more space
					somewhere down the line -->
			<xsl:otherwise>			
				<!-- if a sp element is waiting, write it out -->
				<xsl:if test="$spnum &gt; 0">
					<xsl:call-template name="make-sp">
						<xsl:with-param name="num" select="$spnum"/>
					</xsl:call-template>
				</xsl:if>
				<!-- Get the non-space characters up to the next space -->
				<xsl:variable name="next-word" select="substring-before($text,' ')"/>
				<!-- Output the next word -->
				<xsl:value-of select="$next-word"/>				
				<!-- Recurse starting at the character after $next-word -->
				<xsl:call-template name="spaces-to-sp-elements">
					<xsl:with-param name="text" select="substring($text,string-length($next-word)+1)"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Construct a sp element with the given num attribute.  @num is omitted if its value is 1, since this is the default -->
	<xsl:template name="make-sp">
		<xsl:param name="num" select="'1'"/>
		<sp>			
			<xsl:if test="$num &gt; 1">
				<xsl:attribute name="num"><xsl:value-of select="$num"/></xsl:attribute>
			</xsl:if>			
		</sp>
	</xsl:template>

	<!-- strip @exclude-large-results -->
	<xsl:template match="wsold:fileFormat/@exclude-large-results"/>

	<!-- strip @screen-dpi -->
	<xsl:template match="wsold:fileFormat/@screen-dpi"/>

	<!-- strip savedOn -->
	<xsl:template match="wsold:identityInfo/savedOn"/>

	<!-- get unit-system attribute from currentUnitSystem and strip customUnitSystem -->
	<xsl:template match="wsold:calculation/wsold:units">
		<units unit-system="{wsold:currentUnitSystem/@name}"/>
	</xsl:template>
	
	<!-- Fix the changed attribute names of dimensionNames -->
	<!-- thermodynamic-temperature to temperature -->
	<xsl:template match="wsold:dimensionNames/@thermodynamic-temperature">
		<xsl:attribute name="temperature"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
	
	<!-- luminous-intensity to luminosity -->
	<xsl:template match="wsold:dimensionNames/@luminous-intensity">
		<xsl:attribute name="luminosity"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
	
	<!-- amount-of-substance to substance -->
	<xsl:template match="wsold:dimensionNames/@amount-of-substance">
		<xsl:attribute name="substance"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
		
	<!--Remove fractional-unit-exponent attribute -->
	<xsl:template match="wsold:mathRendering/wsold:results/wsold:unit/@fractional-unit-exponent" />
	
	<!--Remove expr-id attribute-->
	<xsl:template match="@expr-id"/>
	
	<!--Remove element-image-map element-->
	<xsl:template match="wsold:element-image-map"/>
	
	<!--ml:id/@subscript-size-->
	<xsl:template match="mlold:id/@subscript-size"/>
	
   <!-- remove the point-release data MC12 does not have any, and crashes if it is there -->
   <xsl:template match="wsold:pointReleaseData"/>
   
</xsl:stylesheet>
