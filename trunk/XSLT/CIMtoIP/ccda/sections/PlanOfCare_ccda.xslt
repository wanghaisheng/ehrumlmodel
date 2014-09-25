<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    <xsl:import href="../constants_ccda.xslt"/>
    <xsl:import href="../modules/Encounter_ccda.xslt"/>
    <xsl:import href="../modules/HealthCareService_ccda.xslt"/>
    <xsl:import href="../modules/PocResult_ccda.xslt"/>
    <xsl:import href="../modules/Procedure_ccda.xslt"/>
    <xsl:import href="../modules/PlannedMedication_ccda.xslt"/> 
    <xsl:import href="../modules/Supply_ccda.xslt"/> 
    
    <xsl:template name="planOfCareCCDA">
        <xsl:param name="planofCare"/>
        <xsl:param name="mnemonic" />
        <!--  For Level 2 and Level 3, the section header and text fields will be generated  -->
            <xsl:for-each select="$planofCare">
            <component>
                <section>
                    <!-- CONF:9550; CONF:7723; CONF:10435 -->
                    <templateId root="2.16.840.1.113883.10.20.22.2.10"/>
                    <!--  **** Plan of Care section template  **** -->
                    <!-- CONF:7724 -->
                    <code>
                        <xsl:attribute name="code" namespace="" select="'18776-5'"/>
                        <xsl:attribute name="codeSystem" namespace="" select="$LoincCodeSystem"/>
                        <xsl:attribute name="codeSystemName" namespace="" select="$LoincCodeSystemName"/>
                        <xsl:attribute name="displayName" namespace="" select="'Treatment plan'"/>
                    </code>
                    <title>
                        <xsl:sequence select="'Plan of Care'"/>
                    </title>
                    <!-- CONF:7725 -->
                    <text>
    	                <xsl:apply-templates select="toc:Text/node()"/>
                    </text>
                    <xsl:for-each select="toc:Results/toc:Service">
                        <xsl:call-template name="pocResultCCDA">
                            <xsl:with-param name="pocResult" select="(self::node())"></xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:HealthCareService/toc:Service">
                        <xsl:call-template name="healthCareServiceCCDA">
                            <xsl:with-param name="healthCareService" select="(self::node())"></xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:Encounters/toc:Encounter">
                        <xsl:call-template name="encounterCCDA">
                            <xsl:with-param name="encounter" select="(self::node())"></xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:Procedures/toc:Procedure">
                        <xsl:call-template name="procedureCCDA">
                            <xsl:with-param name="procedure" select="(self::node())"></xsl:with-param>
                            <xsl:with-param name="mnemonic" select="$mnemonic"/>
                            <xsl:with-param name="where-from" select="'poc'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:PlannedMedication/toc:Service">
                        <xsl:call-template name="plannedMedicationCCDA">
                            <xsl:with-param name="plannedMedication" select="(self::node())"></xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:Product/toc:Service">
                        <xsl:call-template name="supplyCCDA">
                           <xsl:with-param name="supply" select="(self::node())"></xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                </section>
            </component>
		</xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
