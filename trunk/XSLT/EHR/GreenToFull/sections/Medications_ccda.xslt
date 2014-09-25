<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../modules/Medication_ccda.xslt" />

	<xsl:template name="medicationsCCDA">
		<xsl:param name="medications" />
		<xsl:param name="mnemonic" />
		<!-- For Level 2 and Level 3, the section header and text fields will be 
			generated -->
		<xsl:for-each select="$medications">
			<component>
				<section>
					<!--Processing Conformance 7791 and conformance type SHALL -->
					<templateId>
						<!--Processing Conformance 10432 and conformance type SHALL -->
						<xsl:attribute name="root">2.16.840.1.113883.10.20.22.2.1</xsl:attribute>
					</templateId>
					<!--Processing Conformance 7792 and conformance type SHALL -->
					<code>
						<!--Processing Conformance 7792 and conformance type SHALL -->
						<xsl:attribute name="code">10160-0</xsl:attribute>
						<!--Processing Conformance 7792 and conformance type SHALL -->
						<xsl:attribute name="codeSystem">2.16.840.1.113883.6.1</xsl:attribute>
						<!--Processing Conformance 7792 and conformance type SHALL -->
						<xsl:attribute name="codeSystemName">LOINC</xsl:attribute>
						<!--Processing Conformance 7792 and conformance type SHALL -->
						<xsl:attribute name="displayName">HISTORY OF MEDICATION USE</xsl:attribute>
					</code>
					<!--Processing Conformance 7793 and conformance type SHALL -->
					<title>Medications</title>
					<!--Processing Conformance 7794 and conformance type SHALL -->
					<xsl:for-each select="toc:Text">
						<text>
							<xsl:apply-templates select="@* | child::*" />
						</text>
					</xsl:for-each>
					<!--Processing Conformance 7820 and conformance type SHOULD -->
					<xsl:if
						test="toc:Medication and (($mnemonic and ($mnemonic=$DischargeSummary_Level3)) or 
												 ($mnemonic and ($mnemonic=$TOCConsultationRequest_Level3)) or 
												 ($mnemonic and ($mnemonic=$TOCConsultationSummary_Level3)))">
						<xsl:for-each select="toc:Medication">
							<entry>
								<!--Processing Conformance 7796 and conformance type SHALL -->
								<xsl:call-template name="Medication-Activity">
									<xsl:with-param name="context" select="." />
								</xsl:call-template>
							</entry>
						</xsl:for-each>
					</xsl:if>
				</section>
			</component>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>