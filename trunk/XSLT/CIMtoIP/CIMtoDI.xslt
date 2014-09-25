<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="urn:hl7-org:v3" xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="xs fn gcda">
    <xsl:import href="constants.xslt"/>
    <xsl:import href="maps.xslt"/>
    <xsl:import href="sections/Allergies.xslt"/>
    <xsl:import href="sections/ActiveProblems.xslt"/>
    <xsl:import href="sections/PlanOfCare.xslt"/>
    <xsl:import href="sections/DischargeMeds.xslt"/>
    <xsl:import href="sections/MedicalEquipment.xslt"/>
    <xsl:import href="sections/Immunizations.xslt"/>
    <xsl:import href="sections/AdvanceDirectives.xslt"/>
    <xsl:import href="sections/HeaderInformation.xslt"/>
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <ClinicalDocument xmlns="urn:hl7-org:v3"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:mif="urn:hl7-org:v3/mif">
            <xsl:call-template name="headerInformation">
            	<xsl:with-param name="header" select="toc:ToCSummary/toc:Header" />
                <xsl:with-param name="ToCSummary" select="toc:ToCSummary"/>
                <xsl:with-param name="code" select="'60281-3'"/>
                <xsl:with-param name="displayName" select="'DISCHARGE INSTRUCTIONS NOTE'"/>
                <xsl:with-param name="title" select="'Discharge Instructions'"/>
                <xsl:with-param name="templateID" select="'2.16.840.1.113883.3.1275.1.1.2'"/>
            </xsl:call-template>
            <component>
                <structuredBody>
                 	<xsl:call-template name="activeProblems">
                        <xsl:with-param name="activeProblems" select="toc:ToCSummary/toc:Body/toc:ActiveProblems"/>    
                    </xsl:call-template>
                    
                    <xsl:call-template name="allergies">
                        <xsl:with-param name="allergies" select="toc:ToCSummary/toc:Body/toc:Allergies"/>    
                    </xsl:call-template>
                    
                    <xsl:call-template name="dischargeMeds">
                        <xsl:with-param name="dischargeMeds" select="toc:ToCSummary/toc:Body/toc:DischargeMeds"/>
                    </xsl:call-template>

                    <xsl:call-template name="planofcare">
                        <xsl:with-param name="planofcare" select="toc:ToCSummary/toc:Body/toc:PlanofCare"/>
                    </xsl:call-template>
                    
                    <xsl:call-template name="immunizations">
                        <xsl:with-param name="immunizations" select="toc:ToCSummary/toc:Body/toc:Immunizations"/>
                    </xsl:call-template>
                                        
                    <xsl:call-template name="medicalEquipment">
                        <xsl:with-param name="medicalEquipment" select="toc:ToCSummary/toc:Body/toc:MedicalEquipment"/>
                    </xsl:call-template>
                    
                    <xsl:call-template name="advanceDirectives">
                        <xsl:with-param name="advanceDirectives" select="toc:ToCSummary/toc:Body/toc:AdvanceDirectives"/>    
                    </xsl:call-template>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
