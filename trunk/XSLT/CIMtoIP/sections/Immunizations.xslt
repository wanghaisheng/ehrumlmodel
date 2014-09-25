<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

   <xsl:import href="../maps.xslt"/>
   <xsl:import href="../modules/Immunization.xslt"/>

    <xsl:template name="immunizations">
        <xsl:param name="immunizations"/>
		<component>
			<section>
			<templateId root='2.16.840.1.113883.3.88.11.83.117' assigningAuthorityName='HITSP C83' />
			<templateId root='2.16.840.1.113883.10.20.1.6' assigningAuthorityName='HITSP C83' />
			 <templateId root='1.3.6.1.4.1.19376.1.5.3.1.3.23' assigningAuthorityName='IHE PCC' />
			<code code="11369-6" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="History of immunizations"/>
			<title>
                <xsl:sequence select="'immunization'"/>
            </title>
				<xsl:if test="fn:exists($immunizations/toc:text)">
					<text>
						<xsl:apply-templates select="$immunizations/toc:text/node()"/>
					</text>
				</xsl:if>
				<xsl:for-each select="$immunizations/toc:Immunization">
					<xsl:call-template name="immunization">
						<xsl:with-param name="immunization" select="(self::node())"></xsl:with-param>
						<xsl:with-param name="whereFrom" select="'imm'" />
					</xsl:call-template>
				</xsl:for-each>
			</section>
		</component>
    </xsl:template>
    
</xsl:stylesheet>