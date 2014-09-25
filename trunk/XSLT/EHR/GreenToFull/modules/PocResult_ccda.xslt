<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt"/>
    <xsl:template name="pocResultCCDA">
        <xsl:param name="pocResult"/>
        
        <!-- CONF:8809 -->
        <entry>
            <!-- CONF:8568; CONF:8569; -->
            <observation classCode="OBS">
                <xsl:attribute name="moodCode" namespace="" select="$pocResult/toc:ServiceType"/>
                <!-- CONF:8810; CONF:8583; CONF:10512 -->
                <templateId root="2.16.840.1.113883.10.20.22.4.44"/>
                
                <!-- CONF:8571; -->
                <xsl:for-each select="$pocResult/toc:ServiceID">
                    <xsl:call-template name="idII">
                        <xsl:with-param name="idII" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="$pocResult/toc:ServiceCode">
                    <xsl:call-template name="codeCD">
                    	<xsl:with-param name="elementName" select="'code'"/>
                        <xsl:with-param name="code" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
            </observation>
        </entry>
    </xsl:template>
</xsl:stylesheet>