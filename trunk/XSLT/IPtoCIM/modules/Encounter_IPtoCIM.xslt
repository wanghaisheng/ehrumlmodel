<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri"
	xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	exclude-result-prefixes="xs fn gcda"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">
	
    <xsl:import href="../templates.xslt"/>    
  
    <xsl:template name="encounterModule">
        <xsl:param name="encounterModule"/>
        <xsl:for-each select="$encounterModule">     
        <Encounter>
			<xsl:for-each select="cda:id">
                <xsl:call-template name="idII">
                    <xsl:with-param name="idII" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'EncounterID'" />
                </xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:code">
                <xsl:call-template name="codeCD">
                    <xsl:with-param name="code" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'EncounterType'" />
                </xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:effectiveTime">
                <xsl:call-template name="ivlTS">
                    <xsl:with-param name="ivlTS" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'EncounterDateTime'" />
                </xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:priorityCode">
                <xsl:call-template name="codeCD">
                    <xsl:with-param name="code" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'AdmissionType'" />
                </xsl:call-template>
			</xsl:for-each>
						<xsl:for-each select="cda:performer/cda:assignedEntity">
							<EncounterProvider>
                            <xsl:for-each select="cda:id">
				                <xsl:call-template name="idII">
				                    <xsl:with-param name="idII" select="." as="node()" />
				                    <xsl:with-param name="elementName" select="'gcda:organizationID'" />
				                </xsl:call-template>
                            </xsl:for-each>
							<xsl:for-each select="cda:representedOrganization">
								<xsl:for-each select="cda:addr">
					                <xsl:call-template name="address">
					                    <xsl:with-param name="address" select="." as="node()" />
					                    <xsl:with-param name="elementName" select="'gcda:organizationAddress'" />
					                </xsl:call-template>
					            </xsl:for-each>
								<xsl:for-each select="cda:telecom">
                                    <xsl:call-template name="telecom">
                                        <xsl:with-param name="telecom" select="." as="node()" />
                                        <xsl:with-param name="elementName" select="'gcda:organizationTelecom'" />
                                    </xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="cda:name">
                                    <xsl:call-template name="organizationName">
                                        <xsl:with-param name="organizationName" select="." as="node()" />
                                        <xsl:with-param name="elementName" select="'gcda:organizationName'" />
                                    </xsl:call-template>
								</xsl:for-each>
							</xsl:for-each>
							</EncounterProvider>
						</xsl:for-each>
						<!-- facilityLocation -->
						<xsl:for-each select="cda:participant[@typeCode='LOC']">
							<FacilityLocation>
							<xsl:for-each select="cda:time">
				                <xsl:call-template name="ivlTS">
				                    <xsl:with-param name="ivlTS" select="." as="node()" />
				                    <xsl:with-param name="elementName" select="'LocationDuration'" />
				                </xsl:call-template>
    						</xsl:for-each>
	           				</FacilityLocation>
						</xsl:for-each>
						<!-- Reason for Visit -->
						<xsl:for-each select="cda:entryRelationship[@typeCode='RSON']">
							<ReasonForVisit>
								<xsl:variable name="var1091_reasonForVisit" as="node()?"
										select="cda:encounter/cda:text" />
										<Text>
											<xsl:if test="fn:exists($var1091_reasonForVisit)">
												<xsl:sequence select="fn:string(.)" />
											</xsl:if>
										</Text>
										<Reason></Reason>
							</ReasonForVisit>
						</xsl:for-each>
                        <xsl:for-each select="cda:text"> 
                          <Text> 
                            <!-- <xsl:for-each select="node()[fn:boolean(self::text())]"> 
                                <xsl:sequence select="fn:string(.)"/> 
                            </xsl:for-each> --> 
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </Text> 
                        </xsl:for-each>
                        <xsl:choose>						        
                            <xsl:when test="@moodCode = 'APT'">
                                <Scheduled>true</Scheduled>
                            </xsl:when>
                            <xsl:when test="@moodCode = 'APQ'">
                                <Scheduled>false</Scheduled>
                                <xsl:choose>
                                <xsl:when test="cda:priorityCode">
                                    <CallbackRequested>true</CallbackRequested>
                                </xsl:when>
                                <xsl:otherwise>
                                    <CallbackRequested>false</CallbackRequested>
                                </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:for-each select="cda:text"> 
                            <Text> 
                            <!-- <xsl:for-each select="node()[fn:boolean(self::text())]"> 
                                <xsl:sequence select="fn:string(.)"/> 
                            </xsl:for-each> --> 
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </Text> 
                        </xsl:for-each>
					</Encounter>
					</xsl:for-each>
        <!-- 
        <xsl:for-each select="$encounterModule">           		
						<xsl:variable name="var558_effectiveTime" as="node()*"
							select="cda:effectiveTime" />
						<xsl:variable name="var559_entryRelationship" as="node()*"
							select="cda:entryRelationship" />
						<medication>
						-->							
							
    </xsl:template>        
</xsl:stylesheet>