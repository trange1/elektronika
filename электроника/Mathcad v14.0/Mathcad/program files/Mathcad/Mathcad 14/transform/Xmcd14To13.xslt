<?xml version="1.0"?>
<!--
 ******** Copyright © 2006-2006 Parametric Technology Corporation      ********

   $Workfile:: Xmcd14To13.xslt                                                $
   $Revision:: 24                                                             $
     $Author:: nkojuharov                                                     $
       $Date:: 2007-03-06 18:01:35-05:00                                      $
 $NoKeywords::                                                                $

     Created:: April 6, 2006
      Author:: Nikolay Kojuharov

	This transform converts a Mathcad 14 xml document to a Mathcad 13 xml
	document. It requires several extension functions to work correctly.
	
	ADD NEW TEMPLATES AT THE BOTTOM OF THIS FILE!

 ******************************************************************************
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns="http://schemas.mathsoft.com/worksheet20" 
				xmlns:trans="urn:mc-transform-extension" 
				xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
				xmlns:n="urn:language-map"
				xmlns:wsold="http://schemas.mathsoft.com/worksheet30" 
				xmlns:mlold="http://schemas.mathsoft.com/math30" 
				xmlns:ws="http://schemas.mathsoft.com/worksheet20" 
				xmlns:ml="http://schemas.mathsoft.com/math20" 
				xmlns:u="http://schemas.mathsoft.com/units10" 
				xmlns:p="http://schemas.mathsoft.com/provenance10"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				xmlns:prd="http://schemas.mathsoft.com/point-release-data-13-1"
				exclude-result-prefixes="trans msxsl wsold mlold xsi prd">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:param name="transform-host">Unknown</xsl:param>
	
	<xsl:variable name="is-designate" select="$transform-host = 'Designate'"/>
	<xsl:variable name="greekchars" select="'ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρςστυφχψωϕϖϑ'"/>
	<xsl:variable name="latinchars" select="'ABGDEZHQIKLMNXOPRSTUFCYWabgdezhqiklmnxoprVstufcywjvJ'"/>
	
	<!-- "chars" variables used to swap characters between 13 and 14 files (aed 12/22/06) -->
	<xsl:variable name="chars-13" select="'φϕ&#x23D0;'"/>
	<xsl:variable name="chars-14" select="'ϕφ|'"/>
	
	<n:languages>
		<n:language value="EN"/>
		<n:language value="DE"/>
		<n:language value="FR"/>
		<n:language value="JP"/>
		<n:language value="DA"/>
		<n:language value="NL"/>
		<n:language value="FI"/>
		<n:language value="IT"/>
		<n:language value="NO"/>
		<n:language value="PT"/>
		<n:language value="ES"/>
		<n:language value="SV"/>
		<n:language value="BG"/>
		<n:language value="HU"/>
		<n:language value="RU"/>
		<n:language value="EL"/>
		<n:language value="KO"/>
		<n:language value="ZH"/>
	</n:languages>
	
	<xsl:variable name="languages" select="document('')/*/n:languages/n:language/@value"/>

  <!-- apply templates on all child nodes of the current context -->
  <xsl:template name="copy-all">
    <xsl:apply-templates select="* | @* | text() | processing-instruction() | comment()"  />
  </xsl:template>

  <!-- process all nodes that don't need change of namespace -->
  <xsl:template match="* | @* | processing-instruction() | comment()">
    <xsl:copy>
      <xsl:call-template name="copy-all"/>
    </xsl:copy>
  </xsl:template>

  <!-- copy the current element keeping its local name and applying the given namespace alias -->
  <xsl:template name="change-namespace">
    <!-- Default new namespace alias to default namespace for the document -->
    <xsl:param name="newns" select="''"/>
    <xsl:element name="{$newns}{local-name()}">
      <xsl:call-template name="copy-all"/>
    </xsl:element>
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

  <!-- change the wsold namespace to the new ws namespace (which should be the default namespace) -->
  <xsl:template match="wsold:*">
    <xsl:call-template name="change-namespace"/>
  </xsl:template>

  <!-- change the mlold namespace to the new ml namespace -->
  <xsl:template match="mlold:*">
    <xsl:call-template name="change-namespace">
      <xsl:with-param name="newns" select="'ml:'"/>
    </xsl:call-template>
  </xsl:template>

  <!-- keep the 'u' namespace alias. this is not really necessary, but are 
	here because we want the XML output to contain the namespace prefixes -->
  <xsl:template match="u:*">
    <xsl:call-template name="change-namespace">
      <xsl:with-param name="newns" select="'u:'"/>
    </xsl:call-template>
  </xsl:template>

  <!-- keep the 'p' namespace alias. this is not really necessary, but are 
	here because we want the XML output to contain the namespace prefixes -->
  <xsl:template match="p:*">
    <xsl:call-template name="change-namespace">
      <xsl:with-param name="newns" select="'p:'"/>
    </xsl:call-template>
  </xsl:template>

  <!-- change the schema version -->
  <xsl:template match="wsold:worksheet/@version" >
    <xsl:attribute name="version">2.0.2</xsl:attribute>
  </xsl:template>

  <!-- process the root node separately in order to get the default namespace and all the
		desired namespace aliases defined on it -->
  <xsl:template match="wsold:worksheet">
    <worksheet 
					xmlns="http://schemas.mathsoft.com/worksheet20"
					xmlns:ws="http://schemas.mathsoft.com/worksheet20" 
					xmlns:ml="http://schemas.mathsoft.com/math20" 
					xmlns:u="http://schemas.mathsoft.com/units10" 
					xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
					xmlns:prd="http://schemas.mathsoft.com/point-release-data-13-1">
      <xsl:call-template name="copy-all"/>
    </worksheet>
  </xsl:template>

  <!-- 
	//******************************************************************************
	//
	// All templates above this line are necessary in every version of this 
	// transform.  When creating a new transform, use the templates above, change
	// the old and new namespaces and the schema version.
	//
	// Add custom conversion templates below and make sure reciprocal
    // conversions exist in the reciprocal transform!
	//
	//******************************************************************************
	-->

  <!-- convert new Unicode encrypted passwords -->
  <xsl:template match="wsold:area/@password">
    <xsl:attribute name="password">
      <xsl:value-of select="trans:MakeAnsiPassword(string())"/>
    </xsl:attribute>
  </xsl:template>

  <!-- convert new Unicode strings to byte strings -->
  <xsl:template match="mlold:str">
    <ml:str xml:space="preserve"><xsl:value-of select="trans:MakeByteString(string())"/></ml:str>
  </xsl:template>

  <xsl:template match="wsold:picture[wsold:metafile]">
    <ws:metafile>
      <xsl:copy-of select="wsold:metafile/@*"/>
    </ws:metafile>
  </xsl:template>

  <!-- Translate raster picture regions (jpg or png )into old-style png regions -->
  <xsl:template match="wsold:picture[wsold:png|wsold:jpg]">
    <ws:png>
      <xsl:copy-of select="wsold:*/@item-idref"/>
      <xsl:copy-of select="wsold:*/@display-width"/>
      <xsl:copy-of select="wsold:*/@display-height"/>
    </ws:png>
  </xsl:template>

  <!-- Binary data for jpg picture regions must be converted to png format -->
  <xsl:template match="wsold:binaryContent/wsold:item[@item-id=//wsold:picture/wsold:jpg/@item-idref]/node()">
    <xsl:value-of select="trans:ConvertJPG64ToPNG64(string())"/>
  </xsl:template>

  <!-- convert image regions with a sub-type of png to png regions -->
  <xsl:template match="mlold:picture">
    <xsl:call-template name="copy-all"/>
  </xsl:template>

  <!-- convert Fixed ODE option to Adams/BDF (auto) -->
  <xsl:template match="mlold:Odesolve/@method[string()='adams/bdf (auto)']">
    <xsl:attribute name="method">fixed</xsl:attribute>
  </xsl:template>

  <!-- convert Stiff ODE option to Radau -->
  <xsl:template match="mlold:Odesolve/@method[string()='radau']">
    <xsl:attribute name="method">stiff</xsl:attribute>
  </xsl:template>

  <!-- convert point release data -->
  <xsl:template match="*" mode="point-release">
    <xsl:variable name="region-id" select="ancestor::*/@region-id"/>

    <xsl:if test="@placeholderMultiplicationStyle">
      <prd:placeholderMultiplicationStyle>
        <xsl:attribute name="value">
          <xsl:value-of select="@placeholderMultiplicationStyle"/>
        </xsl:attribute>
        <xsl:attribute name="region-id">
          <xsl:value-of select="$region-id"/>
        </xsl:attribute>
      </prd:placeholderMultiplicationStyle>
    </xsl:if>

    <xsl:if test="@resultMultiplicationStyle">
      <prd:resultMultiplicationStyle>
        <xsl:attribute name="value">
          <xsl:value-of select="@resultMultiplicationStyle"/>
        </xsl:attribute>
        <xsl:attribute name="region-id">
          <xsl:value-of select="$region-id"/>
        </xsl:attribute>
      </prd:resultMultiplicationStyle>
    </xsl:if>
  </xsl:template>

  <!-- if we don't already have pointReleaseData, create one -->
  <xsl:template match="wsold:worksheet[ not(wsold:pointReleaseData) ]">
    <worksheet 
					xmlns="http://schemas.mathsoft.com/worksheet20"
					xmlns:ws="http://schemas.mathsoft.com/worksheet20" 
					xmlns:ml="http://schemas.mathsoft.com/math20" 
					xmlns:u="http://schemas.mathsoft.com/units10" 
					xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
					xmlns:prd="http://schemas.mathsoft.com/point-release-data-13-1">

      <xsl:apply-templates select="@*"  />

      <ws:pointReleaseData>
        <xsl:apply-templates select="//mlold:eval" mode="point-release"/>
      </ws:pointReleaseData>

      <xsl:call-template name="copy-all"/>
    </worksheet>
  </xsl:template>

  <!-- if we already have pointReleaseData -->
  <xsl:template match="wsold:pointReleaseData">
    <ws:pointReleaseData>
      <xsl:apply-templates select="//mlold:eval" mode="point-release"/>
    </ws:pointReleaseData>
  </xsl:template>

  <!-- remove eval attributes that go into pointReleaseData -->
  <xsl:template match="mlold:eval/@placeholderMultiplicationStyle | mlold:eval/@resultMultiplicationStyle">
  </xsl:template>

  <!-- make sure complex threshold doesn't exceed 63 -->
  <xsl:template match="@complex-threshold[number(string()) > 63]">
    <xsl:attribute name="complex-threshold">63</xsl:attribute>
  </xsl:template>

  <!-- remove zero-threshold attribute from local result format -->
  <xsl:template match="wsold:resultFormat//@zero-threshold">
  </xsl:template>

  <!-- remove imaginary-value attribute from local result format -->
  <xsl:template match="wsold:resultFormat//@imaginary-value">
  </xsl:template>

  <!-- remove fractional-unit-exponent attribute from local result format -->
  <xsl:template match="wsold:resultFormat//@fractional-unit-exponent">
  </xsl:template>

  <!-- remove the "numeric-only" attribute on document result format -->
  <xsl:template match="wsold:results/@numeric-only">
  </xsl:template>

  <!-- remove the "numeric-only" attribute on reqion result format -->
  <xsl:template match="wsold:resultFormat/@numeric-only">
  </xsl:template>

  <!-- remove worksheet protection element -->
  <xsl:template match="wsold:protection">
  </xsl:template>

  <!-- Move worksheet protection/@protection-level to the editor/@protection-level -->
  <xsl:template match="wsold:editor">
    <ws:editor>
      <xsl:if test="wsold:protection">
        <xsl:attribute name="protection-level">
          <xsl:value-of select="wsold:protection/@protection-level"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="@*|*"/>
    </ws:editor>
  </xsl:template>
  
  <!-- numeric definitions (x := 1 = ) should be saved with only the left-hand side of the evaluation as the body of the definition --> 
  <xsl:template match="mlold:eval[parent::mlold:define]">
	  <xsl:apply-templates select="*[1]"/>
  </xsl:template>
  
  <!-- just remove any mention of currency as the quantity name in the custom unit system spec -->
  <xsl:template match="wsold:customUnitSystem//wsold:unit[@quantity-name='money']"/>

  <!-- Replace greek letters in text regions with latin letters formatted with the symbol font -->
  <xsl:template match="wsold:text//text()[count(ancestor::wsold:math) = 0]">
    <xsl:call-template name="text-greek-w-symbol"/>
  </xsl:template>

  <!--
	Algorithm:
	Split text on greek char giving 3 parts, text before, greek char, text after
	If text before is all space characters (s/b just 1) replace it w/ sp element
	replace greek char w/ <f family="Symbol" charset="2">latin transform of greek char</f>
	Recurse with text after.
  -->
  <xsl:template name="text-greek-w-symbol">
    <xsl:param name="str" select="string(.)"/>

	<xsl:choose>
	  <xsl:when test="translate($str, $greekchars, $latinchars) != $str">
		  <!-- find the position of the greek character -->
		<xsl:variable name="gpos">
		  <xsl:call-template name="find-first-of">
			<xsl:with-param name="str" select="$str"/>
			<xsl:with-param name="flist" select="$greekchars"/>
		  </xsl:call-template>
		</xsl:variable>
		
		<!-- process text before greek char -->
		<xsl:variable name="before" select="substring($str, 1, $gpos - 1)"/>
		<xsl:choose>
		  <!-- Assume we don't have to worry about multiple spaces because Mathcad will always
			   write them as sp elements -->
		  <xsl:when test="$before = ' '">
			<sp/>
		  </xsl:when>
		  <xsl:otherwise>
			<xsl:value-of select="$before"/>
		  </xsl:otherwise>
		</xsl:choose>
	
		<!-- process greek char -->
		<f family="Symbol" charset="2"><xsl:value-of select="translate(substring($str, $gpos, 1), $greekchars, $latinchars)"/></f>
	
		<!-- process text after greek char -->
		<xsl:call-template name="text-greek-w-symbol">
		  <xsl:with-param name="str" select="substring($str, $gpos + 1)"/>
		</xsl:call-template>
	  </xsl:when>
	  <xsl:otherwise>
	    <!-- no greek char in str, since this could be the text after a greek char, if it's
             a single space character replace it with an sp element otherwise just output it -->
		<xsl:choose>
		  <!-- Assume we don't have to worry about multiple spaces because Mathcad will always
			   write them as sp elements -->
		  <xsl:when test="$str = ' '">
			<sp/>
		  </xsl:when>
		  <xsl:otherwise>
			<xsl:value-of select="$str"/>
		  </xsl:otherwise>
		</xsl:choose>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>

  <!-- Return the position in 'str' of the 1st character that is in 'flist', starting at 'spos'
       'spos' defaults to starting at the 1st character of 'str' -->
  <xsl:template name="find-first-of">
    <xsl:param name="str"/>
    <xsl:param name="flist"/>
    <xsl:param name="spos" select="1"/>
   
    <xsl:choose>
      <xsl:when test="$spos > string-length($str)"><xsl:value-of select="-1"/></xsl:when>
      <xsl:when test="contains($flist, substring($str, $spos, 1))"><xsl:value-of select="$spos"/></xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="find-first-of">
          <xsl:with-param name="str" select="$str"/>
          <xsl:with-param name="flist" select="$flist"/>
          <xsl:with-param name="spos" select="$spos + 1"/>
		</xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  	<!-- This template swaps the phi characters and the parallel bar character. 
			MC 14 renders the phi characters opposite of MC 13, because of an update in the Unicode standard, and swapping the characters preserves 
			the onscreen rendering of the character as it was originally authored. (aed 12/21/06)  -->	
	<xsl:template match="wsold:math//text()">
		<xsl:value-of select="translate(., $chars-14, $chars-13)"/>
	</xsl:template>
	
	<!-- translate xs:language type languages to Mathcad 13's languageType enumeration.
			ZH-HANT and ZH-HANS will become ZH
			JA will become JP
			other supported languages will be uppercased
			languages that don't exist in Mathcad 13 will be replaced with EN
	-->
	<xsl:template match="@*" mode="translate-lang">
		<xsl:variable name="upper">
			<xsl:value-of select="translate( ., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
		</xsl:variable>
		
		<xsl:variable name="enum" select="msxsl:node-set($languages)[ . = $upper ]"/>
		
		<xsl:choose>
			<xsl:when test="$enum"><xsl:value-of select="$upper"/></xsl:when>
			<xsl:when test="$upper = 'ZH-HANT' ">ZH</xsl:when>
			<xsl:when test="$upper = 'ZH-HANS' ">ZH</xsl:when>
			<xsl:when test="$upper = 'JA' ">JP</xsl:when>
			<xsl:otherwise>EN</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- convert language strings -->
	<xsl:template match="wsold:language/@*">
		<xsl:attribute name="{local-name()}">
			<xsl:apply-templates select="." mode="translate-lang"/>
		</xsl:attribute>
	</xsl:template>
  
</xsl:stylesheet>