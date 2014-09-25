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
        
    <xsl:template name="assessmentandPlanSectionCCDA">
        <xsl:param name="assessmentandPlanSection"/>
        <xsl:param name="srcMnemonic"/>
			<AssessmentAndPlan>
					<Text>
					    <xsl:for-each select="$assessmentandPlanSection/cda:text">
						    <xsl:for-each select="node()[./self::text()]">
							    <xsl:sequence select="fn:string(.)"/>
						    </xsl:for-each>
					    </xsl:for-each>
				    </Text>
			</AssessmentAndPlan>
    </xsl:template>        
</xsl:stylesheet>