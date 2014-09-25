<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>    

    <xsl:template name="plannedMedicationCCDA">
        <xsl:param name="plannedMedication"/>
        
        <!-- CONF:8809 -->
		<entry>
			<substanceAdministration classCode="SBADM">
                <xsl:attribute name="moodCode" namespace="" select="$plannedMedication/toc:ServiceType"/>
                <!-- CONF:8810; CONF:8574; CONF:10514 -->
                <templateId root="2.16.840.1.113883.10.20.22.4.42"/>
                
                <!-- CONF:8575; -->
                <xsl:for-each select="$plannedMedication/toc:ServiceID">
                    <xsl:call-template name="idII">
                        <xsl:with-param name="idII" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
                <consumable>
                    <manufacturedProduct>
                    	<manufacturedLabeledDrug>
                    	
                    	<xsl:for-each select="$plannedMedication/toc:ServiceCode">
                    		<xsl:call-template name="codeCD">
                    			<xsl:with-param name="elementName" select="'code'"/>
                        		<xsl:with-param name="code" select="." as="node()" />
                    		</xsl:call-template>
                		</xsl:for-each>
                
                        </manufacturedLabeledDrug>
                    </manufacturedProduct>
                </consumable>
			</substanceAdministration>
		</entry>
    </xsl:template>
</xsl:stylesheet>