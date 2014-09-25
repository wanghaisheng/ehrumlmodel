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
	<xsl:import href="sections/DischargeMeds_IPToCIM.xslt" />
	<xsl:import href="sections/PlanofCare_IPToCIM.xslt" />
	<xsl:import href="sections/MedicalEquipment_IPToCIM.xslt" />
	<xsl:import href="sections/Immunizations_IPToCIM.xslt" />
	<xsl:import href="sections/AdvanceDirectives_IPToCIM.xslt" />

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
					<xsl:call-template name="advanceDirectivesSection">
						<xsl:with-param name="advanceDirectivesSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.116']" />
					</xsl:call-template>
	
					<xsl:call-template name="allergiesSection">
						<xsl:with-param name="allergiesSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.102']" />
					</xsl:call-template>
					
					<xsl:call-template name="activeProblemsSection">
						<xsl:with-param name="activeProblemsSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.103']" />
					</xsl:call-template>
					
					<xsl:call-template name="planofCareSection">
						<xsl:with-param name="planofCareSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.124']" />
					</xsl:call-template>
	
					<xsl:call-template name="dischargeMedsSection">
						<xsl:with-param name="dischargeMedsSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.114']" />
					</xsl:call-template>
	
					<xsl:call-template name="medicalEquipmentSection">
						<xsl:with-param name="medicalEquipmentSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.128']" />
					</xsl:call-template>
					
					<xsl:call-template name="immunizationSection">
						<xsl:with-param name="immunizationSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.117']" />
					</xsl:call-template>
				</Body>
		</ToCSummary>
	</xsl:template>
</xsl:stylesheet>
