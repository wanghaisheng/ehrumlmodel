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

    <xsl:template name="activeProblemsSectionCCDA">
        <xsl:param name="activeProblemsSection"/>
        <xsl:param name="srcMnemonic"/>
			<xsl:for-each select="$activeProblemsSection">
				 <ActiveProblems>
						
								<xsl:for-each select="cda:text">
									<Text> 
										 <xsl:apply-templates select="$activeProblemsSection/cda:text/node()"/>
									</Text>
								</xsl:for-each>
								
								<xsl:if test="fn:exists($activeProblemsSection/cda:entry) and ($srcMnemonic=$TOCDischargeSummary_Level3 or $srcMnemonic=$TOCDischargeInstructions_Level3 or $srcMnemonic=$TOCConsultationRequest_Level3 or $srcMnemonic=$TOCConsultationSummary_Level3)">
									<Conditions>
									<xsl:for-each select="$activeProblemsSection/cda:entry">
										<xsl:variable name="var24_act" as="node()?" select="cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.3']"/>
										<Condition>
										
											<!-- Concern ID -->
											<xsl:for-each select="$var24_act/cda:id">
										        <xsl:call-template name="idII">
													<xsl:with-param name="idII" select="." as="node()" />
													<xsl:with-param name="elementName" select="'ConcernID'" />
												</xsl:call-template>
										     </xsl:for-each>
										     
										     <Role>
												<xsl:for-each select="$var24_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']" >
													<xsl:variable name="var_classCode" as="item()*" select="@classCode" />
													<xsl:value-of select="$var_classCode"/>
												</xsl:for-each>
										     </Role>
																
											<ConcernStatus>
	                                 			<xsl:attribute name="code" namespace="" select="$var24_act/cda:statusCode/@code"/>
	                           				</ConcernStatus>	
				                            <xsl:for-each select="$var24_act/cda:effectiveTime">
					                            <xsl:call-template name="ivlTS">
					                                <xsl:with-param name="ivlTS" select="." as="node()" />
					                                <xsl:with-param name="elementName" select="'ConcernDuration'" />
					                            </xsl:call-template>
											</xsl:for-each>	
											
												<xsl:for-each
													select="$var24_act/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.5']/cda:value">
					                                <xsl:call-template name="valueCD">
					                                    <xsl:with-param name="value" select="." as="node()" />
					                                    <xsl:with-param name="elementName" select="'HealthStatus'" /> 
					                                </xsl:call-template>
												</xsl:for-each>
												
												<xsl:for-each
													select="$var24_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:effectiveTime">
									                <xsl:call-template name="ivlTS">
									                    <xsl:with-param name="ivlTS" select="." as="node()" />
									                    <xsl:with-param name="elementName" select="'ProblemDate'" />
									                </xsl:call-template>
												</xsl:for-each>
												
												<!-- Problem Observation ID -->
												<xsl:for-each select="$var24_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:id">
											        <xsl:call-template name="idII">
														<xsl:with-param name="idII" select="." as="node()" />
														<xsl:with-param name="elementName" select="'ProblemObservationID'" />
													</xsl:call-template>
											     </xsl:for-each>
											     
											     <!-- TODO:  How to retrieve this value from text/reference -->   
											     <xsl:if test="fn:exists($var24_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:text/cda:reference/@value)">
													<xsl:for-each
														select="$var24_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:text/cda:reference/@value">
														<ProblemName><xsl:value-of select="substring-after(.,'#')"/></ProblemName>
													</xsl:for-each>
												</xsl:if>
												
											<xsl:for-each select="$var24_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:code">
			                                    <xsl:call-template name="codeCD">
			                                        <xsl:with-param name="code" select="." as="node()" />
			                                        <xsl:with-param name="elementName" select="'ProblemType'" />
			                                    </xsl:call-template>
											</xsl:for-each>
																			 
											<xsl:for-each select="$var24_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:value">
			                                    <xsl:call-template name="valueCD">
			                                        <xsl:with-param name="value" select="." as="node()" />
			                                        <xsl:with-param name="elementName" select="'ProblemCode'" />
			                                    </xsl:call-template>
											</xsl:for-each>
											
											<!--  ageAtOnset-->
											<xsl:for-each
												select="$var24_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.31']/cda:value">
											<xsl:variable name="var_ageAtonSet" as="item()*" select="@value" />
												<xsl:if test="fn:exists($var_ageAtonSet)">
													<AgeatOnset>
													<xsl:attribute name="value" select="@value"/>
													<xsl:attribute name="unit" select="@unit"/>
														<!-- <xsl:sequence
															select="xs:string(xs:integer(fn:string($var_ageAtonSet)))" /> -->
													</AgeatOnset>
													</xsl:if>
											</xsl:for-each>
											
											<!-- Problem Status -->
											<xsl:for-each
												select="$var24_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.6']/cda:value">
			                                    <xsl:call-template name="valueCE">
			                                        <xsl:with-param name="value" select="." as="node()" />
			                                        <xsl:with-param name="elementName" select="'ProblemStatus'" />
			                                    </xsl:call-template>
											</xsl:for-each>	
												
											</Condition>
										
									</xsl:for-each>
									</Conditions>
							</xsl:if>
				</ActiveProblems>		
			</xsl:for-each>
    </xsl:template>        
</xsl:stylesheet>