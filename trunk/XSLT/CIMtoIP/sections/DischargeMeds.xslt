<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../modules/Medication.xslt"/>
    <xsl:import href="../maps.xslt"/>

    <xsl:template name="dischargeMeds">
        <xsl:param name="dischargeMeds"/>
		<component>
			<section>
				<templateId root="2.16.840.1.113883.3.88.11.83.114"/>
				<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.22"/>
				<code code="10183-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HOSPITAL DISCHARGE MEDICATIONS"/>
				<title>Medications</title>
				<xsl:if test="fn:exists($dischargeMeds/toc:Text)">
				<text>
					<!-- <xsl:for-each select="$dischargeMeds/toc:Text">
						<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)"/> 
						</xsl:for-each>
					</xsl:for-each> -->
					<xsl:apply-templates select="$dischargeMeds/toc:Text/node()"/>
				</text>
				</xsl:if>
				<xsl:for-each select="$dischargeMeds/toc:Medication">
					<xsl:call-template name="medication">
						<xsl:with-param name="medication" select="(self::node())"></xsl:with-param>
						<xsl:with-param name="whereFrom" select="'discMeds'" />
					</xsl:call-template>
				</xsl:for-each>
			</section>
		</component>
    </xsl:template>
</xsl:stylesheet>