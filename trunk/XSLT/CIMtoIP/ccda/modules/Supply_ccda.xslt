<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt"/>
    <xsl:template name="supplyCCDA">
        <xsl:param name="supply"/>
        
        <!-- CONF:8809 -->
        <entry>
            <!-- CONF:8568; CONF:8569; -->
            <supply classCode="SPLY">
                <xsl:attribute name="moodCode" namespace="" select="$supply/toc:ServiceType"/>
                <!-- CONF:8810; CONF:8579; CONF:10515 -->
                <templateId root="2.16.840.1.113883.10.20.22.4.43"/>
                
                <!-- CONF:8580; -->
                <xsl:for-each select="$supply/toc:ServiceID">
                    <xsl:call-template name="idII">
                        <xsl:with-param name="idII" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
            </supply>
        </entry>
    </xsl:template>
</xsl:stylesheet>