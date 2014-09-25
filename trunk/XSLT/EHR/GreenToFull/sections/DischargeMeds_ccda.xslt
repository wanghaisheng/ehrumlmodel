<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt" />
	<xsl:import href="../modules/Medication_ccda.xslt" />
	<xsl:import href="../narratives_ccda.xslt" />

	<xsl:template name="dischargeMedsCCDA">
		<xsl:param name="dischargeMeds" />
		<xsl:param name="mnemonic" />
		<!-- For Level 2 and Level 3, the section header and text fields will be 
			generated -->
		<xsl:for-each select="$dischargeMeds">
			<component>
				<section>
					<!--Processing Conformance 7816 and conformance type SHALL -->
					<templateId>
						<!--Processing Conformance 10396 and conformance type SHALL -->
						<xsl:attribute name="root">2.16.840.1.113883.10.20.22.2.11</xsl:attribute>
					</templateId>
					<!--Processing Conformance 7817 and conformance type SHALL -->
					<code>
						<!--Processing Conformance 7817 and conformance type SHALL -->
						<xsl:attribute name="code">10183-2</xsl:attribute>
						<!--Processing Conformance 7817 and conformance type SHALL -->
						<xsl:attribute name="codeSystem">2.16.840.1.113883.6.1</xsl:attribute>
						<!--Processing Conformance 7817 and conformance type SHALL -->
						<xsl:attribute name="codeSystemName">LOINC</xsl:attribute>
						<!--Processing Conformance 7817 and conformance type SHALL -->
						<xsl:attribute name="displayName">HOSPITAL DISCHARGE MEDICATIONS</xsl:attribute>
					</code>
					<!--Processing Conformance 7818 and conformance type SHALL -->
					<title>Hospital Discharge Medications</title>
					<!--Processing Conformance 7819 and conformance type SHALL -->
					<xsl:for-each select="$dischargeMeds/toc:Text">
						<text>
							<xsl:apply-templates select="@* | child::*" />
						</text>
					</xsl:for-each>
					<!--Processing Conformance 7820 and conformance type SHOULD -->
				    <xsl:if test="(($mnemonic and ($mnemonic=$DischargeSummary_Level3)) or ($mnemonic and ($mnemonic=$TOCDischargeSummary_Level3))
				    								or ($mnemonic and ($mnemonic=$TOCDischargeInstructions_Level3)))">
						<xsl:for-each select="$dischargeMeds/toc:Medication">
							<!-- Narrative Text -->
							<!-- <xsl:variable name="idNumber"> <xsl:number level="any"/> </xsl:variable> -->
							<entry>
								<xsl:call-template name="Discharge-Medication">
									<xsl:with-param name="context" select="(self::node())"></xsl:with-param>
									<!-- Narrative Text -->
									<!-- <xsl:with-param name="idNum" select="$idNumber"/> -->
								</xsl:call-template>
							</entry>
						</xsl:for-each>
					</xsl:if>
				</section>
			</component>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="Discharge-Medication">
		<xsl:param name="context" select="toc:Medication" />
		<act>
			<!--Processing Conformance 7689 and conformance type SHALL -->
			<xsl:attribute name="classCode">ACT</xsl:attribute>
			<!--Processing Conformance 7690 and conformance type SHALL -->
			<xsl:attribute name="moodCode">EVN</xsl:attribute>
			<!--Processing Conformance NA and conformance type SHALL -->
			<templateId>
				<!--Processing Conformance NA and conformance type SHALL -->
				<xsl:attribute name="root">2.16.840.1.113883.10.20.22.4.35</xsl:attribute>
			</templateId>
			<!--Processing Conformance 7691 and conformance type SHALL -->
			<code>
				<!--Processing Conformance 7691 and conformance type SHALL -->
				<xsl:attribute name="code">10183-2</xsl:attribute>
				<!--Processing Conformance 7691 and conformance type SHALL -->
				<xsl:attribute name="codeSystem">2.16.840.1.113883.6.1</xsl:attribute>
			</code>
			<!--Processing Conformance 7692 and conformance type SHALL -->
			<entryRelationship>
				<!--Processing Conformance 7693 and conformance type SHALL -->
				<xsl:attribute name="typeCode">SUBJ</xsl:attribute>
				<!--Processing Conformance 7694 and conformance type SHALL -->
				<xsl:call-template name="Medication-Activity">
					<xsl:with-param name="context" select="self::node()" />
				</xsl:call-template>
			</entryRelationship>
		</act>
	</xsl:template>

</xsl:stylesheet>