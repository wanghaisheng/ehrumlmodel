<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps.xslt"/>
    <xsl:import href="../constants.xslt"/>
    <xsl:import href="../modules/Procedure.xslt"/>
    <xsl:template name="procedures">
        <xsl:param name="procedures"/>
		<component>
			<section>
				<templateId root='2.16.840.1.113883.3.88.11.83.145'/>
                <templateId root='1.3.6.1.4.1.19376.1.5.3.1.1.13.2.11'/>
                <templateId root='2.16.840.1.113883.3.88.11.83.144'/>
                <templateId root='2.16.840.1.113883.10.20.1.12'/>
				<code code="47519-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="History of procedures"/>
				<title>
					<xsl:sequence select="'procedures'"/>
				</title>
				<xsl:if test="fn:exists($procedures/toc:text)">
					<text>
						<xsl:for-each select="$procedures/toc:Text">
							<!-- <xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each> -->
							<xsl:apply-templates select="@* | child::*"/>
						</xsl:for-each>
					</text>
				</xsl:if>
				<xsl:for-each select="$procedures/toc:Procedure">
					<xsl:call-template name="procedure">
						<xsl:with-param name="procedure" select="(self::node())" />
                        <xsl:with-param name="whereFrom" select="'proc'" />
					</xsl:call-template>
				</xsl:for-each>
			</section>
		</component>
    </xsl:template>
</xsl:stylesheet>