<?xml version="1.0" encoding="UTF-8"?>
<!-- 
	unitsToTree.xslt
	Transforms a unitMonomial to the corresponding UI tree representation.
	2004/02/25 	JSL: Created
    2005/06/06	JSL: Added support for displaying unit exponents as decimals.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:trans="urn:mc-transform-extension"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
	xmlns:u="http://schemas.mathsoft.com/units10" 
	exclude-result-prefixes="trans msxsl u">
	
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<!-- External flag indicating that the quantity name (rather than the symbol) should be used as the identifier values in the tree -->
	<xsl:param name="displayQuantity" select="false()"/>
	<!-- Translate the unit symbol to the current locale -->
	<xsl:param name="translateSymbol" select="true()"/>
	<!-- Display units with negative exponents as 1/unit^pow fractions -->
	<xsl:param name="negativeUnitPowersAsFractions" select="false()"/>
	<!-- Display unit exponents as decimals -->
	<xsl:param name="decimalUnitPowers" select="false()"/>
		
	<!-- Convert a unit monomial to a UI tree -->
	<xsl:template match="//u:unitMonomial">
		<!-- Copy the contained unitref elements, filling in the rational power attributes as 1 if they are not specified -->
		<xsl:variable name="unitrefs">
			<xsl:apply-templates select="*" mode="copy-unitrefs"/>
		</xsl:variable>
		<!-- Collect all the unitrefs which have positive powers -->
		<xsl:variable name="pos">
			<xsl:copy-of select="msxsl:node-set($unitrefs)/u:unitReference[number(@power-numerator)*number(@power-denominator) >= 0]"/>
		</xsl:variable>
		<!-- Collect all the unitrefs which have negative powers -->
		<xsl:variable name="neg">
			<xsl:copy-of select="msxsl:node-set($unitrefs)/u:unitReference[number(@power-numerator)*number(@power-denominator) &lt; 0]"/>
		</xsl:variable>
		<!-- Store the count of unitrefs with both positive and negative powers  -->
		<xsl:variable name="numPos" select="count(msxsl:node-set($pos)/*)"/>
		<xsl:variable name="numNeg" select="count(msxsl:node-set($neg)/*)"/>
		<xsl:choose>
			<!-- If there are both positive and negative-powered units, output an expression dividing the product of the 
					positives by the product of the negatives -->
			<xsl:when test="$numNeg > 0 and $negativeUnitPowersAsFractions">
				<DIVIDE>
					<xsl:choose>
						<xsl:when test="$numPos">
							<xsl:apply-templates select="msxsl:node-set($pos)/*[1]" mode="mult-units"/>
						</xsl:when>
						<xsl:otherwise>
							<NAME>1</NAME>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:apply-templates select="msxsl:node-set($neg)/*[1]" mode="mult-units"/>
				</DIVIDE>
			</xsl:when>
			<!-- all other cases are simply a product of the unit-refs -->
			<xsl:otherwise>
				<xsl:apply-templates select="msxsl:node-set($unitrefs)/*[1]" mode="mult-units"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Makes a copy of the given unitref element, filling in either missing power attribute, if necessary -->
	<xsl:template match="u:unitReference" mode="copy-unitrefs">
		<xsl:element name="u:unitReference">
			<!-- if power-numerator or power-denominator attr doesn't exist, create it with a value of 1 -->
			<xsl:if test="not(@power-numerator)">
				<xsl:attribute name="power-numerator">1</xsl:attribute>
			</xsl:if>
			<xsl:if test="not(@power-denominator)">
				<xsl:attribute name="power-denominator">1</xsl:attribute>
			</xsl:if>
			<xsl:copy-of select="@*|*|node()"/>
		</xsl:element>
	</xsl:template>
	
	<!-- Output an expression which multiplies the given unit reference by the product of its following siblings -->
	<xsl:template match="u:unitReference[following-sibling::*]" mode="mult-units">
		<TIMES>
			<xsl:apply-templates select="." mode="pow"/>
			<xsl:apply-templates select="following-sibling::*[1]" mode="mult-units"/>
		</TIMES>
	</xsl:template>
	
	<!-- mult-units mode terminator.  Output the unit expression with appropriate power/root operators -->
	<xsl:template match="u:unitReference[not(following-sibling::*)]" mode="mult-units">
		<xsl:apply-templates select="." mode="pow"/>
	</xsl:template>
	
	<!-- Output a name node containing the given unitReference's unit name -->
	<xsl:template match="u:unitReference">
		<NAME>
			<xsl:choose>
				<xsl:when test="$displayQuantity">
					<xsl:value-of select="trans:TranslateQuantityName(string(@quantity))"/>
				</xsl:when>
				<xsl:when test="$translateSymbol">
					<xsl:value-of select="trans:CanonicalNameToSymbol(string(@unit))"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@unit"/>
				</xsl:otherwise>
			</xsl:choose>			
		</NAME>
	</xsl:template>
	
	<!-- Output a power operator of the approprate degree and pass control to the modeless rule -->
	<xsl:template match="u:unitReference[@power-numerator div @power-denominator != 1]" mode="pow">		
		<xsl:choose>
			<xsl:when test="@power-numerator div @power-denominator = -1 and $negativeUnitPowersAsFractions">
				<xsl:apply-templates select="."/>
			</xsl:when>
			<xsl:otherwise>
				<POWER>
					<xsl:apply-templates select="."/>
					<xsl:apply-templates select="." mode="exponentVal"/>
				</POWER>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Power op unnecessary, since power-numerator is 1 or (-1 and negativeUnitPowersAsFractions style). Pass control to the modeless rule.-->
	<xsl:template match="u:unitReference" mode="pow">
		<xsl:apply-templates select="."/>
	</xsl:template>
	
	<!-- returns the absolute value of the $val argument -->
	<xsl:template name="abs">
		<xsl:param name="val"/>	
		<xsl:choose>
			<xsl:when test="$val &lt; 0">				
				<xsl:value-of select="-number($val)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="number($val)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Outputs the $val argument as a number, appropriately formatted according to settings -->
	<xsl:template name="output-decimal-power">
		<xsl:param name="val"/>
		<xsl:variable name="tempVal">
			<xsl:choose>
				<xsl:when test="$negativeUnitPowersAsFractions">
					<xsl:call-template name="abs">
						<xsl:with-param name="val" select="$val"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$val"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>			
		<TREE_NODE_PTR>
			<xsl:value-of select="trans:MakeComplexTree(string($tempVal),'0',1)"/>
		</TREE_NODE_PTR>
		
	</xsl:template>
	
	
	<!-- Output the exponent value for the given unitReference.  Whole number exponent version -->
	<xsl:template match="u:unitReference[@power-denominator = 1 or power-denominator = -1]" mode="exponentVal">
		<xsl:call-template name="output-decimal-power">
			<xsl:with-param name="val" select="@power-numerator div @power-denominator" />
		</xsl:call-template>
	</xsl:template>
	
	<!-- Output the exponent value for the given unitReference.  Rational exponent version -->
	<xsl:template match="u:unitReference" mode="exponentVal">
	
		<xsl:variable name="exp" select="@power-numerator div @power-denominator"/>
		
		<xsl:choose>		
			<xsl:when test="$decimalUnitPowers">
				<xsl:call-template name="output-decimal-power">
					<xsl:with-param name="val" select="$exp" />
				</xsl:call-template>
			</xsl:when>			
			<xsl:otherwise>			
				<!-- absval of the numerator -->
				<xsl:variable name="absnumerator">
					<xsl:call-template name="abs">
						<xsl:with-param name="val" select="@power-numerator"/>
					</xsl:call-template>
				</xsl:variable>
				
				<!-- absval of the denominator -->
				<xsl:variable name="absdenominator">
					<xsl:call-template name="abs">
						<xsl:with-param name="val" select="@power-denominator"/>
					</xsl:call-template>
				</xsl:variable>
				
				<!-- Normalize the fraction such that if it is negative, the negative sign is on the numerator. -->
				<DIVIDE>
					<NAME>
						<xsl:choose>
							<xsl:when test="$exp &lt; 0 and not($negativeUnitPowersAsFractions)">
								<xsl:value-of select="-number($absnumerator)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$absnumerator"/>
							</xsl:otherwise>
						</xsl:choose>
					</NAME>
					<NAME>
						<xsl:value-of select="$absdenominator"/>
					</NAME>			
				</DIVIDE>
			</xsl:otherwise>
		</xsl:choose>						
	</xsl:template>					

</xsl:stylesheet>
