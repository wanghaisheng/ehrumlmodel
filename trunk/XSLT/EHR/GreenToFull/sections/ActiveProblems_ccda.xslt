<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    <xsl:import href="../narratives_ccda.xslt"/>
    <xsl:import href="../modules/Condition_ccda.xslt"/>
    
    <xsl:template name="activeProblemsCCDA">
        <xsl:param name="activeProblems" />
        <xsl:param name="mnemonic" />
		
        <xsl:for-each select="$activeProblems">
            <component>
                <section>
                    <templateId root="2.16.840.1.113883.10.20.22.2.5"/>
                    <code>
                        <xsl:attribute name="code" namespace="" select="'11450-4'"/>
                        <xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
                        <xsl:attribute name="displayName" namespace="" select="'PROBLEM LIST'"/>
                        <xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
                    </code>
                    <title>
                        <xsl:sequence select="'Problems'"/>
                    </title>

						 <!-- Call narrative block only when not filled in -->
                        <!--  <xsl:choose>
	                        <xsl:when test="fn:exists(toc:Text)">
			                    <text>
			                    	<xsl:apply-templates select="toc:Text/node()"/>
			               		</text>
		               		</xsl:when>
		               		<xsl:otherwise>
		               				<xsl:call-template name="conditionsNarrative">
	                            		<xsl:with-param name="conditions" select="$activeProblems/toc:Conditions"/>
	                        		</xsl:call-template>
	                        </xsl:otherwise>
                        </xsl:choose> -->
                        
                    <xsl:if test="fn:exists(toc:Text)">
                        <text>
                            <xsl:apply-templates select="toc:Text/node()"/>
                        </text>
                    </xsl:if>
                    <xsl:for-each select="toc:Conditions">
                        <xsl:if test="$mnemonic=$TOCDischargeSummary_Level3 or $mnemonic=$TOCDischargeInstructions_Level3 or $mnemonic=$TOCConsultationRequest_Level3 or $mnemonic=$TOCConsultationSummary_Level3">
                            <xsl:for-each select="toc:Condition">
                                <xsl:call-template name="conditionCCDAProblemAct"> 
                                    <xsl:with-param name="condition" select="(self::node())"></xsl:with-param>
                                    <xsl:with-param name="idNum">
                                        <xsl:number level="any"/>
                                    </xsl:with-param>
                                    <xsl:with-param name="mnemonic" select="$mnemonic"></xsl:with-param>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                </section>
            </component>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>