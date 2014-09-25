<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">
  <xsl:variable name="LoincCodeSystem" as="xs:string" select="'2.16.840.1.113883.6.1'"/>
  <xsl:variable name="LoincCodeSystemName" as="xs:string" select="'LOINC'"/>
  <xsl:variable name="DischargeSummary_Level1" as="xs:string" select="'DS_L1'"/>
  <xsl:variable name="DischargeSummary_Level2" as="xs:string" select="'DS_L2'"/>
  <xsl:variable name="DischargeSummary_Level3" as="xs:string" select="'DS_L3'"/>
  <xsl:variable name="ConsultationNote_Level1" as="xs:string" select="'CN_L1'"/>
  <xsl:variable name="ConsultationNote_Level2" as="xs:string" select="'CN_L2'"/>
  <xsl:variable name="TOCDischargeSummary_Level1" as="xs:string" select="'CCDA_TOC_DS_L1'"/>
  <xsl:variable name="TOCDischargeSummary_Level2" as="xs:string" select="'CCDA_TOC_DS_L2'"/>
  <xsl:variable name="TOCDischargeSummary_Level3" as="xs:string" select="'CCDA_TOC_DS_L3'"/>
  <xsl:variable name="TOCDischargeInstructions_Level1" as="xs:string" select="'CCDA_TOC_DI_L1'"/>
  <xsl:variable name="TOCDischargeInstructions_Level2" as="xs:string" select="'CCDA_TOC_DI_L2'"/>
  <xsl:variable name="TOCDischargeInstructions_Level3" as="xs:string" select="'CCDA_TOC_DI_L3'"/>
  <xsl:variable name="TOCConsultationSummary_Level1" as="xs:string" select="'CCDA_TOC_CS_L1'"/>
  <xsl:variable name="TOCConsultationSummary_Level2" as="xs:string" select="'CCDA_TOC_CS_L2'"/>
  <xsl:variable name="TOCConsultationSummary_Level3" as="xs:string" select="'CCDA_TOC_CS_L3'"/>
  <xsl:variable name="TOCConsultationRequest_Level1" as="xs:string" select="'CCDA_TOC_CR_L1'"/>
  <xsl:variable name="TOCConsultationRequest_Level2" as="xs:string" select="'CCDA_TOC_CR_L2'"/>
  <xsl:variable name="TOCConsultationRequest_Level3" as="xs:string" select="'CCDA_TOC_CR_L3'"/>
</xsl:stylesheet>	