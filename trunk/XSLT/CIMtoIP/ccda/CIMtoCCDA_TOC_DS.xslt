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
	<xsl:import href="sections/DischargeDiagnosis_ccda.xslt" />
	<xsl:import href="sections/HospitalCourse_ccda.xslt" />
	<xsl:import href="sections/Immunizations_ccda.xslt" />
	<xsl:import href="sections/DischargeMeds_ccda.xslt" />
	
	<!-- Optional Sections -->
	<xsl:import href="sections/VitalSigns_ccda.xslt" />
	<xsl:import href="sections/FunctionalStatus_ccda.xslt" />
	<xsl:import href="sections/ChiefComplaint_ccda.xslt" />
	<xsl:import href="sections/ChiefComplaintReasonForVisit_ccda.xslt" />
	<xsl:import href="sections/DischargeDiet_ccda.xslt" />
	<xsl:import href="sections/FamilyHistory_ccda.xslt" />
	<xsl:import href="sections/HistoryofPresentIllness_ccda.xslt" />
	<xsl:import href="sections/HospitalConsultations_ccda.xslt" />
	<xsl:import href="sections/HospitalDischargePhysical_ccda.xslt" />
	<xsl:import href="sections/HospitalDischargeStudiesSummary_ccda.xslt" />
	<xsl:import href="sections/ReviewofSystems_ccda.xslt" />
	<xsl:import href="sections/ReasonforVisit_ccda.xslt" />
	<xsl:import href="sections/SocialHistory_ccda.xslt" />
	<xsl:import href="sections/ListofSurgeries_ccda.xslt" />

	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:param name="mnemonic" />
	<xsl:template match="/">

		<ClinicalDocument xmlns="urn:hl7-org:v3"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc"
			xmlns:mif="urn:hl7-org:v3/mif">

			<!-- TODO : For Darren - 01/13/2012 - Modify this when you are working 
				on this section according to the TOC-DS- CCDA requirements -->
			<xsl:call-template name="headerInformationCCDA">
				<xsl:with-param name="header" select="toc:ToCSummary/toc:Header" />
				<xsl:with-param name="code" select="'18842-5'" />
				<xsl:with-param name="displayName" select="'Discharge summarization note'" />
				<xsl:with-param name="title" select="toc:ToCSummary/toc:Header/toc:DocumentTitle" />
				<xsl:with-param name="documentTemplateId"
					select="'2.16.840.1.113883.3.1275.1.1.1.1'" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<component>
				<xsl:choose>
					<xsl:when test="$mnemonic=$TOCDischargeSummary_Level1">
						<xsl:call-template name="CIMtoCCDA_TOC_DS_L1">
							<xsl:with-param name="tocSummary" select="toc:ToCSummary" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$mnemonic=$TOCDischargeSummary_Level2">
						<xsl:call-template name="CIMtoCCDA_TOC_DS_L2">
							<xsl:with-param name="tocSummary" select="toc:ToCSummary" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$mnemonic=$TOCDischargeSummary_Level3">
						<xsl:call-template name="CIMtoCCDA_TOC_DS_L3">
							<xsl:with-param name="tocSummary" select="toc:ToCSummary" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="CIMtoCCDA_TOC_DS_L3">
							<xsl:with-param name="tocSummary" select="toc:ToCSummary" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<xsl:template name="CIMtoCCDA_TOC_DS_L1">
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

	<xsl:template name="CIMtoCCDA_TOC_DS_L2">
		<xsl:param name="tocSummary" />
		<xsl:param name="mnemonic" />
		<xsl:call-template name="CIMtoCCDA_TOC_DS_L3">
			<xsl:with-param name="tocSummary" select="$tocSummary" />
			<xsl:with-param name="mnemonic" select="$mnemonic" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="CIMtoCCDA_TOC_DS_L3">
		<xsl:param name="tocSummary" />
		<xsl:param name="mnemonic" />
		<structuredBody>
			
			<!-- Required Sections -->
			<xsl:call-template name="activeProblemsCCDA">
				<xsl:with-param name="activeProblems"
					select="$tocSummary/toc:Body/toc:ActiveProblems" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="allergiesCCDA">
	           <xsl:with-param name="allergies" select="$tocSummary/toc:Body/toc:Allergies" />
	           <xsl:with-param name="mnemonic" select="$mnemonic" />
	       </xsl:call-template>

			<xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:Procedures)">
				<xsl:call-template name="proceduresCCDA">
					<xsl:with-param name="procedures"
						select="$tocSummary/toc:Body/toc:Procedures" />
					<xsl:with-param name="mnemonic" select="$mnemonic" />
				</xsl:call-template>
			</xsl:if>
			
			<xsl:call-template name="dischargeDiagnosisCCDA">
				<xsl:with-param name="dischargeDiagnosis"
					select="$tocSummary/toc:Body/toc:DischargeDiagnosis" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>
			
       		<xsl:call-template name="dischargeMedsCCDA">
	           <xsl:with-param name="dischargeMeds" select="$tocSummary/toc:Body/toc:DischargeMeds" />
	           <xsl:with-param name="mnemonic" select="$mnemonic" />
	        </xsl:call-template>

		    <xsl:call-template name="hospitalCourseCCDA">
	           <xsl:with-param name="hospitalCourse" select="$tocSummary/toc:Body/toc:HospitalCourse" />
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
	       
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:ReviewofSystems)">
		       <xsl:call-template name="reviewofSystemsCCDA">
		           <xsl:with-param name="reviewofSystems" select="$tocSummary/toc:Body/toc:ReviewofSystems" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:SocialHistory)">
		       <xsl:call-template name="socialHistoryCCDA">
		           <xsl:with-param name="socialHistory" select="$tocSummary/toc:Body/toc:SocialHistory" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:VitalSigns)">
		       <xsl:call-template name="vitalSignsCCDA">
		           <xsl:with-param name="vitalSigns" select="$tocSummary/toc:Body/toc:VitalSigns" />
		       </xsl:call-template>
		   </xsl:if>
		   
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:HospitalDischargePhysical)">
		       <xsl:call-template name="hospitalDischargePhysicalCCDA">
		           <xsl:with-param name="hospitalDischargePhysical" select="$tocSummary/toc:Body/toc:HospitalDischargePhysical" />
		       </xsl:call-template>
		   </xsl:if>
		   
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:HospitalDischargeStudiesSummary)">
		       <xsl:call-template name="hospitalDischargeStudiesSummaryCCDA">
		           <xsl:with-param name="hospitalDischargeStudiesSummary" select="$tocSummary/toc:Body/toc:HospitalDischargeStudiesSummary" />
		       </xsl:call-template>
		   </xsl:if>
		   
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:HistoryofPresentIllness)">
		       <xsl:call-template name="historyofPresentIllnessCCDA">
		           <xsl:with-param name="historyofPresentIllness" select="$tocSummary/toc:Body/toc:HistoryofPresentIllness" />
		       </xsl:call-template>
		   </xsl:if>
		   
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:ChiefComplaintReasonforVisit)">
		       <xsl:call-template name="chiefComplaintReasonforVisitCCDA">
		           <xsl:with-param name="chiefComplaintReasonforVisit" select="$tocSummary/toc:Body/toc:ChiefComplaintReasonforVisit" />
		       </xsl:call-template>
		   </xsl:if>
		   
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:ChiefComplaint)">
		       <xsl:call-template name="chiefComplaintCCDA">
		           <xsl:with-param name="chiefComplaint" select="$tocSummary/toc:Body/toc:ChiefComplaint" />
		       </xsl:call-template>
		   </xsl:if>
		   
		  <!--  <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:ListofSurgeries)">
				<xsl:call-template name="listofSurgeriesCCDA">
					<xsl:with-param name="listofSurgeries" select="$tocSummary/toc:Body/toc:ListofSurgeries" />
				</xsl:call-template>
			</xsl:if> -->
		   
		    <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:ReasonforVisit)">
		       <xsl:call-template name="reasonforVisitCCDA">
		           <xsl:with-param name="reasonforVisit" select="$tocSummary/toc:Body/toc:ReasonforVisit" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:DischargeDiet)">
		       <xsl:call-template name="dischargeDietCCDA">
		           <xsl:with-param name="dischargeDiet" select="$tocSummary/toc:Body/toc:DischargeDiet" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:FunctionalStatus)">
		       <xsl:call-template name="functionalStatusCCDA">
		           <xsl:with-param name="functionalStatus" select="$tocSummary/toc:Body/toc:FunctionalStatus" />
		       </xsl:call-template>
		   </xsl:if>
		   
		     <xsl:if test="fn:exists(toc:ToCSummary/toc:Body/toc:FamilyHistory)">
		       <xsl:call-template name="familyHistoryCCDA">
		           <xsl:with-param name="familyHistory" select="$tocSummary/toc:Body/toc:FamilyHistory" />
		       </xsl:call-template>
		   </xsl:if>

		</structuredBody>
	</xsl:template>
</xsl:stylesheet>