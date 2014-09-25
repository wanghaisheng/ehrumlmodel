<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../modules/Procedure.xslt"/>
    <xsl:import href="../modules/Result.xslt"/>
    <xsl:import href="../maps.xslt"/>

    <xsl:template name="results">
        <xsl:param name="results"/>
		<component>
			<section>
				<templateId root="2.16.840.1.113883.3.88.11.83.122" assigningAuthorityName="HITSP C83"/>
				<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.28" assigningAuthorityName="IHE PCC"/>
				<templateId root="2.16.840.1.113883.10.20.1.14" assigningAuthorityName="HL7 SDTC CCD"/>
				<code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Results"/>
				<title>Results</title>
			   <!--  <text>
                            <xsl:for-each select="$results/toc:text">
                                 <xsl:for-each select="node()[./self::text()]">
                                    <xsl:sequence select="fn:string(.)"/>
                                </xsl:for-each>
                            </xsl:for-each>
                 </text> -->
                 <xsl:if test="fn:exists($results/toc:Text)">
					<text>
						<xsl:for-each select="$results/toc:Text">
							<xsl:apply-templates select="@* | child::*"/>
						</xsl:for-each>
					</text>
				</xsl:if>
				<xsl:for-each select="$results/toc:procedure">
					<xsl:call-template name="procedure">
						<xsl:with-param name="procedure" select="(self::node())">
						 <xsl:with-param name="whereFrom" select="'results'" />
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="$results/toc:result">
					<xsl:call-template name="result">
						<xsl:with-param name="result" select="(self::node())"/>
					</xsl:call-template>
				</xsl:for-each>
			</section>
		</component>
    </xsl:template>
</xsl:stylesheet>