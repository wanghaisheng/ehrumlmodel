<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="sections/HeaderInformation_IPToCIM.xslt" />
	<xsl:import href="sections/Allergies_IPToCIM.xslt" />
	<xsl:import href="sections/ActiveProblems_IPToCIM.xslt" />
	<xsl:import href="sections/DischargeDiagnosis_IPToCIM.xslt" />
	<xsl:import href="sections/DischargeMeds_IPToCIM.xslt" />
	<xsl:import href="sections/PlanofCare_IPToCIM.xslt" />
	<xsl:import href="sections/HospitalCourse_IPToCIM.xslt" />
	<xsl:import href="sections/Immunizations_IPToCIM.xslt" />
	<xsl:import href="sections/Procedures_IPToCIM.xslt" />
	<!--  <xsl:import href="sections/ListofSurgeries_IPToCIM.xslt" />
	<xsl:import href="sections/FunctionalStatus_IPToCIM.xslt" />
	 -->

	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:template match="/">

		<ToCSummary>
			<xsl:attribute name="xsi:schemaLocation"
				select="'http://www.sipilotdevelopment.org/tocri toc-cim.xsd'" />
				<Header>
					<xsl:call-template name="headerInformationSection">
						<xsl:with-param name="clinicalDocument"
							select="cda:ClinicalDocument" />
					</xsl:call-template>
				</Header>
				
				<Body>
					<xsl:call-template name="allergiesSection">
						<xsl:with-param name="allergiesSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.102']" />
					</xsl:call-template>
					
					<xsl:call-template name="activeProblemsSection">
						<xsl:with-param name="activeProblemsSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.103']" />
					</xsl:call-template>
	
					<xsl:call-template name="dischargeDiagnosisSection">
						<xsl:with-param name="dischargeDiagnosisSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.111']" />
					</xsl:call-template>
	
					<xsl:call-template name="dischargeMedsSection">
						<xsl:with-param name="dischargeMedsSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.114']" />
					</xsl:call-template>
	
					<xsl:call-template name="hospitalCourseSection">
						<xsl:with-param name="hospitalCourseSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.121']" />
					</xsl:call-template>
	
					<xsl:call-template name="planofCareSection">
						<xsl:with-param name="planofCareSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.124']" />
					</xsl:call-template>
					
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.145'])">
					 <xsl:call-template name="proceduresSection">
						<xsl:with-param name="proceduresSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.145']" />
					</xsl:call-template>
					</xsl:if>
					
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.117'])">
						<xsl:call-template name="immunizationSection">
							<xsl:with-param name="immunizationSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.117']" />
						</xsl:call-template>
					</xsl:if>
				
				<!-- 
				<xsl:call-template name="functionalStatusSection">
					<xsl:with-param name="functionalStatusSection"
						select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.108']" />
						 
				<xsl:call-template name="listofSurgeriesSection">
					<xsl:with-param name="listofSurgeriesSection"
						select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.108']" />
				</xsl:call-template> -->
			</Body>
		</ToCSummary>
	</xsl:template>
</xsl:stylesheet>
