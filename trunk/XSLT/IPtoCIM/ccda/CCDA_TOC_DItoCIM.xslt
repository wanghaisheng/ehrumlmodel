<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="templates.xslt" />
	<xsl:import href="constants_ccda.xslt" />
	<xsl:import href="sections/HeaderInformation_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/ActiveProblems_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/PlanofCare_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/Allergies_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/Immunizations_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/MedicalEquipment_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/DischargeMeds_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/AdvanceDirectives_ccda_IPToCIM.xslt" />
	
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:param name="srcMnemonic" />
	<xsl:template match="/">
	
		<ToCSummary>
			<xsl:attribute name="xsi:schemaLocation"
				select="'http://www.sipilotdevelopment.org/tocri toc-cim.xsd'" />
				<Header>
					<xsl:call-template name="headerInformationSectionCCDA">
						<xsl:with-param name="clinicalDocument" select="cda:ClinicalDocument" />
							<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
					</xsl:call-template>
				</Header>
 				 
 				<Body>
		 			<xsl:if test="($srcMnemonic and ($srcMnemonic=$TOCDischargeInstructions_Level1))" >
 						<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:nonXMLBody/cda:text)">
				 			<UnstructuredData>
 								<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:nonXMLBody/cda:text)">
	 								<xsl:call-template name="mapNonXMLBodyTextToCIM">
	 									<xsl:with-param name="text" select="cda:ClinicalDocument/cda:component/cda:nonXMLBody/cda:text"/>
	 								</xsl:call-template>
		 					    </xsl:if>
		 				qq</UnstructuredData>
		 				</xsl:if> 
 					</xsl:if>
 				
 				<xsl:if test="($srcMnemonic and ($srcMnemonic=$TOCDischargeInstructions_Level2)) or ($srcMnemonic and ($srcMnemonic=$TOCDischargeInstructions_Level3))">
 				
 						<xsl:call-template name="activeProblemsSectionCCDA">
							<xsl:with-param name="activeProblemsSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.5']" />
							<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
						
 						<xsl:call-template name="advanceDirectivesSectionCCDA">
							<xsl:with-param name="advanceDirectivesSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.21']" />
							<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
						
						<xsl:call-template name="allergiesSectionCCDA">
							<xsl:with-param name="allergiesSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.6']" />
							<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
						
						<xsl:call-template name="dischargeMedsSectionCCDA">
							<xsl:with-param name="dischargeMedsSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.11']" />
							<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
						
						<xsl:call-template name="medicalEquipmentCCDA">
							<xsl:with-param name="medicalEquipmentSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.23']" />
							<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
						
						<xsl:call-template name="planofCareSectionCCDA">
							<xsl:with-param name="planofCareSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.10']" />
								<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>

						<xsl:call-template name="immunizationsSectionCCDA">
							<xsl:with-param name="immunizationsSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.2']" />
								<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>

				</xsl:if>
		</Body>
	</ToCSummary>
  </xsl:template>

</xsl:stylesheet>
