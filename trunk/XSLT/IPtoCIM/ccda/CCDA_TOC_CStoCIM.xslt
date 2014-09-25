<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="templates.xslt"/>
	<xsl:import href="constants_ccda.xslt" />
	<xsl:import href="sections/HeaderInformation_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/ActiveProblems_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/PlanofCare_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/Procedures_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/Results_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/Allergies_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/Medications_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/Immunizations_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/MedicalEquipment_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/AdvanceDirectives_ccda_IPToCIM.xslt" />
	
	<!-- Optional Sections -->
	<xsl:import href="sections/Encounters_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/ReasonforReferral_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/VitalSigns_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/FamilyHistory_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/SocialHistory_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/FunctionalStatus_ccda_IPToCIM.xslt" />
	<xsl:import href="sections/Payers_ccda_IPToCIM.xslt" />

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
				<xsl:if
					test="($srcMnemonic and ($srcMnemonic=$TOCConsultationSummary_Level1))">
					<xsl:if
						test="fn:exists(cda:ClinicalDocument/cda:component/cda:nonXMLBody/cda:text)">
						<UnstructuredData>
 								<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:nonXMLBody/cda:text)">
	 								<xsl:call-template name="mapNonXMLBodyTextToCIM">
	 									<xsl:with-param name="text" select="cda:ClinicalDocument/cda:component/cda:nonXMLBody/cda:text"/>
	 								</xsl:call-template>
		 					    </xsl:if>
		 				</UnstructuredData>
					</xsl:if>
				</xsl:if>

				<xsl:if
					test="($srcMnemonic and ($srcMnemonic=$TOCConsultationSummary_Level2)) or ($srcMnemonic and ($srcMnemonic=$TOCConsultationSummary_Level3))">

					<xsl:call-template name="resultsSectionCCDA">
						<xsl:with-param name="resultsSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.3']" />
						<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
					</xsl:call-template>

					<xsl:call-template name="activeProblemsSectionCCDA">
						<xsl:with-param name="activeProblemsSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.5']" />
						<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
					</xsl:call-template>

					<xsl:call-template name="allergiesSectionCCDA">
						<xsl:with-param name="allergiesSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.6']" />
						<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
					</xsl:call-template>

					<xsl:call-template name="proceduresSectionCCDA">
						<xsl:with-param name="proceduresSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.7']" />
						<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
					</xsl:call-template>

					<xsl:call-template name="medicationsSectionCCDA">
						<xsl:with-param name="medicationsSection"
							select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.1']" />
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

					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.2'])" >
						<xsl:call-template name="immunizationsSectionCCDA">
							<xsl:with-param name="immunizationsSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.2']" />
							<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
					</xsl:if>

					<!-- Optional Sections -->
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.21'])">
						<xsl:call-template name="advanceDirectivesSectionCCDA">
							<xsl:with-param name="advanceDirectivesSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.21']" />
							<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
					</xsl:if>
					
					<!--  Family History -->
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.15'])">			
						<xsl:call-template name="familyHistorySectionCCDA">
							<xsl:with-param name="familyHistorySection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.15']" />
								<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
					</xsl:if>
						
						<!--  Social History -->
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.17'])">
						<xsl:call-template name="socialHistorySectionCCDA">
							<xsl:with-param name="socialHistorySection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.17']" />
								<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
					</xsl:if>
					
						<!--  Vital Signs -->
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.4'])">
						<xsl:call-template name="vitalSignsSectionCCDA">
							<xsl:with-param name="vitalSignsSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.4']" />
								<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
					</xsl:if>
						
						<!--  Functional Status -->
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.14'])">
						<xsl:call-template name="functionalStatusSectionCCDA">
							<xsl:with-param name="functionalStatusSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.14']" />
								<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
					</xsl:if>	
					
						<!--  Encounters-->
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.22'])">
						<xsl:call-template name="encountersSectionCCDA">
							<xsl:with-param name="encountersSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.22']" />
								<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
					</xsl:if>
					
						<!--  Payers-->
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.18'])">
						<xsl:call-template name="payersSectionCCDA">
							<xsl:with-param name="payersSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='2.16.840.1.113883.10.20.22.2.18']" />
								<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
					</xsl:if>
					
						<!--  Reason for Referral-->
					<xsl:if test="fn:exists(cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.1'])">
						<xsl:call-template name="reasonforReferralSectionCCDA">
							<xsl:with-param name="reasonforReferralSection"
								select="cda:ClinicalDocument/cda:component/cda:structuredBody/cda:component/cda:section[cda:templateId/@root='1.3.6.1.4.1.19376.1.5.3.1.3.1']" />
								<xsl:with-param name="srcMnemonic" select="$srcMnemonic" />
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
			</Body>
		</ToCSummary>
	</xsl:template>

</xsl:stylesheet>
