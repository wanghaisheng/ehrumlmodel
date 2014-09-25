<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps.xslt"/>
    <xsl:import href="../modules/Medication.xslt"/>

    <xsl:template name="medications">
        <xsl:param name="medications"/>
		<component>
			<section>
				<templateId root="2.16.840.1.113883.3.88.11.83.112"/>
				<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.19"/>
				<templateId root="2.16.840.1.113883.10.20.1.8"/>
				<code code="10160-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="History of medication use"/>
				<title>Medications</title>
				<xsl:for-each select="$medications/toc:Text">
					<text>
						<xsl:apply-templates select="@* | child::*"/>
					</text>
				</xsl:for-each>
				
				<xsl:for-each select="$medications/toc:medication">
					<xsl:call-template name="medication">
						<xsl:with-param name="medication" select="(self::node())"></xsl:with-param>
						<xsl:with-param name="whereFrom" select="'meds'" />
					</xsl:call-template>
				</xsl:for-each>
			</section>
		</component>
    </xsl:template>
</xsl:stylesheet>