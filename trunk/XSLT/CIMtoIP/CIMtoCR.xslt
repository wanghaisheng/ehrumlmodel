<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="urn:hl7-org:v3" xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="xs fn gcda toc">
    <xsl:import href="constants.xslt"/>
    <xsl:import href="maps.xslt"/>
    <xsl:import href="sections/HeaderInformation.xslt"/>
    <xsl:import href="sections/Allergies.xslt"/>
    <xsl:import href="sections/ActiveProblems.xslt"/>
    <xsl:import href="sections/AdvanceDirectives.xslt"/>
    <xsl:import href="sections/Medications.xslt"/>
    <xsl:import href="sections/Procedures.xslt"/>
    <xsl:import href="sections/Results.xslt"/>
    <xsl:import href="sections/PlanOfCare.xslt"/>
    <xsl:import href="sections/MedicalEquipment.xslt"/>
    <xsl:import href="sections/Immunizations.xslt"/>
	<xsl:import href="sections/Encounters.xslt"/>
   	<xsl:import href="sections/ListofSurgeries.xslt" />
    
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <ClinicalDocument xmlns="urn:hl7-org:v3"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:mif="urn:hl7-org:v3/mif">
            <xsl:call-template name="headerInformation">
            	<xsl:with-param name="header" select="toc:ToCSummary/toc:Header" />
                <xsl:with-param name="ToCSummary" select="toc:ToCSummary"/>
                <xsl:with-param name="code" select="'01234-5'"/>
                <xsl:with-param name="displayName" select="'Consultation Request Document'"/>
                <xsl:with-param name="title" select="'Consultation Request Document'"/>
                <xsl:with-param name="templateID" select="'2.16.840.1.113883.3.1275.1.1.4'"/>
            </xsl:call-template>
            <component>
                <structuredBody>
                
                    <xsl:call-template name="activeProblems">
                        <xsl:with-param name="activeProblems" select="toc:ToCSummary/toc:Body/toc:ActiveProblems"/>    
                    </xsl:call-template>
                    
                    <xsl:call-template name="allergies">
                        <xsl:with-param name="allergies" select="toc:ToCSummary/toc:Body/toc:Allergies"/>    
                    </xsl:call-template>

					<!-- Plan of Care - optional -->
				    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:PlanofCare)">
	                   <xsl:call-template name="planofcare">
							<xsl:with-param name="planofcare"
								select="toc:ToCSummary/toc:Body/toc:PlanofCare" />
						</xsl:call-template>
					</xsl:if>
						
					 <xsl:call-template name="advanceDirectives">
                        <xsl:with-param name="advanceDirectives" select="toc:ToCSummary/toc:Body/toc:AdvanceDirectives"/>    
                    </xsl:call-template>
                    
                    <xsl:call-template name="results">
                        <xsl:with-param name="results" select="toc:ToCSummary/toc:Body/toc:results"/>    
                    </xsl:call-template>
                    
                     
                    <xsl:call-template name="medications">
                        <xsl:with-param name="medications" select="toc:ToCSummary/toc:Body/toc:medications"/>    
                    </xsl:call-template>
                    
                     <xsl:call-template name="procedures">
                        <xsl:with-param name="procedures" select="toc:ToCSummary/toc:Body/toc:procedures"/>    
                    </xsl:call-template>
                   
                   	<!-- Medical Equipment - optional -->
				    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:MedicalEquipment)">
	               		<xsl:call-template name="medicalEquipment">
	                        <xsl:with-param name="medicalEquipment" select="toc:ToCSummary/toc:Body/toc:MedicalEquipment"/>
	                    </xsl:call-template>
                    </xsl:if>
                    
                    <!-- Immunizations - optional -->
				    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:immunizations)">
	                   <xsl:call-template name="immunizations">
	                        <xsl:with-param name="immunizations" select="toc:ToCSummary/toc:Body/toc:immunizations"/>
	                    </xsl:call-template>
                    </xsl:if>
                    
                    <!-- Encounters - optional -->
				    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:encounters)">
	                    <xsl:call-template name="encounters">
	                        <xsl:with-param name="encounters" select="toc:ToCSummary/toc:Body/toc:encounters"/>    
	                    </xsl:call-template>
                    </xsl:if>
                   
                   <!-- List of Surgeries - optional -->
				    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:listofSurgeries)">
                     <xsl:call-template name="listofSurgeries">
                        <xsl:with-param name="listofSurgeries" select="toc:ToCSummary/toc:Body/toc:listofSurgeries"/>    
                    </xsl:call-template>
                    </xsl:if>
                    
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
