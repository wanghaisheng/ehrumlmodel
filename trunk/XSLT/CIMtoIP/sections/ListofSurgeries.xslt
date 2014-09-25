<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

   	<xsl:import href="../maps.xslt"/>
    <xsl:import href="../constants.xslt"/>
    <xsl:import href="../modules/Procedure.xslt"/>
    <xsl:template name="listofSurgeries">
        <xsl:param name="listofSurgeries"/>
		<component>
			<section>
				<templateId root="2.16.840.1.113883.3.88.11.83.108"/>
                <templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.11"/>
                <templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.12"/>
				<code>
					<xsl:attribute name="code" namespace="" select="'47519-4'"/>
					<xsl:attribute name="codeSystem" namespace="" select="$var1"/>
					<xsl:attribute name="displayName" namespace="" select="'History of Procedures'"/>
					<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
				</code>
				<title>
					<xsl:sequence select="'list of surgeries'"/>
				</title>
				
				<xsl:if test="fn:exists($listofSurgeries/toc:text)">
					 <text>
						<xsl:for-each select="$listofSurgeries/toc:text">
							<xsl:apply-templates select="node()"/>
						</xsl:for-each>
					</text>
				</xsl:if>
				
				<xsl:for-each select="$listofSurgeries/toc:procedure">
					<xsl:call-template name="procedure">
						<xsl:with-param name="procedure" select="(self::node())"></xsl:with-param>
						<xsl:with-param name="whereFrom" select="'surg'" />
					</xsl:call-template>
				</xsl:for-each>
			</section>
		</component>
    </xsl:template>
</xsl:stylesheet>