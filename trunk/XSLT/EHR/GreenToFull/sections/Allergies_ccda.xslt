<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    <xsl:import href="../narratives_ccda.xslt"/>
       
    <xsl:template name="allergiesCCDA">
        <xsl:param name="allergies" />
        <xsl:param name="mnemonic" />
        <!--  For Level 2 and Level 3, the section header and text fields will be generated  -->
          <xsl:if test="$allergies">
	        <component>
	            <section>
	                <templateId root="2.16.840.1.113883.10.20.22.2.6"/>
	                <code code="48765-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Allergies, Adverse Reactions, Alerts"/>
				    <title>Allergies</title>
                    
                     <xsl:if test="fn:exists($allergies/toc:Text)">
                 			<text>
			               	 	<xsl:apply-templates select="$allergies/toc:Text/node()"/>
	                     	</text>
	                 </xsl:if>
	                 
                     <!--  This will remain commented until the narrative block is implemented
                      <xsl:choose>
                 		<xsl:when test="fn:exists($allergies/toc:Text)">
                 			<text>
			               	 	<xsl:apply-templates select="$allergies/toc:Text/node()"/>
	                     	</text>
	                     </xsl:when>
	                     <xsl:otherwise>
	                     	<xsl:call-template name="allergiesNarrative">
                            	<xsl:with-param name="allergies" select="$allergies"/>
                    		</xsl:call-template>
                    	</xsl:otherwise>
                     </xsl:choose> -->
	                
	               <xsl:if test="$mnemonic=$DischargeSummary_Level3 or $mnemonic=$TOCDischargeSummary_Level3 or $mnemonic=$TOCDischargeInstructions_Level3 or $mnemonic=$TOCConsultationRequest_Level3 or $mnemonic=$TOCConsultationSummary_Level3">
		              <xsl:for-each select="$allergies/toc:Allergy">
	                    <xsl:variable name="var410" as="xs:string" select="'SUBJ'"/>
	                     <xsl:if test="fn:exists(toc:*)">
	                      <entry>
	                        <act classCode="ACT" moodCode="EVN">
	                            <templateId root="2.16.840.1.113883.10.20.22.4.30"/>
	                            <!-- Concern ID -->
	                            <xsl:for-each select="toc:ConcernID">
									<xsl:call-template name="idII">
										<xsl:with-param name="idII" select="." as="node()" />
									</xsl:call-template>
								</xsl:for-each>
								
								<code code="48765-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Allergies, adverse reactions, alerts"/>
								
	                            <!-- Concern Status -->
	                            
	                            <xsl:if test="fn:exists(toc:ConcernStatus/@code)">
	                            <xsl:variable name="var_concernstatus" select="fn:lower-case(toc:ConcernStatus/@code)"/>
	                            	<statusCode> 
	                            		<xsl:choose>
	                            			<xsl:when test="fn:compare($var_concernstatus,'active')=0">
	                            				<xsl:attribute name="code" namespace="" select="'55561003'"/>
	                            			</xsl:when>
	                            			<xsl:when test="fn:compare($var_concernstatus,'inactive')=0">
	                            				<xsl:attribute name="code" namespace="" select="'73425007'"/>
	                            			</xsl:when>
	                            			<xsl:when test="fn:compare($var_concernstatus,'resolved')=0">
	                            				<xsl:attribute name="code" namespace="" select="'413322009'"/>
	                            			</xsl:when>
	                            		</xsl:choose>
					            	</statusCode>
					            </xsl:if>
					            
					            <!-- Concern Duration -->
					            <xsl:if test="fn:exists(toc:ConcernDuration)" >
		                            <xsl:for-each select="toc:ConcernDuration">
					                    <xsl:call-template name="ivlTS">
					                        <xsl:with-param name="ivlTS" select="." as="node()" />
					                        <xsl:with-param name="elementName" select="'effectiveTime'" />
					                    </xsl:call-template>
							         </xsl:for-each>
						         </xsl:if>
						         
						         <!--  Needs a parent level container, to check if the 'Allergy Observation Entry relationship' needs to be generated -->
						         <xsl:if test="fn:exists(toc:AllergyObservationID) or fn:exists(toc:AdverseEventDate) or 
						                       fn:exists(toc:AdverseEventType) or fn:exists(toc:AlertStatus)">
	                            <entryRelationship typeCode="SUBJ">
	                                <observation classCode="OBS" moodCode="EVN">
	                                    <templateId root="2.16.840.1.113883.10.20.22.4.7"/>
										
										<!--  Allergy Observation ID -->
										<xsl:if test="fn:exists(toc:AllergyObservationID)">
		                                    <xsl:for-each select="toc:AllergyObservationID">
												<xsl:call-template name="idII">
													<xsl:with-param name="idII" select="." as="node()" />
												</xsl:call-template>
											</xsl:for-each>
										</xsl:if>
										
	                                    <code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
	                                    
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
						                
	                                    <!-- adverseEventType -->
	                                    <xsl:if test="fn:exists(toc:AdverseEventType)">
							                <xsl:for-each select="toc:AdverseEventType">
							                    <xsl:call-template name="valueCD">
							                        <xsl:with-param name="value" select="." as="node()" />
							                    </xsl:call-template>
							                </xsl:for-each>
							             </xsl:if>
							             
							             <!-- Product -->
							            <!-- This needs reorgnization in CIM and this is a SHOULD Conformance 
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
                                    </xsl:if> -->
                                    
                                    <!-- Allergy Status Observation--> 
                                    <xsl:if test="fn:exists(toc:AlertStatus/@code)">
					                <entryRelationship typeCode="SUBJ" inversionInd="true">
                                        <observation  classCode="OBS" moodCode="EVN">
                                            <templateId root="2.16.840.1.113883.10.20.22.4.28"/>
                                           	<code code="33999-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Status"/>
                                            <statusCode code="completed"/>
                                            <xsl:for-each select="toc:AlertStatus">
							                    <xsl:call-template name="valueCE">
							                        <xsl:with-param name="value" select="." as="node()" />
							                    </xsl:call-template>
							                </xsl:for-each>
                                        </observation>
                                    </entryRelationship>
                                    </xsl:if>
                                    
                                    <!--  Null severity observation - testing -->
                                     <!-- <entryRelationship typeCode="SUBJ" inversionInd="true">
                                        <observation classCode="OBS" moodCode="EVN">
                                            <templateId root="2.16.840.1.113883.10.20.22.4.8"/>
                                            <code nullFlavor="UNK"/>
                                             <statusCode code="completed"/>
                                             <value xsi:type="CD" nullFlavor="UNK" />
                                         </observation>
                                     </entryRelationship> -->
                                        
                                    <!--  severity -->
                                    <!-- <xsl:if test="fn:exists(toc:Severity)">
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
                                    </xsl:if> -->
                                    				                
	                                </observation>
	                            </entryRelationship>
	                            </xsl:if>
	                        </act>
	                    </entry>
	                    </xsl:if>
	                </xsl:for-each>
                </xsl:if>
	            </section>
	        </component>
	      </xsl:if>
    </xsl:template>
</xsl:stylesheet>