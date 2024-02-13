<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ws="http://schemas.mathsoft.com/worksheet30" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:user="local-functions" exclude-result-prefixes="msxsl user ws">

	<!-- Include the processor-independent transform -->
	<xsl:import href="MCXmlToHTMLBase.xslt"/>

	<!-- application server parameters -->
	<xsl:param name="server-process" select="false()"/>
	<xsl:param name="server-script"/>
	<xsl:param name="web-scroll-X" select="0"/>
	<xsl:param name="web-scroll-Y" select="0"/>
  <xsl:param name="web-component-clsid" select="'NOTHING'"/>
	<!-- override "head" to insert server script -->
	<xsl:template name="scripts">
			<xsl:if test="$server-process">
				<script id="clientEventHandlersJS" language="javascript">
					<xsl:comment xml:space="preserve">
						<xsl:value-of select="$server-script"/>
						//</xsl:comment>
				</script>
			</xsl:if>
	</xsl:template>
	
	<!-- override "body" to insert server form -->
	<xsl:template name="body">
		<body>
			<xsl:choose>
				<xsl:when test="$server-process">
					<xsl:attribute name="onload">onbodyload()</xsl:attribute>
					<form id='mcinputform' onsubmit='return onsubmitform()' method='POST'>
						<input type='hidden' name='scrollX' id='scrollX'><xsl:attribute name="value"><xsl:value-of select="$web-scroll-X"/></xsl:attribute></input>
						<input type='hidden' name='scrollY' id='scrollY'><xsl:attribute name="value"><xsl:value-of select="$web-scroll-Y"/></xsl:attribute></input>
						<xsl:apply-templates select="ws:regions/ws:region"/>
					</form>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="ws:regions/ws:region"/>
					<!-- If a region's id matches the querystring value of ClipRegionId, extract xml -->
					<div>
						<xsl:apply-templates select="ws:regions//ws:region[@region-id=$clip-region-id]" mode="render-clipboard" />
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</body>
	</xsl:template>
	
	<xsl:template name="render-web-control">
		<xsl:param name="is-embedded">0</xsl:param>
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<div>
						<xsl:attribute name="style">
							<xsl:text>width: </xsl:text><xsl:value-of select="user:GetOutputsWidth(number(@region-id))"/><xsl:text>px; overflow: hidden;</xsl:text>
						</xsl:attribute>
						
						<!-- display the rendering -->
						<xsl:apply-templates select="*[1]" mode="render-region">
							<xsl:with-param name="is-embedded" select="$is-embedded"/>
						</xsl:apply-templates>
					</div>
				</td>
				<td><xsl:value-of select="user:GetHtmlContent(number(@region-id))" disable-output-escaping="yes"/></td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="render-region-content-2">
		<xsl:param name="is-embedded">0</xsl:param>

		<xsl:call-template name="region-attributes">
			<xsl:with-param name="is-embedded" select="$is-embedded"/>
		</xsl:call-template>
		
		<xsl:if test="@tag">
			<a>
				<xsl:attribute name='name'>
					<xsl:value-of select="@tag"/>
				</xsl:attribute>
			</a>
		</xsl:if>

		<xsl:choose>		
			<xsl:when test="ws:math[@error]">
				<xsl:call-template name="render-error">
					<xsl:with-param name="is-embedded" select="$is-embedded"/>
				</xsl:call-template>
			</xsl:when>

			<xsl:when test="ws:link">
				<xsl:call-template name="render-link">
					<xsl:with-param name="is-embedded" select="$is-embedded"/>
				</xsl:call-template>
			</xsl:when>

			<xsl:when test="$server-process and ws:component[ @clsid=$web-component-clsid ]">
				<xsl:call-template name="render-web-control">
					<xsl:with-param name="is-embedded" select="$is-embedded"/>
				</xsl:call-template>
			</xsl:when>

			<xsl:otherwise>
				<xsl:apply-templates select="*[1]" mode="render-region">
					<xsl:with-param name="is-embedded" select="$is-embedded"/>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
