<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

  <xsl:import href="../maps.xslt"/>
    <xsl:template name="encounter">
        <xsl:param name="encounter"/>
        <xsl:param name="whereFrom"/>

        <xsl:variable name="moodCode">
	        <xsl:choose>
		        <xsl:when test="$whereFrom and ($whereFrom = 'poc')">
                    <xsl:choose>
                        <xsl:when test="$encounter/toc:Scheduled and $encounter/toc:Scheduled = 'true'">
                            <xsl:value-of select="'APT'"/>
	                    </xsl:when>
	                    <xsl:otherwise>
	                        <xsl:value-of select="'APQ'"/>
	                    </xsl:otherwise> 
	                </xsl:choose>
		        </xsl:when>
		        <xsl:otherwise>
	    	            <xsl:value-of select="'EVN'"/>
	 	        </xsl:otherwise> 
	        </xsl:choose>
        </xsl:variable>
        
        <entry>
            <encounter classCode="ENC">
                <xsl:attribute name="moodCode" namespace="" select="$moodCode"/>
                <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.14"/>
                <templateId root="2.16.840.1.113883.3.88.11.83.16"/>
                
                <xsl:choose>
                    <xsl:when test="$moodCode = 'EVN'">
                        <templateId root="2.16.840.1.113883.10.20.1.21"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <templateId root="2.16.840.1.113883.10.20.1.25"/>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:for-each select="$encounter/toc:EncounterID">
                    <xsl:call-template name="idII">
                        <xsl:with-param name="idII" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$encounter/toc:EncounterType">
	                <xsl:call-template name="codeCD">
	                    <xsl:with-param name="code" select="." as="node()" />
	                    <xsl:with-param name="elementName" select="'code'" />
	                </xsl:call-template>
                </xsl:for-each>

                <xsl:for-each select="$encounter/toc:Text">
	                <text>
		                 <xsl:apply-templates select="node()"/>
					</text>
				</xsl:for-each>
                <xsl:choose>
	                <xsl:when test="count($encounter/toc:EncounterDateTime) > 0">
	                    <xsl:call-template name="ivlTS">
	                        <xsl:with-param name="ivlTS" select="$encounter/toc:EncounterDateTime" as="node()" />
	                        <xsl:with-param name="elementName" select="'effectiveTime'" />
	                    </xsl:call-template>
	                </xsl:when>
	                <xsl:otherwise>                    
		                <xsl:if test="$moodCode = 'ARQ' and $encounter/toc:CallbackRequested and $encounter/toc:CallbackRequested = 'true'">
		                    <priorityCode code="CS"/>
		                </xsl:if>
	                </xsl:otherwise>
	            </xsl:choose>
                <xsl:for-each select="$encounter/toc:AdmissionType">
	                <xsl:call-template name="codeCD">
	                    <xsl:with-param name="code" select="." as="node()" />
	                    <xsl:with-param name="elementName" select="'priorityCode'" />
	                </xsl:call-template>
                </xsl:for-each>
                
                <xsl:if test="fn:exists($encounter/toc:EncounterProvider)">    
	                <xsl:for-each select="$encounter/toc:EncounterProvider">
	                    <performer typeCode="PRF">
	                        <assignedEntity classCode="ASSIGNED">
								<xsl:for-each select="gcda:organizationID">
									<xsl:call-template name="idII">
								    	<xsl:with-param name="idII" select="." as="node()" />
									</xsl:call-template>
								</xsl:for-each>
								<!--  Check if these input data exists, then perform the transformation -->
								<xsl:if test="fn:exists($encounter/toc:EncounterProvider/gcda:organizationAddress) or fn:exists($encounter/toc:EncounterProvider/gcda:organizationName) or fn:exists($encounter/toc:EncounterProvider/gcda:organizationTelecom)">
	                            <representedOrganization>
	                                <xsl:for-each select="gcda:organizationName">
	                                    <xsl:call-template name="organizationName">
	                                        <xsl:with-param name="organizationName" select="." as="node()" />
	                                    </xsl:call-template>
	                                </xsl:for-each>
	                                <xsl:for-each select="gcda:organizationTelecom">
	                                    <xsl:call-template name="telecom">
	                                        <xsl:with-param name="telecom" select="." as="node()" />
	                                    </xsl:call-template>
	                                </xsl:for-each>
		                                <xsl:for-each select="gcda:organizationAddress">
		                                    <xsl:call-template name="address">
		                                        <xsl:with-param name="address" select="." as="node()" />
		                                    </xsl:call-template>
		                                </xsl:for-each>
	                            </representedOrganization>
	                            </xsl:if>
	                        </assignedEntity>
	                    </performer>
	                </xsl:for-each>
                </xsl:if>
                
                <xsl:for-each select="$encounter/toc:FacilityLocation">
                   <!-- <participant typeCode="ORG" code="2.16.840.1.113883.3.88.12.80.33"/> -->
                    <participant typeCode="LOC">
                    <templateId root="2.16.840.1.113883.10.20.1.45"/>
		                <xsl:for-each select="toc:LocationDuration">
		                    <xsl:call-template name="ivlTS">
		                        <xsl:with-param name="ivlTS" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'time'" />
		                    </xsl:call-template>
		                </xsl:for-each>
		                <!--  This is hardcoded values -->
                        <participantRole classCode="SDLOC">
                        	<playingEntity classCode="PLC"/>
                        </participantRole>
                    </participant>
                </xsl:for-each>
                <xsl:for-each select="$encounter/toc:ReasonForVisit">
                    <entryRelationship typeCode="RSON">
                        <!-- NOTE : check classCode and moodCode appropriate values -->
                        <encounter classCode="ACCM" moodCode="APT">
                            <xsl:for-each select="toc:Text">
                                <text>
                                    <xsl:for-each select="node()[./self::text()]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </text>
                            </xsl:for-each>
                        </encounter>
                    </entryRelationship>
                </xsl:for-each>
            </encounter>
        </entry>
    </xsl:template>
</xsl:stylesheet>