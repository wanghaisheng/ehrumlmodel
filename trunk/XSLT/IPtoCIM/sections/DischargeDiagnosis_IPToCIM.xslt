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
    
    <xsl:template name="dischargeDiagnosisSection">
        <xsl:param name="dischargeDiagnosisSection"/>
				<DischargeDiagnosis>
				  <xsl:if test="fn:exists($dischargeDiagnosisSection/cda:text)">
						<xsl:for-each select="$dischargeDiagnosisSection/cda:text">
							<Text>
								<xsl:apply-templates select="node()" />
							</Text>
						</xsl:for-each>
					</xsl:if>
				
				<xsl:for-each select="$dischargeDiagnosisSection/cda:entry">
						<Conditions>	
							<xsl:variable name="var552_act" as="node()?" select="cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.27']"/>
							<Condition>
							
						  <ConcernStatus>
                                 <xsl:attribute name="code" namespace="" select="$var552_act/cda:statusCode/@code"/>
                           </ConcernStatus>	
                           <xsl:for-each select="$var552_act/cda:effectiveTime">
	                            <xsl:call-template name="ivlTS">
	                                <xsl:with-param name="ivlTS" select="." as="node()" />
	                                <xsl:with-param name="elementName" select="'ConcernDuration'" />
	                            </xsl:call-template>
							</xsl:for-each>	
							
							<xsl:for-each
								select="$var552_act/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.28']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.51']/cda:value">
                                <xsl:call-template name="valueCD">
                                    <xsl:with-param name="value" select="." as="node()" />
                                    <xsl:with-param name="elementName" select="'HealthStatus'" /> 
                                </xsl:call-template>
							</xsl:for-each>
							
							<xsl:for-each
								select="$var552_act/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.28']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.57']/cda:value">
                                <xsl:call-template name="valueCD">
                                    <xsl:with-param name="value" select="." as="node()" />
                                    <xsl:with-param name="elementName" select="'ClinicalStatus'" />
                                </xsl:call-template>
							</xsl:for-each>  
														
								<xsl:for-each select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:sequenceNumber">
									<xsl:variable name="var553_value" as="node()?" select="@value"/>
									<xsl:if test="fn:exists($var553_value)">
										<DiagnosisPriority>
											<xsl:sequence select="xs:string(xs:integer(fn:string($var553_value)))"/>
										</DiagnosisPriority>
									</xsl:if>
								</xsl:for-each>
								<xsl:for-each select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.28']/cda:effectiveTime">
                                    <xsl:call-template name="ivlTS">
                                        <xsl:with-param name="ivlTS" select="." as="node()" />
                                        <xsl:with-param name="elementName" select="'ProblemDate'" />
                                    </xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.28']/cda:code">
                                    <xsl:call-template name="codeCD">
                                        <xsl:with-param name="code" select="." as="node()" />
                                        <xsl:with-param name="elementName" select="'ProblemType'" />
                                    </xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.28']/cda:text">
									<ProblemName>
										<xsl:for-each select="node()[fn:boolean(self::text())]">
											<xsl:sequence select="fn:string(.)"/>
										</xsl:for-each>
									</ProblemName>
								</xsl:for-each>
<!-- 								<xsl:for-each select="$dischargeDiagnosisSection/cda:text/cda:p"> -->
<!-- 									<problemName> -->
<!-- 										<xsl:for-each select="node()[fn:boolean(self::text())]"> -->
<!-- 											<xsl:sequence select="fn:string(.)"/> -->
<!-- 										</xsl:for-each> -->
<!-- 									</problemName> -->
<!-- 								</xsl:for-each> -->
																 
								<xsl:for-each select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.28']/cda:value">
                                    <xsl:call-template name="valueCD">
                                        <xsl:with-param name="value" select="." as="node()" />
                                        <xsl:with-param name="elementName" select="'ProblemCode'" />
                                    </xsl:call-template>
								</xsl:for-each>
								
								<xsl:for-each select="$var552_act/cda:performer">
									<TreatingProvider>
									<!-- Changed the namespace of ID from 'cda' to * - until the namespace is fixed -->
										<xsl:for-each select="cda:assignedEntity/*:id">
                                            <xsl:call-template name="idII">
                                                <xsl:with-param name="idII" select="." as="node()" />
                                                <xsl:with-param name="elementName" select="'treatingProviderID'" />
                                            </xsl:call-template>
										</xsl:for-each>
									</TreatingProvider>
								</xsl:for-each>
								
								<!--  ageAtOnset-->
								<xsl:for-each
									select="$var552_act/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.38']/cda:value">
								<xsl:variable name="var_ageAtonSet" as="item()*" select="@value" />
									<xsl:if test="fn:exists($var_ageAtonSet)">
										<AgeAtOnset>
											<xsl:sequence
												select="xs:string(xs:integer(fn:string($var_ageAtonSet)))" />
										</AgeAtOnset>
										</xsl:if>
								</xsl:for-each>
								
								<!--  causeOfDeath/ageAtDeath-->
								<xsl:for-each
									select="$var552_act/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.42']">
									<xsl:variable name="var_effectiveTime" as="item()*" select="cda:effectiveTime/@value" />
									<CauseOfDeath>
										<xsl:if test="fn:exists($var_effectiveTime)">
											<TimeOfDeath>
											<xsl:attribute name="value" namespace=""
												select="fn:string($var_effectiveTime)" />
											</TimeOfDeath>
										</xsl:if>
												
										<xsl:for-each select="cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.38']/cda:value">
											<xsl:variable name="var_ageAtDeath" as="item()*" select="@value" />
												<xsl:if test="fn:exists($var_ageAtDeath)">
													<AgeAtDeath>
														<xsl:sequence
														select="xs:string(xs:integer(fn:string($var_ageAtDeath)))" />
													</AgeAtDeath>
												</xsl:if>
										</xsl:for-each>
									</CauseOfDeath>
								</xsl:for-each>
								
								<xsl:for-each
									select="$var552_act/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.50']/cda:value">
                                    <xsl:call-template name="valueCE">
                                        <xsl:with-param name="value" select="." as="node()" />
                                        <xsl:with-param name="elementName" select="'problemStatus'" />
                                    </xsl:call-template>
								</xsl:for-each>					
							</Condition>
							</Conditions>
					</xsl:for-each>
				</DischargeDiagnosis>				
    </xsl:template>        
</xsl:stylesheet>