<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY SharedTransformData SYSTEM "SharedXmcdToXhtml.txt">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ws="http://schemas.mathsoft.com/worksheet30" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:user="local-functions" exclude-result-prefixes="msxsl user ws">

	<!-- dummy variables used by Designate -->
	<xsl:param name="clip-region-id" select="0"/>
	<xsl:param name="show-clip-copy" select="false()"/>
	<xsl:param name="target-document"/>

	<xsl:template match="*" mode="display-context-menu">
		<xsl:param name="regionref" select="0"/>
	</xsl:template>

	<!-- The Shared Transform Data -->
	&SharedTransformData;

</xsl:stylesheet>