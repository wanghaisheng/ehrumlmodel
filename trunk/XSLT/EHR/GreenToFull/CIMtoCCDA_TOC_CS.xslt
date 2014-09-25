<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="constants_ccda.xslt" />
	<xsl:import href="maps_ccda.xslt" />
	<xsl:import href="sections/HeaderInformation_ccda.xslt" />
	<xsl:import href="sections/ActiveProblems_ccda.xslt" />
	<xsl:import href="sections/Allergies_ccda.xslt" />
	<xsl:import href="sections/PlanOfCare_ccda.xslt" />
	<xsl:import href="sections/Procedures_ccda.xslt" />
	<xsl:import href="sections/Results_ccda.xslt" />
	<xsl:import href="sections/Medications_ccda.xslt" />
	<xsl:import href="sections/Immunizations_ccda.xslt" />
	<xsl:import href="sections/MedicalEquipment_ccda.xslt" />
	<xsl:import href="sections/AdvanceDirectives_ccda.xslt" />

	<!-- Optional Sections -->
	<xsl:import href="sections/Encounters_ccda.xslt" />
	<xsl:import href="sections/ReasonforReferral_ccda.xslt" />
	<xsl:import href="sections/VitalSigns_ccda.xslt" />
	<xsl:import href="sections/FamilyHistory_ccda.xslt" />
	<xsl:import href="sections/SocialHistory_ccda.xslt" />
	<xsl:import href="sections/FunctionalStatus_ccda.xslt" />
	<xsl:import href="sections/Payers_ccda.xslt" />
	
	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:param name="mnemonic" />
	<xsl:template match="/">

		<ClinicalDocument xmlns="urn:hl7-org:v3"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc"
			xmlns:mif="urn:hl7-org:v3/mif">

			<!-- Updated the code, displayName and the documentTemplateID from MDHT -->
			<xsl:call-template name="headerInformationCCDA">
				<xsl:with-param name="header" select="toc:ToCSummary/toc:Header" />
				<xsl:with-param name="code" select="'01234-6'" />
				<xsl:with-param name="displayName"
					select="'Consultation Summary Document'" />
				<xsl:with-param name="title" select="toc:ToCSummary/toc:Header/toc:DocumentTitle" />
				<xsl:with-param name="documentTemplateId"
					select="'2.16.840.1.113883.3.1275.1.1.3.1'" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<component>
				<xsl:choose>
					<xsl:when test="$mnemonic=$TOCConsultationSummary_Level1">
						<xsl:call-template name="CIMtoCCDA_TOC_CS_L1">
							<xsl:with-param name="tocSummary" select="toc:ToCSummary" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$mnemonic=$TOCConsultationRequest_Level2">
						<xsl:call-template name="CIMtoCCDA_TOC_CS_L2">
							<xsl:with-param name="tocSummary" select="toc:ToCSummary" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$mnemonic=$TOCConsultationRequest_Level3">
						<xsl:call-template name="CIMtoCCDA_TOC_CS_L3">
							<xsl:with-param name="tocSummary" select="toc:ToCSummary" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="CIMtoCCDA_TOC_CS_L3">
							<xsl:with-param name="tocSummary" select="toc:ToCSummary" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<xsl:template name="CIMtoCCDA_TOC_CS_L1">
		<xsl:param name="tocSummary" />
		<xsl:param name="mnemonic" />
		<nonXMLBody>
			<xsl:if test="fn:exists($tocSummary/toc:Body/toc:UnstructuredData/toc:text)">
				<xsl:call-template name="mapNonXMLBodyText">
					<xsl:with-param name="text" select="$tocSummary/toc:Body/toc:UnstructuredData/toc:text" />
				</xsl:call-template>
			</xsl:if>
		</nonXMLBody>
	</xsl:template>

	<xsl:template name="CIMtoCCDA_TOC_CS_L2">
		<xsl:param name="tocSummary" />
		<xsl:param name="mnemonic" />
		<xsl:call-template name="CIMtoCCDA_TOC_CS_L3">
			<xsl:with-param name="tocSummary" select="$tocSummary" />
			<xsl:with-param name="mnemonic" select="$mnemonic" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="CIMtoCCDA_TOC_CS_L3">
		<xsl:param name="tocSummary" />
		<xsl:param name="mnemonic" />
		<structuredBody>

			<xsl:call-template name="resultsCCDA">
				<xsl:with-param name="results"
					select="$tocSummary/toc:Body/toc:Results" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="activeProblemsCCDA">
				<xsl:with-param name="activeProblems"
					select="$tocSummary/toc:Body/toc:ActiveProblems" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="advanceDirectivesCCDA">
				<xsl:with-param name="advanceDirectives"
					select="$tocSummary/toc:Body/toc:AdvanceDirectives" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<!-- Required Sections -->
			<xsl:call-template name="allergiesCCDA">
				<xsl:with-param name="allergies"
					select="$tocSummary/toc:Body/toc:Allergies" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="proceduresCCDA">
				<xsl:with-param name="procedures"
					select="$tocSummary/toc:Body/toc:Procedures" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="medicationsCCDA">
				<xsl:with-param name="medications"
					select="$tocSummary/toc:Body/toc:Medications" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="medicalEquipmentCCDA">
				<xsl:with-param name="medicalEquipment"
					select="$tocSummary/toc:Body/toc:MedicalEquipment" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="planOfCareCCDA">
				<xsl:with-param name="planofCare"
					select="$tocSummary/toc:Body/toc:PlanofCare" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			 <!-- Optional section -->
			<xsl:if test="fn:exists($tocSummary/toc:Body/toc:Immunizations)">
		        <xsl:call-template name="immunizationsCCDA">
		           <xsl:with-param name="immunizations" select="$tocSummary/toc:Body/toc:Immunizations" />
		           <xsl:with-param name="mnemonic" select="$mnemonic" /> 
		       </xsl:call-template>
	       </xsl:if>
	       
	        <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:VitalSigns)">
		       <xsl:call-template name="vitalSignsCCDA">
		           <xsl:with-param name="vitalSigns" select="$tocSummary/toc:Body/toc:VitalSigns" />
		       </xsl:call-template>
		   </xsl:if>
		   
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:FunctionalStatus)">
		       <xsl:call-template name="functionalStatusCCDA">
		           <xsl:with-param name="functionalStatus" select="$tocSummary/toc:Body/toc:FunctionalStatus" />
		       </xsl:call-template>
		   </xsl:if>
	       
	          <!--  Encounters -->
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:Encounters)">
		       <xsl:call-template name="encountersCCDA">
		           <xsl:with-param name="encounters" select="$tocSummary/toc:Body/toc:Encounters" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!--  Family History -->
		     <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:FamilyHistory)">
		       <xsl:call-template name="familyHistoryCCDA">
		           <xsl:with-param name="familyHistory" select="$tocSummary/toc:Body/toc:FamilyHistory" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!-- Social History -->
		     <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:SocialHistory)">
		       <xsl:call-template name="socialHistoryCCDA">
		           <xsl:with-param name="socialHistory" select="$tocSummary/toc:Body/toc:SocialHistory" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!-- Reason For Referral -->
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:ReasonforReferral)">
		       <xsl:call-template name="reasonforReferralCCDA">
		           <xsl:with-param name="reasonforReferral" select="$tocSummary/toc:Body/toc:ReasonforReferral" />
		           <xsl:with-param name="mnemonic" select="$mnemonic" /> 
		       </xsl:call-template>
		   </xsl:if>
		   		   
		   <!-- Payers -->
		   <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:Payers)">
		       <xsl:call-template name="payersCCDA">
		           <xsl:with-param name="payers" select="$tocSummary/toc:Body/toc:Payers" />
		       </xsl:call-template>
		   </xsl:if>

		</structuredBody>
	</xsl:template>
</xsl:stylesheet>
