<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn gcda"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../modules/Medication_IPtoCIM.xslt" />

	<xsl:template name="medicationsSection">
		<xsl:param name="medicationsSection" />
		<Medications>
			<Text>
				<xsl:apply-templates select="$medicationsSection/cda:text/node()" />
			</Text>
			<xsl:call-template name="medicationModule">
				<xsl:with-param name="medicationModule"
					select="$medicationsSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.8']" />
			</xsl:call-template>
		</Medications>
	</xsl:template>
</xsl:stylesheet>