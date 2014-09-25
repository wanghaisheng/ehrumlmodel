<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri"
	xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

    <xsl:import href="../templates.xslt"/>    
        
    <xsl:template name="assessmentSectionCCDA">
        <xsl:param name="assessmentSection"/>
        <xsl:param name="srcMnemonic"/>
			<Assessments>
					<Text>
					    <xsl:apply-templates select="$assessmentSection/cda:text/node()"/>
				    </Text>
			</Assessments>
    </xsl:template>        
</xsl:stylesheet>