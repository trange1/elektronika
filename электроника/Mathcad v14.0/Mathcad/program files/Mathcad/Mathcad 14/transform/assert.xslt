<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
		
	<xsl:template match="/" mode="make-assert" >
		<root>
			<xsl:for-each select=".//*[@xassert-msgid]">
				<xsl:call-template name="make-assert">
					<xsl:with-param name="msgid"	 select="@xassert-msgid"/>
				</xsl:call-template>
			</xsl:for-each>
		</root>
	</xsl:template>
	
	<xsl:template name="make-assert" >
		<xsl:param name="msgid">XAssertGeneric</xsl:param>		
		<assertion-failed>
			<xpath><xsl:apply-templates select="." mode="make-xpath"/></xpath>
			<msgid><xsl:value-of select="$msgid"/></msgid>
		</assertion-failed>
	</xsl:template>
	
	<xsl:template match="*" mode="make-xpath" >
		<!-- Keep track of the tree level, so we know whether this is the last node in the path -->
		<!-- Original context node is level 0, parent is -1, grandparent is -2, etc -->
		<xsl:param name="level">0</xsl:param>		
		<xsl:variable name="result-path">			
			<xsl:apply-templates select="parent::*" mode="make-xpath">
				<xsl:with-param name="level">
					<xsl:value-of select="$level - 1"/>
				</xsl:with-param>
			</xsl:apply-templates>
			<xsl:variable name="name" select="name()"/>
			<xsl:variable name="preced-count" select="count(preceding-sibling::*[name()=	$name])"/>
			<xsl:variable name="follow-count" select="count(following-sibling::*[name()=	$name])"/>
			<xsl:value-of select="name(.)"/>
			<xsl:choose>
				<xsl:when test="$preced-count > 0 or $follow-count > 0">
					[<xsl:value-of select="$preced-count+1"/>]			
				</xsl:when>
			</xsl:choose>
			<xsl:if test="$level != 0">
				/
			</xsl:if>			
		</xsl:variable>
		<!-- get rid of whitespace -->
		<xsl:value-of select="translate(normalize-space($result-path),' ','')"/>
	</xsl:template>
		
	<!-- Recursion terminates when we get to the root node -->
	<xsl:template match="*[not(parent::*)]" mode="make-xpath" priority="1">
		/<xsl:value-of select="name()"/>/
	</xsl:template>
	
	
</xsl:stylesheet>
