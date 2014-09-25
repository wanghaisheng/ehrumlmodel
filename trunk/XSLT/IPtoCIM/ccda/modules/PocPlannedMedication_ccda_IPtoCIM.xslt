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
    <xsl:template name="pocPlannedMedicationSectionCCDA">
        <xsl:param name="pocPlannedMedicationSection"/>

		<Service>
			<xsl:for-each select="$pocPlannedMedicationSection/@moodCode"> 
				<ServiceType> 
					<xsl:sequence select="fn:string(.)"/>
				</ServiceType> 
			</xsl:for-each>
						
                <xsl:for-each select="$pocPlannedMedicationSection/cda:id">
                    <xsl:call-template name="idII">
                        <xsl:with-param name="idII" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'ServiceID'" />
                    </xsl:call-template>
                </xsl:for-each>
                
                <xsl:for-each select="$pocPlannedMedicationSection/cda:consumable/cda:manufacturedProduct/cda:manufacturedLabeledDrug/cda:code">
                    <xsl:call-template name="codeCD">
                    	<xsl:with-param name="elementName" select="'ServiceCode'"/>
                        <xsl:with-param name="code" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
             </Service>
    </xsl:template>
</xsl:stylesheet>