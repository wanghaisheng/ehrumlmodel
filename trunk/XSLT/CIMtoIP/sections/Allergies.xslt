<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps.xslt"/>
       
    <xsl:template name="allergies">
        <xsl:param name="allergies" />
        <component>
            <section>
                <templateId root="2.16.840.1.113883.10.20.1.2" assigningAuthorityName="HL7 SDTC CCD"/>
                <templateId root="2.16.840.1.113883.3.88.11.83.102" assigningAuthorityName="HITSP C83"/>
                <templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.13" assigningAuthorityName="IHE PCC"/>
                <code code="48765-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Allergies, adverse reactions, alerts"/>
                <title>allergies, adverse reactions, alerts</title>
                <text>
                	<xsl:apply-templates select="$allergies/toc:Text/node()"/>
                </text>
                <xsl:for-each select="$allergies/toc:Allergy">
                    <xsl:variable name="var410" as="xs:string" select="'SUBJ'"/>
                    <entry>
                        <act classCode="ACT" moodCode="EVN">
                            <templateId root="2.16.840.1.113883.10.20.1.27" assigningAuthorityName="HL7 SDTC CCD"/>
                            <templateId root="2.16.840.1.113883.3.88.11.83.6" assigningAuthorityName="HITSP C83"/>
                            <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.5.3" assigningAuthorityName="IHE PCC"/>
                            <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.5.1" assigningAuthorityName="IHE PCC"/>
                            
                            <!-- Concern ID -->
                            <xsl:if test="fn:exists(toc:ConcernID)">
	                            <xsl:for-each select="toc:ConcernID">
									<xsl:call-template name="idII">
										<xsl:with-param name="idII" select="." as="node()" />
									</xsl:call-template>
								</xsl:for-each>
							</xsl:if>
							
                            <code nullFlavor="NA"/>
                            <statusCode>
                            	<xsl:if test="fn:exists(toc:ConcernStatus/@code)">
                            		<xsl:attribute name="code" namespace="" select="toc:ConcernStatus/@code"/>
				                     </xsl:if>
				            </statusCode>
                            <xsl:for-each select="toc:ConcernDuration">
					                    <xsl:call-template name="ivlTS">
					                        <xsl:with-param name="ivlTS" select="." as="node()" />
					                        <xsl:with-param name="elementName" select="'effectiveTime'" />
					                    </xsl:call-template>
					         </xsl:for-each>
                            <entryRelationship typeCode="SUBJ">
                                <observation classCode="OBS" moodCode="EVN" negationInd="false">
                                    <templateId root="2.16.840.1.113883.10.20.1.18"/>
                                    <!-- <templateId root="2.16.840.1.113883.10.20.1.28" /> -->
                                    <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.6" assigningAuthorityName="IHE PCC"/>
                                    <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.5" assigningAuthorityName="IHE PCC"/>
                                    
                                    <!--  Allergy Observation ID -->
                                    <xsl:for-each select="toc:AllergyObservationID">
										<xsl:call-template name="idII">
											<xsl:with-param name="idII" select="." as="node()" />
										</xsl:call-template>
									</xsl:for-each>
									
                                     <text>
										<reference>
											<xsl:attribute name="value" namespace="" select="toc:Product/@displayName"/>
										</reference>
									</text>
                                    <!-- alertStatus --> 
                                    <xsl:if test="fn:exists(toc:AlertStatus)">               		                
					                <entryRelationship typeCode="REFR">
                                        <observation  classCode="OBS" moodCode="EVN">
                                            <templateId root="2.16.840.1.113883.10.20.1.39"/>
                                           	<code code="33999-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Status"/>
                                            <statusCode code="completed"/>
                                            <xsl:for-each select="toc:AlertStatus">
							                    <xsl:call-template name="valueCD">
							                        <xsl:with-param name="value" select="." as="node()" />
							                    </xsl:call-template>
                                            </xsl:for-each>
                                        </observation>
                                    </entryRelationship>
                                    </xsl:if>
                                    <!-- adverseEventType -->
                                    <xsl:if test="fn:exists(toc:AdverseEventType)">
						                <xsl:for-each select="toc:AdverseEventType">
						                    <xsl:call-template name="codeCD">
						                        <xsl:with-param name="code" select="." as="node()" />
						                        <xsl:with-param name="elementName" select="'code'" />
						                    </xsl:call-template>
						                </xsl:for-each>
						                </xsl:if>				                
					             	<statusCode code="completed"/>
					             	<!-- adverseEventDate -->
					             	<xsl:if test="fn:exists(toc:AdverseEventDate)">
						                <xsl:for-each select="toc:AdverseEventDate">
						                    <xsl:call-template name="ivlTS">
						                        <xsl:with-param name="ivlTS" select="." as="node()" />
						                        <xsl:with-param name="elementName" select="'effectiveTime'" />
						                    </xsl:call-template>
						                </xsl:for-each>
					                </xsl:if>
									
                                    <!-- MDHT: (CONF-MDHT-IHE-28) -->
									<!-- This field is not required according to the C83 specs -->
									<!-- <value xsi:type="CD"/> -->
									
									<xsl:if test="fn:exists(toc:Product)">
	                                    <participant typeCode='CSM'>
	                                        <participantRole classCode='MANU'>
	                                            <playingEntity classCode='MMAT'>
	                                                <xsl:for-each select="toc:Product">
	                                                    <xsl:variable name="var438_select_displayName" as="item()*" select="@displayName"/>
				                                        <xsl:call-template name="codeCD">
				                                            <xsl:with-param name="code" select="." as="node()" />
				                                            <xsl:with-param name="elementName" select="'code'" />
				                                        </xsl:call-template>
	                                                    <name>
	                                                        <xsl:if test="fn:exists($var438_select_displayName)">
	                                                            <xsl:sequence select="fn:string($var438_select_displayName)"/>
	                                                        </xsl:if>
	                                                    </name>
	                                                </xsl:for-each>
	                                            </playingEntity>
	                                        </participantRole>
	                                    </participant>
                                    </xsl:if>
                                    <!--  severity -->
                                    <xsl:if test="fn:exists(toc:Severity)">
                                    <entryRelationship typeCode="SUBJ" inversionInd="true">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <templateId root="2.16.840.1.113883.10.20.1.55"/>
                                            <code code="SEV" codeSystem="2.16.840.1.113883.5.4" displayName="Severity" codeSystemName="ActCode"/>
                                            <statusCode code="completed"/>
                                            <xsl:for-each select="toc:Severity">
							                    <xsl:call-template name="valueCD">
							                        <xsl:with-param name="value" select="." as="node()" />
							                    </xsl:call-template>
                                            </xsl:for-each>
                                        </observation>
                                    </entryRelationship>
                                    </xsl:if>
                                    <!-- reaction -->
                                    <xsl:if test="fn:exists(toc:Reaction)">
                                    <entryRelationship typeCode="MFST" inversionInd="true">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <templateId root="2.16.840.1.113883.10.20.1.54"/>
                                            <code nullFlavor="NA"/>
                                            <statusCode code="completed"/>
                                            <xsl:for-each select="toc:Reaction">
                                                <xsl:call-template name="valueCD">
                                                    <xsl:with-param name="value" select="." as="node()" />
                                                   <!--  <xsl:with-param name="elementName" select="'code'" /> -->
                                                </xsl:call-template>
                                            </xsl:for-each>
                                            <statusCode code="completed"/>
                                        </observation>
                                    </entryRelationship>
                                    </xsl:if>
                                </observation>
                            </entryRelationship>
                        </act>
                    </entry>
                </xsl:for-each>
            </section>
        </component>
    </xsl:template>
</xsl:stylesheet>