<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn gcda"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../modules/Medication_ccda_IPtoCIM.xslt" />

	<xsl:template name="medicationsSectionCCDA">
		<xsl:param name="medicationsSection" />
		<xsl:param name="srcMnemonic" />
		<Medications>
			<Text>
				<xsl:apply-templates select="$medicationsSection/cda:text/node()" />
			</Text>
			<xsl:if
				test="(($srcMnemonic and ($srcMnemonic=$DischargeSummary_Level3)) or 
						($srcMnemonic and ($srcMnemonic=$TOCDischargeSummary_Level3)) or
						($srcMnemonic and ($srcMnemonic=$TOCConsultationRequest_Level3)) or
						($srcMnemonic and ($srcMnemonic=$TOCConsultationSummary_Level3)) )">
				<xsl:for-each select="$medicationsSection/cda:entry">
					<xsl:call-template name="medicationModuleCCDA">
						<xsl:with-param name="medicationModule" select="." />
					</xsl:call-template>
				</xsl:for-each>
			</xsl:if>
		</Medications>
	</xsl:template>

</xsl:stylesheet>