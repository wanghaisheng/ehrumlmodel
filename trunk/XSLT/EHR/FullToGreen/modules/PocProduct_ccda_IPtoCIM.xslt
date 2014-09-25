<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri"
	xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../templates.xslt"/>
    <xsl:template name="pocProductSectionCCDA">
        <xsl:param name="pocProductSection"/>

			<Service>
				<xsl:for-each select="$pocProductSection/@moodCode"> 
					<ServiceType> 
						<xsl:sequence select="fn:string(.)"/>
					</ServiceType> 
				</xsl:for-each>
                <xsl:for-each select="$pocProductSection/cda:id">
                    <xsl:call-template name="idII">
                        <xsl:with-param name="idII" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'ServiceID'" />
                    </xsl:call-template>
                </xsl:for-each>
             </Service>
    </xsl:template>
</xsl:stylesheet>