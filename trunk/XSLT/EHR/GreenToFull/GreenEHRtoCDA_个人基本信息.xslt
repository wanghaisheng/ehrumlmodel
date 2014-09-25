<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/toBSi" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="constants_ccda.xslt" />
	<xsl:import href="maps_ccda.xslt" />
	<xsl:import href="sections/头信息_cda.xslt" />
	<xsl:import href="sections/血型_cda.xslt"/>
	<xsl:import href="sections/社会史_cda.xslt"/>
	<xsl:import href="sections/财务与卫生费用_cda.xslt"/>	
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
	<xsl:import href="sections/HistoryofPastIllness_ccda.xslt" />
	<xsl:import href="sections/ChiefComplaint_ccda.xslt" />
	<xsl:import href="sections/VitalSigns_ccda.xslt" />
	<xsl:import href="sections/PhysicalExamination_ccda.xslt" />
	<xsl:import href="sections/ChiefComplaintReasonForVisit_ccda.xslt" />
	<xsl:import href="sections/FamilyHistory_ccda.xslt" />
	<xsl:import href="sections/SocialHistory_ccda.xslt" />
	<xsl:import href="sections/GeneralStatus_ccda.xslt" />
	<xsl:import href="sections/FunctionalStatus_ccda.xslt" />
	<xsl:import href="sections/Payers_ccda.xslt" />
	

	<xsl:output method="xml" encoding="UTF-8" indent="yes" />
	<xsl:param name="mnemonic" select="'CIMtoCCDA_TOC_BS_L3'" />
	<!--	<xsl:param name="mnemonic" />
-->	
	<xsl:template match="/">

		<ClinicalDocument xmlns="urn:hl7-org:v3"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc"
			xmlns:mif="urn:hl7-org:v3/mif">

			<!-- Updated the code, displayName and the documentTemplateID from MDHT -->
			<xsl:call-template name="头信息CDA">
				<xsl:with-param name="header" select="个人基本信息数据集" />
				<xsl:with-param name="code" select="'01234-5'" />
				<xsl:with-param name="displayName"
					select="'Consultation Request Document'" />
				<xsl:with-param name="title" select="'个人基本信息数据集'" />
				<xsl:with-param name="documentTemplateId"
					select="'Document_template_Root_OID.1'" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
				<xsl:with-param name="DocumentCreationTime" select="'201204101558'" />				
			</xsl:call-template>

			<component>
				<xsl:choose>
					<xsl:when test="$mnemonic=$个人基本信息数据集_Level1">
						<xsl:call-template name="CIMtoCCDA_TOC_BS_L1">
							<xsl:with-param name="根元素" select="个人基本信息数据集" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$mnemonic=$个人基本信息数据集_Level2">
						<xsl:call-template name="CIMtoCCDA_TOC_BS_L2">
							<xsl:with-param name="根元素" select="个人基本信息数据集" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$mnemonic=$个人基本信息数据集_Level3">
						<xsl:call-template name="CIMtoCCDA_TOC_BS_L3">
							<xsl:with-param name="根元素" select="个人基本信息数据集" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="CIMtoCCDA_TOC_BS_L3">
							<xsl:with-param name="根元素" select="个人基本信息数据集" />
							<xsl:with-param name="mnemonic" select="$mnemonic" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<xsl:template name="CIMtoCCDA_TOC_BS_L1">
		<xsl:param name="根元素" />
		<xsl:param name="mnemonic" />
		<nonXMLBody>
			<xsl:if test="fn:exists($根元素/toc:Body/toc:UnstructuredData/toc:text)">
				<xsl:call-template name="mapNonXMLBodyText">
					<xsl:with-param name="text" select="$根元素/toc:Body/toc:UnstructuredData/toc:text" />
				</xsl:call-template>
			</xsl:if>
		</nonXMLBody>
	</xsl:template>

	<xsl:template name="CIMtoCCDA_TOC_BS_L2">
		<xsl:param name="根元素" />
		<xsl:param name="mnemonic" />
		<xsl:call-template name="CIMtoCCDA_TOC_BS_L3">
			<xsl:with-param name="根元素" select="$根元素" />
			<xsl:with-param name="mnemonic" select="$mnemonic" />
		</xsl:call-template>
	</xsl:template>

	<xsl:template name="CIMtoCCDA_TOC_BS_L3">
		<xsl:param name="根元素" />
		<xsl:param name="mnemonic" />
		<structuredBody>
			
			<xsl:call-template name="血型_cda">
				<xsl:with-param name="血型"  select="$根元素/居民基本健康信息/血型" />			
			</xsl:call-template>
			<xsl:call-template name="社会史_CDA">
				<xsl:with-param name="社会史_居民基础信息"  select="$根元素/居民基础信息" />			
			</xsl:call-template>			
			<xsl:call-template name="财务与卫生费用_CDA">
				<xsl:with-param name="居民基础信息_居民社会保障信息"  select="$根元素/居民基础信息" />			
			</xsl:call-template>					
			<xsl:call-template name="resultsCCDA">
				<xsl:with-param name="results"
					select="$根元素/toc:Body/toc:Results" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="activeProblemsCCDA">
				<xsl:with-param name="activeProblems"
					select="$根元素/toc:Body/toc:ActiveProblems" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="advanceDirectivesCCDA">
				<xsl:with-param name="advanceDirectives"
					select="$根元素/toc:Body/toc:AdvanceDirectives" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<!-- Required Sections -->
			<xsl:call-template name="allergiesCCDA">
				<xsl:with-param name="allergies"
					select="$根元素/toc:Body/toc:Allergies" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="proceduresCCDA">
				<xsl:with-param name="procedures"
					select="$根元素/toc:Body/toc:Procedures" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="medicationsCCDA">
				<xsl:with-param name="medications"
					select="$根元素/toc:Body/toc:Medications" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="medicalEquipmentCCDA">
				<xsl:with-param name="medicalEquipment"
					select="$根元素/toc:Body/toc:MedicalEquipment" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			<xsl:call-template name="planOfCareCCDA">
				<xsl:with-param name="planofCare"
					select="$根元素/toc:Body/toc:PlanofCare" />
				<xsl:with-param name="mnemonic" select="$mnemonic" />
			</xsl:call-template>

			 <!--  Optional section -->
	       <xsl:if test="fn:exists($根元素/toc:Body/toc:Immunizations)">
		        <xsl:call-template name="immunizationsCCDA">
		           <xsl:with-param name="immunizations" select="$根元素/toc:Body/toc:Immunizations" />
		           <xsl:with-param name="mnemonic" select="$mnemonic" /> 
		       </xsl:call-template>
	       </xsl:if>
	       
	        <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:VitalSigns)">
		       <xsl:call-template name="vitalSignsCCDA">
		           <xsl:with-param name="vitalSigns" select="$根元素/toc:Body/toc:VitalSigns" />
		       </xsl:call-template>
		   </xsl:if>
		   
		    <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:FunctionalStatus)">
		       <xsl:call-template name="functionalStatusCCDA">
		           <xsl:with-param name="functionalStatus" select="$根元素/toc:Body/toc:FunctionalStatus" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!--  Encounters -->
		    <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:Encounters)">
		       <xsl:call-template name="encountersCCDA">
		           <xsl:with-param name="encounters" select="$根元素/toc:Body/toc:Encounters" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!-- Chief Complaint -->
		   
		   <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:ChiefComplaint)">
		       <xsl:call-template name="chiefComplaintCCDA">
		           <xsl:with-param name="chiefComplaint" select="$根元素/toc:Body/toc:ChiefComplaint" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!-- Physical Exam -->
		    <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:PhysicalExamination)">
		       <xsl:call-template name="physicalExaminationCCDA">
		           <xsl:with-param name="physicalExamination" select="$根元素/toc:Body/toc:PhysicalExamination" />
		           <xsl:with-param name="mnemonic" select="$mnemonic" /> 
		       </xsl:call-template>
	       </xsl:if>
		   
		   <!-- Chief complaint/ Reason for visit -->
		   <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:ChiefComplaintReasonforVisit)">
		       <xsl:call-template name="chiefComplaintReasonforVisitCCDA">
		           <xsl:with-param name="chiefComplaintReasonforVisit" select="$根元素/toc:Body/toc:ChiefComplaintReasonforVisit" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!--  Family History -->
		   
		     <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:FamilyHistory)">
		       <xsl:call-template name="familyHistoryCCDA">
		           <xsl:with-param name="familyHistory" select="$根元素/toc:Body/toc:FamilyHistory" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!-- Social History -->
		     <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:SocialHistory)">
		       <xsl:call-template name="socialHistoryCCDA">
		           <xsl:with-param name="socialHistory" select="$根元素/toc:Body/toc:SocialHistory" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!-- General Status -->
		    <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:GeneralStatus)">
		       <xsl:call-template name="generalStatusCCDA">
		           <xsl:with-param name="generalStatus" select="$根元素/toc:Body/toc:GeneralStatus" />
		           <xsl:with-param name="mnemonic" select="$mnemonic" /> 
		       </xsl:call-template>
		   </xsl:if>
		   		   
		   <!-- History of Past Illness -->
		   <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:HistoryofPastIllness)">
		       <xsl:call-template name="historyofPastIllnessCCDA">
		           <xsl:with-param name="historyofPastIllness" select="$根元素/toc:Body/toc:HistoryofPastIllness" />
		       </xsl:call-template>
		   </xsl:if>
		   
		   <!-- Payers -->
		   <xsl:if test="fn:exists(个人基本信息数据集/toc:Body/toc:Payers)">
		       <xsl:call-template name="payersCCDA">
		           <xsl:with-param name="payers" select="$根元素/toc:Body/toc:Payers" />
		       </xsl:call-template>
		   </xsl:if>

		</structuredBody>
	</xsl:template>

</xsl:stylesheet>
