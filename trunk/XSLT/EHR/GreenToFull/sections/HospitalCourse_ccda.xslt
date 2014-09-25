<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt" />

	<xsl:template name="hospitalCourseCCDA">
		<xsl:param name="hospitalCourse" />
		<xsl:for-each select="$hospitalCourse">
			<component>
				<section>
					<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.5" />
					<code code="8648-8" codeSystem="2.16.840.1.113883.6.1"
						codeSystemName="LOINC" displayName="HOSPITAL COURSE" />
					<title>
						<xsl:sequence select="'Hospital Course'" />
					</title>
					<text>
						<xsl:apply-templates select="toc:Text/node()" />
					</text>
					<!-- MDHT complains about setting a 'code' here, classCode, moodCode 
						act element -->
					<!-- MDHT error about setting a typeCode entryRelationship element -->
					<!-- MDHT error about setting a code, classCode, moodCode observation 
						element -->
				</section>
			</component>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>