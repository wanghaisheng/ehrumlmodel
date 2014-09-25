<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt"/>
    
    <xsl:template name="admittingDiagnosisCCDA">
        <xsl:param name="admittingDiagnosis" />
        <!--  For Level 2 and Level 3, the section header and text fields will be generated  -->
		
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.22.2.43"/>
					<code>
						<xsl:attribute name="code" namespace="" select="'46241-6'"/>
						<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
						<xsl:attribute name="displayName" namespace="" select="'Hospital Admission Diagnosis'"/>
						<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
					</code>
					<title>
						<xsl:sequence select="'Hospital Admission Diagnosis'"/>
					</title>
					
					<xsl:if test="fn:exists($admittingDiagnosis/toc:Text)">
			           	<text>
			            	 	<xsl:apply-templates select="$admittingDiagnosis/toc:Text/node()"/>
			            </text>
		      		</xsl:if>
				</section>
			</component>
	</xsl:template>
</xsl:stylesheet>