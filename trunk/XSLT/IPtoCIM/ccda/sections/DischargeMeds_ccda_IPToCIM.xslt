<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn gcda"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../modules/Medication_ccda_IPtoCIM.xslt" />

	<xsl:template name="dischargeMedsSectionCCDA">
		<xsl:param name="dischargeMedsSection" />
		<xsl:param name="srcMnemonic" />
		<DischargeMeds>
			<Text>
				<xsl:apply-templates select="$dischargeMedsSection/cda:text/node()" />
			</Text>
			<xsl:if
				test="(($srcMnemonic and ($srcMnemonic=$DischargeSummary_Level3)) or ($srcMnemonic and ($srcMnemonic=$TOCDischargeSummary_Level3)) or ($srcMnemonic and ($srcMnemonic=$TOCDischargeInstructions_Level3)))">
				<xsl:for-each
					select="$dischargeMedsSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.35']">
					<xsl:call-template name="medicationModuleCCDA">
						<xsl:with-param name="medicationModule" select="." />
					</xsl:call-template>
				</xsl:for-each>
			</xsl:if>
		</DischargeMeds>
	</xsl:template>
</xsl:stylesheet>