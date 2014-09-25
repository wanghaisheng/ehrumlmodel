<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="constants.xslt" />
	<xsl:import href="maps.xslt" />
	<xsl:import href="sections/Allergies.xslt" />
	<xsl:import href="sections/Immunizations.xslt"/>
	<xsl:import href="sections/Procedures.xslt"/>
	<xsl:import href="sections/DischargeMeds.xslt" />
	<xsl:import href="sections/PlanOfCare.xslt" />
	<xsl:import href="sections/HospitalCourse.xslt" />
	<xsl:import href="sections/ActiveProblems.xslt" />
	<xsl:import href="sections/DischargeDiagnosis.xslt" />
	<xsl:import href="sections/HeaderInformation.xslt" />
 	<xsl:import href="sections/ListofSurgeries.xslt" /> 
	
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:template match="/">
		<ClinicalDocument xmlns="urn:hl7-org:v3"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:mif="urn:hl7-org:v3/mif">
			<xsl:call-template name="headerInformation">
				<xsl:with-param name="header" select="toc:ToCSummary/toc:Header" />
				<xsl:with-param name="ToCSummary" select="toc:ToCSummary" />
				<xsl:with-param name="code" select="'18842-5'" />
				<xsl:with-param name="displayName" select="'DISCHARGE SUMMARIZATION NOTE'" />
				<xsl:with-param name="title" select="'Discharge Summary'" />
				<xsl:with-param name="templateID" select="'2.16.840.1.113883.3.1275.1.1.1'"/>
			</xsl:call-template>
			<component>
				<structuredBody>
					<xsl:call-template name="activeProblems">
							<xsl:with-param name="activeProblems"
								select="toc:ToCSummary/toc:Body/toc:ActiveProblems" />
					</xsl:call-template>
					
					<xsl:call-template name="allergies">
						<xsl:with-param name="allergies" select="toc:ToCSummary/toc:Body/toc:Allergies" />
					</xsl:call-template>
					
					<xsl:call-template name="dischargeDiagnosis">
						<xsl:with-param name="dischargeDiagnosis" select="toc:ToCSummary/toc:Body/toc:DischargeDiagnosis"/>    
					</xsl:call-template>
					
					<xsl:call-template name="dischargeMeds">
						<xsl:with-param name="dischargeMeds"
							select="toc:ToCSummary/toc:Body/toc:DischargeMeds" />
					</xsl:call-template>
						
					<xsl:call-template name="planofcare">
						<xsl:with-param name="planofcare"
							select="toc:ToCSummary/toc:Body/toc:PlanofCare" />
					</xsl:call-template>

					<xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:Procedures)">
						<xsl:call-template name="procedures">
	                        <xsl:with-param name="procedures" select="toc:ToCSummary/toc:Body/toc:Procedures"/>    
	                    </xsl:call-template>
                    </xsl:if>
                    
                    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:Immunizations)">
	                     <xsl:call-template name="immunizations">
	                        <xsl:with-param name="immunizations" select="toc:ToCSummary/toc:Body/toc:Immunizations"/>
	                    </xsl:call-template>
                    </xsl:if>

					<xsl:call-template name="hospitalCourse">
						<xsl:with-param name="hospitalCourse"
							select="toc:ToCSummary/toc:Body/toc:HospitalCourse" />
					</xsl:call-template>
					
					<xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:ListofSurgeries)">
						<xsl:call-template name="listofSurgeries">
	                        <xsl:with-param name="listofSurgeries" select="toc:ToCSummary/toc:Body/toc:ListofSurgeries"/>    
	                    </xsl:call-template>
                    </xsl:if>
                    
                    <!-- Optional section -  Functional Status - not started -->
                    
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
