<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">
 
	<xsl:import href="../maps_ccda.xslt"/>
    
    <xsl:template name="admissionMedicationsCCDA">
        <xsl:param name="admissionMedications"/>
        <!--  For Level 2 and Level 3, the section header and text fields will be generated  -->
       	    <xsl:for-each select="$admissionMedications">
			<xsl:variable name="var184" as="node()" select="."/>
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.22.2.44"/>
					<code code="42346-7" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="ADMISSION MEDICATIONS"/>
					<title>Hospital Admission Medications</title>
					  <text>
	                         <xsl:apply-templates select="$admissionMedications/toc:Text/node()"/>
	                   </text>
				</section>
			</component>
		</xsl:for-each>
    </xsl:template>
</xsl:stylesheet>