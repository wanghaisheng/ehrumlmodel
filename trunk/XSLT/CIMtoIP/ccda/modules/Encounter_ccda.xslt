<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    <xsl:template name="encounterCCDA">
        <xsl:param name="encounter"/>        
        
        <!-- CONF:8805 -->
        <entry>
            <!-- CONF:8564; CONF:8565; -->
            <encounter classCode="ENC">
                <xsl:attribute name="moodCode" namespace="" select="$encounter/toc:ServiceType"/>
                <!-- CONF:8806; CONF:8566; CONF:10511 -->
                <templateId root="2.16.840.1.113883.10.20.22.4.40" />
                
                <!-- CONF:8567; -->
                <xsl:for-each select="$encounter/toc:EncounterID">
                    <xsl:call-template name="idII">
                        <xsl:with-param name="idII" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
            </encounter>
        </entry>
    </xsl:template>
</xsl:stylesheet>