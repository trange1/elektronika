<?xml version="1.0" encoding="UTF-8"?>
<!--
 ******** Copyright © Parametric Technology Corporation. ********

   $Workfile:: Xmcd12To13.xslt                                                 $
   $Revision:: 14                                                             $
     $Author:: cghaddar                                                       $
       $Date:: 2006-10-19 16:12:22-04:00                                      $
 $NoKeywords::                                                                $

     Created:: April 12, 2005
      Author:: Nikolay Kojuharov

	This transform converts a Mathcad 12 xml document to a Mathcad 13 xml
	document. It requires several extension functions to work correctly.

 ******************************************************************************
-->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:trans="urn:mc-transform-extension"
				xmlns:msxsl="urn:schemas-microsoft-com:xslt"
				xmlns:wsold="http://schemas.mathsoft.com/worksheet10"
				xmlns:mlold="http://schemas.mathsoft.com/math10"
				xmlns:ws="http://schemas.mathsoft.com/worksheet20"
				xmlns:ml="http://schemas.mathsoft.com/math20"
				xmlns:u="http://schemas.mathsoft.com/units10"
				xmlns:p="http://schemas.mathsoft.com/provenance10"
				exclude-result-prefixes="trans msxsl wsold mlold ws ml u p">

	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

	<!-- apply templates on all child nodes of the current context -->
	<xsl:template name="copy-all">
			<xsl:apply-templates select="* | @* | text() | processing-instruction() | comment()"  />
	</xsl:template>

	<!-- process all non-element nodes (i.e. nodes that don't need change of namespace) -->
	<xsl:template match="@* | processing-instruction() | comment()">
		<xsl:copy>
			<xsl:call-template name="copy-all"/>
		</xsl:copy>
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
		<xsl:element name="{local-name()}" namespace="http://schemas.mathsoft.com/worksheet20">
			<xsl:call-template name="copy-all"/>
		</xsl:element>
	</xsl:template>

	<!-- change the ml namespace -->
	<xsl:template match="mlold:*">
		<xsl:element name="{local-name()}" namespace="http://schemas.mathsoft.com/math20">
			<xsl:apply-templates select="@* | * | text() | processing-instruction() | comment()" />
		</xsl:element>
	</xsl:template>

	<!-- change the schema version -->
	<xsl:template match="wsold:worksheet/@version" >
		<xsl:attribute name="version">2.0.2</xsl:attribute>
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

	<!-- add print-single-page-width attribute (not really necessary since it is optional) -->
	<xsl:template match="wsold:pageModel"  >
		<ws:pageModel print-single-page-width="false">
			<xsl:call-template name="copy-all"/>
		</ws:pageModel>
	</xsl:template>

	<!-- change the prefix of provenance tags from ml: to p: -->
	<xsl:template match="mlold:originRef | mlold:parentRef | mlold:comment | mlold:contentHash | mlold:hash"  >
		<xsl:element name="{local-name(.)}" namespace="http://schemas.mathsoft.com/provenance10">
			<xsl:call-template name="copy-all"/>
		 </xsl:element>
	</xsl:template>

	<!-- convert <apply><id>genfit</id>...</apply> to <genfit method="levenberg-marquardt">...</genfit> -->
	<xsl:template match="mlold:id[string() = 'genfit' and local-name(..) = 'apply' and position() = 1]">
		<ml:genfit method="levenberg-marquardt" />
	</xsl:template>

	<xsl:template match="mlold:str">
		<ml:str xml:space="preserve"><xsl:value-of select="trans:ElementsToSpace(* | text())"/></ml:str>
	</xsl:template>

	<xsl:template match="mlold:id">
		<ml:id xml:space="preserve"><xsl:call-template name="copy-all"/></ml:id>
	</xsl:template>

	<!-- convert Polyroots to polyroots -->
	<xsl:template match="mlold:Polyroots">
		<ml:polyroots>
			<xsl:call-template name="copy-all"/>
		</ml:polyroots>
	</xsl:template>

	<!-- add NULL provenance to references -->
	<xsl:template match="wsold:reference">
		<ws:reference>
			<p:originRef doc-id="00000000-0000-0000-0000-000000000000" branch-id="00000000-0000-0000-0000-000000000000" version-id="00000000-0000-0000-0000-000000000000" revision-num="0" region-id="0"/>
			<p:parentRef doc-id="00000000-0000-0000-0000-000000000000" branch-id="00000000-0000-0000-0000-000000000000" version-id="00000000-0000-0000-0000-000000000000" revision-num="0" region-id="0"/>
			<p:contentHash/>
		</ws:reference>
	</xsl:template>

	<!-- add compatibility switches with the MC12 behavior -->
	<xsl:template match="wsold:calculationBehavior">
		<ws:calculationBehavior>
			<xsl:call-template name="copy-all"/>
			<xsl:attribute name="zero-over-zero">0</xsl:attribute>
			<ws:compatibility local-assignment="MC12" multiple-assignment="MC12"/>
		</ws:calculationBehavior>
	</xsl:template>

	<!-- 13 Schema Cleanup Enforcement -->

	<!-- transfer the inputs @hide-arguments up to the component element -->
	<xsl:template match="wsold:component">
		<ws:component hide-arguments="{wsold:inputs/@hide}">
			<xsl:apply-templates select="*|@*"/>
		</ws:component>
	</xsl:template>

	<!-- Remove math export attribute -->
	<xsl:template match="wsold:math/@export">
	</xsl:template>

	<!-- Remove @hide-arguments from inputs/outputs (moved up to ws:component) -->
	<xsl:template match="wsold:inputs/@hide|wsold:outputs/@hide">
	</xsl:template>

	<!-- Remove @show-trailing-zeros fraction result format -->
	<xsl:template match="wsold:fraction/@show-trailing-zeros">
	</xsl:template>

	<!-- strip @save-numeric-results from fileFormat - this will make it true implicitly -->
	<xsl:template match="wsold:fileFormat/@save-numeric-results">
	</xsl:template>

	<!-- Fix the changed attribute names of dimensionNames -->
		<!-- temperature to thermodynamic-temperature -->
		<xsl:template match="wsold:dimensionNames/@temperature">
			<xsl:attribute name="thermodynamic-temperature"><xsl:value-of select="."/></xsl:attribute>
		</xsl:template>

		<!-- luminosity to luminous-intensity -->
		<xsl:template match="wsold:dimensionNames/@luminosity">
			<xsl:attribute name="luminous-intensity"><xsl:value-of select="."/></xsl:attribute>
		</xsl:template>

		<!-- substance to amount-of-substance -->
		<xsl:template match="wsold:dimensionNames/@substance">
			<xsl:attribute name="amount-of-substance"><xsl:value-of select="."/></xsl:attribute>
		</xsl:template>

	<!-- move the unit-system attribute to the currentUnitSystem child element
		 convert defaultUnitNames to its best representation as a Mathcad 13
		 customUnitSystem. This is done in the trans:Convert12CustomUnitsTo13
		 extension function in order to get the appropriate base units
		 and then decide which quantity's default units need to be replaced
		 by the units listed in the Mathcad 12 document. -->
	<xsl:template match="wsold:calculation/wsold:units">
		<xsl:variable name="customized" select="count(wsold:defaultUnitNames) = 1"/>
		<ws:units>
			<ws:currentUnitSystem name="{@unit-system}" customized="{$customized}"/>
			<xsl:if test="$customized">
				<xsl:variable name="custom-unit-system" select="trans:Convert12CustomUnitsTo13(string(@unit-system), wsold:defaultUnitNames/wsold:name)"/>
				<xsl:copy-of select="$custom-unit-system"/>
			</xsl:if>
		</ws:units>
	</xsl:template>

</xsl:stylesheet>