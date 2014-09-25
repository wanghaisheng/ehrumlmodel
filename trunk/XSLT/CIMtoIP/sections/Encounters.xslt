<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps.xslt"/>
    <xsl:import href="../constants.xslt"/>
    <xsl:import href="../modules/Encounter.xslt"/>
    <xsl:template name="encounters">
        <xsl:param name="encounters"/>
		<component>
			<section>
				<templateId root="2.16.840.1.113883.3.88.11.83.127"/>
                <templateId root="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.3"/>
                <templateId root="2.16.840.1.113883.10.20.1.3"/>
				<code>
					<xsl:attribute name="code" namespace="" select="'46240-8'"/>
					<xsl:attribute name="codeSystem" namespace="" select="$var1"/>
				</code>
				<title>
					<xsl:sequence select="'Encounters'"/>
				</title>
				<xsl:if test="fn:exists($encounters/toc:Text)">
		   	 		<text>	
                         <!-- <xsl:for-each select="$encounters/toc:text">
                              <xsl:for-each select="node()[./self::text()]">
                                 <xsl:sequence select="fn:string(.)"/>
                             </xsl:for-each>
                         </xsl:for-each> -->
                        <xsl:apply-templates select="$encounters/toc:Text/node()"/>
                 	</text>
                 </xsl:if>
			<xsl:for-each select="$encounters/toc:encounter">
					<xsl:call-template name="encounter">
						<xsl:with-param name="encounter" select="(self::node())"></xsl:with-param>
						<xsl:with-param name="whereFrom" select="'enc'" />
					</xsl:call-template>
				</xsl:for-each>
			</section>
		</component>
    </xsl:template>
</xsl:stylesheet>