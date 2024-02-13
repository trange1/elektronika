<?xml version="1.0" encoding="UTF-8"?>
<!--
 ******** Copyright © Parametric Technology Corporation. ********

   $Workfile:: Xmcd13To14.xslt                                                $
   $Revision:: 21                                                             $
     $Author:: adonahue                                                       $
       $Date:: 2007-06-05 16:41:26-04:00                                      $
 $NoKeywords::                                                                $

     Created:: April 6, 2006
      Author:: Nikolay Kojuharov

	This transform converts a Mathcad 13 xml document to a Mathcad 13.5 xml
	document. It requires several extension functions to work correctly.

	ADD NEW TEMPLATES AT THE BOTTOM OF THIS FILE!

 ******************************************************************************
-->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:trans="urn:mc-transform-extension"
				xmlns:msxsl="urn:schemas-microsoft-com:xslt"
				xmlns:wsold="http://schemas.mathsoft.com/worksheet20"
				xmlns:mlold="http://schemas.mathsoft.com/math20"
				xmlns:ws="http://schemas.mathsoft.com/worksheet30"
				xmlns:ml="http://schemas.mathsoft.com/math30"
				xmlns:u="http://schemas.mathsoft.com/units10"
				xmlns:p="http://schemas.mathsoft.com/provenance10"
				xmlns:prd="http://schemas.mathsoft.com/point-release-data-13-1"
				exclude-result-prefixes="trans msxsl wsold mlold ws ml u p prd">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<!-- "chars" variables used to swap characters between 13 and 14 files (aed 12/22/06) -->
	<xsl:variable name="chars-13" select="'φϕ&#x23D0;'"/>
	<xsl:variable name="chars-14" select="'ϕφ|'"/>

	<!-- remember the zero threshold attribute of the global result format -->
	<xsl:variable name="zerotol" select="//wsold:mathRendering/wsold:results//@zero-threshold"/>
	
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

	<!-- copy the current element keeping it's local name and applying the given namespace alias -->
	<xsl:template name="change-namespace">
		<!-- Default new namespace alias to default namespace for the document -->
		<xsl:param name="newns" select="''"/>
		<xsl:element name="{$newns}{local-name()}">
			<xsl:call-template name="copy-all"/>
		</xsl:element>
	</xsl:template>

	<!-- unscramble locked regions, apply the templates on the regions, and then scramble them again -->
	<xsl:template match="wsold:item[@item-id=//wsold:confidentialArea/@item-idref]">
		<ws:item>
			<xsl:variable name="is-compressed" select="@content-encoding = 'gzip'"/>
			<xsl:apply-templates select="@*"/>
			<xsl:variable name="area">
				<xsl:apply-templates select="trans:Unscramble(string(),$is-compressed)"/>
			</xsl:variable>
			<xsl:value-of select="trans:Scramble($area,$is-compressed)"/>
		</ws:item>
	</xsl:template>

	<!-- change the ws namespace -->
	<xsl:template match="wsold:*">
		<xsl:element name="{local-name()}" namespace="http://schemas.mathsoft.com/worksheet30">
			<xsl:call-template name="copy-all"/>
		</xsl:element>
	</xsl:template>

	<!-- change the ml namespace -->
	<xsl:template match="mlold:*">
		<xsl:element name="{local-name()}" namespace="http://schemas.mathsoft.com/math30">
			<xsl:apply-templates select="@* | * | text() | processing-instruction() | comment()" />
		</xsl:element>
	</xsl:template>

	<!-- change the schema version -->
	<xsl:template match="wsold:worksheet/@version" >
		<xsl:attribute name="version">3.0.3</xsl:attribute>
	</xsl:template>

	<!-- strip numeric results -->
	<xsl:template match="mlold:result" >
	</xsl:template>

	<!-- strip images for regions -->
	<xsl:template match="wsold:item[@item-id=//wsold:rendering/@item-idref]"  >
	</xsl:template>

	<!-- strip rendering tags -->
	<xsl:template match="wsold:rendering"  >
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

	<!-- convert old byte encrypted passwords -->
	<xsl:template match="wsold:area/@password">
		<xsl:attribute name="password"><xsl:value-of select="trans:MakeUnicodePassword(string())"/></xsl:attribute>
	</xsl:template>
	
	<!-- convert old byte strings to Unicode strings -->
	<xsl:template match="mlold:str">
		<ml:str xml:space="preserve"><xsl:value-of select="trans:MakeUnicodeString(string())"/></ml:str>
	</xsl:template>

  <!-- convert png regions to image regions with a sub-type of png -->
	<xsl:template match="wsold:png|wsold:metafile">
		<ws:picture>
			<xsl:element namespace="http://schemas.mathsoft.com/worksheet30" name="{local-name()}">
				<xsl:call-template name="copy-all"/>
			</xsl:element>
		</ws:picture>
	</xsl:template>  
  
	<!-- convert Fixed ODE option to Adams/BDF (auto) -->
	<xsl:template match="mlold:Odesolve/@method[string()='fixed']">
		<xsl:attribute name="method">adams/bdf (auto)</xsl:attribute>
	</xsl:template>
	
	<!-- convert Stiff ODE option to Radau -->
	<xsl:template match="mlold:Odesolve/@method[string()='stiff']">
		<xsl:attribute name="method">radau</xsl:attribute>
	</xsl:template>
	
	<!-- convert point release data -->
	<xsl:template match="mlold:eval">
		<ml:eval>
			<xsl:variable name="region-id" select="ancestor::region/@region-id"/>

			<!-- copy OVALUE miltiplication style from point-release data -->
			<xsl:variable name="placeholderMultiplicationStyle" select="//prd:placeholderMultiplicationStyle[@region-id = $region-id]/@value"/>
			<xsl:if test="$placeholderMultiplicationStyle">
				<xsl:attribute name="placeholderMultiplicationStyle"><xsl:value-of select="string($placeholderMultiplicationStyle)"/></xsl:attribute>
			</xsl:if>

			<!-- copy ODISP miltiplication style from point-release data -->
			<xsl:variable name="resultMultiplicationStyle" select="//prd:resultMultiplicationStyle[@region-id = $region-id]/@value"/>
			<xsl:if test="$resultMultiplicationStyle">
				<xsl:attribute name="resultMultiplicationStyle"><xsl:value-of select="string($resultMultiplicationStyle)"/></xsl:attribute>
			</xsl:if>

			<xsl:call-template name="copy-all"/>
		</ml:eval>
	</xsl:template>
	
	<xsl:template match="wsold:pointReleaseData">
	</xsl:template>
	
	<xsl:template match="wsold:editor/@protection-level"/>
	
   <!-- move protection-level attribute into the new protection subelement -->
	<xsl:template match="wsold:editor">
		<ws:editor>		
			<xsl:apply-templates select="wsold:*|@*"/>
			<xsl:if test="string(@protection-level) != 'none'">
				<ws:protection protection-level="{@protection-level}"/>
			</xsl:if>			
		</ws:editor>
	</xsl:template>
	
	<!-- if a local result format doesn't have zero-threshold attribute, copy the attribute from the global format -->
	<xsl:template match="wsold:resultFormat/*[position() = 1 and not(@zero-threshold)]">
		<xsl:element name="{local-name()}" namespace="http://schemas.mathsoft.com/worksheet30">
			<xsl:apply-templates select="$zerotol"/>
			<xsl:call-template name="copy-all"/>
		</xsl:element>
	</xsl:template>

	  	<!-- These templates swaps the phi characters and the parallel bar character. 
			MC 14 renders the phi characters opposite of MC 13, because of an update in the Unicode standard, and swapping the characters preserves 
			the onscreen rendering of the character as it was originally authored. (aed 12/21/06)  -->	
	<xsl:template match="wsold:math//text()">
		<xsl:value-of select="translate(., $chars-13, $chars-14)"/>
	</xsl:template>
		<!-- This template matches math attributes (like "subscript") that contain the translatable characters. name(), rather than local-name() is delibrately used 
			to ensure the xml:space attribute is properly qualified. (aed 05/29/07) -->
	<xsl:template match="mlold:*//@*">
		<xsl:attribute name="{name()}">
			<xsl:value-of select="translate(., $chars-13, $chars-14)"/>
		</xsl:attribute>
	</xsl:template>

	<!-- change the JP language enumeration to JA -->
	<xsl:template match="wsold:language/@*[. = 'JP']">
		<xsl:attribute name="{local-name()}">ja</xsl:attribute>
	</xsl:template>

	<!-- lower-case all other language attributes -->
	<xsl:template match="wsold:language/@*[. != 'JP']">
		<xsl:attribute name="{local-name()}">
			<xsl:value-of select="translate( ., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
		</xsl:attribute>
	</xsl:template>

</xsl:stylesheet>
