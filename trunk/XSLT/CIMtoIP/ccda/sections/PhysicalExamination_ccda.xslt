<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    
    <xsl:template name="physicalExaminationCCDA">
        <xsl:param name="physicalExamination" />
		 <xsl:param name="mnemonic" />
			<component>
			<section>
				<templateId root="2.16.840.1.113883.10.20.2.10"/>
				<code code="29545-1" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="PHYSICAL FINDINGS"/>
				<title>PHYSICAL EXAMINATION</title>
				<xsl:if test="fn:exists($physicalExamination/toc:Text)">
				    <text>
			              <xsl:apply-templates select="$physicalExamination/toc:Text/node()"/>
	             	</text>
             	</xsl:if>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>