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
    <!-- <xsl:import href="../constants_ccda.xslt" /> -->    
        
    <xsl:template name="allergiesSectionCCDA">
        <xsl:param name="allergiesSection"/>
        <xsl:param name="srcMnemonic"/>
        <xsl:for-each select="$allergiesSection">
			<Allergies>
					<Text>
					    <!-- <xsl:for-each select="$allergiesSection/cda:text">
						    <xsl:for-each select="node()[./self::text()]">
							    <xsl:sequence select="fn:string(.)"/>
						    </xsl:for-each>
					    </xsl:for-each> -->
					    <xsl:apply-templates select="$allergiesSection/cda:text/node()"/>
				    </Text>
				    
				    <xsl:if test="$srcMnemonic=$DischargeSummary_Level3 or $srcMnemonic=$TOCDischargeSummary_Level3 or $srcMnemonic=$TOCDischargeInstructions_Level3 or $srcMnemonic=$TOCConsultationRequest_Level3 or $srcMnemonic=$TOCConsultationSummary_Level3">
						<!-- <xsl:for-each select="$allergiesSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.30']/cda:entryRelationship">
							<xsl:variable name="var228_observation" as="node()?"
								select="cda:observation" /> -->
								
						<xsl:for-each select="$allergiesSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.30']">
							<xsl:variable name="var228_observation" as="node()?" select="cda:entryRelationship/cda:observation" />
							
							<Allergy>
							
							<!-- Concern ID -->
							<xsl:for-each select="cda:id">
						        <xsl:call-template name="idII">
									<xsl:with-param name="idII" select="." as="node()" />
									<xsl:with-param name="elementName" select="'ConcernID'" />
								</xsl:call-template>
						     </xsl:for-each>
						     
						  	<xsl:for-each select="cda:effectiveTime">
		                            <xsl:call-template name="ivlTS">
		                                <xsl:with-param name="ivlTS" select="." as="node()" />
		                                <xsl:with-param name="elementName" select="'ConcernDuration'" />
		                            </xsl:call-template>
							</xsl:for-each>
							
							<!-- AlertStatus -->
							<xsl:variable name="var_alertStatus" select="$var228_observation/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.28']/cda:value"/>
                                <xsl:if test="fn:exists($var_alertStatus)">
	                                <AlertStatus>
		                                 <xsl:if test="fn:lower-case($var_alertStatus/@displayName) = 'active'">
										 	 <xsl:attribute name="code" namespace="" select="'55561003'"/>
										 	 <xsl:attribute name="displayName" namespace="" select="'Active'"/>
										 </xsl:if>
										 <xsl:if test="fn:lower-case($var_alertStatus/@displayName) = 'inactive'">
										  	<xsl:attribute name="code" namespace="" select="'73425007'"/>
										  	<xsl:attribute name="displayName" namespace="" select="'Inactive'"/>
										 </xsl:if>
										 <xsl:if test="fn:lower-case($var_alertStatus/@displayName) = 'resolved'">
										  	<xsl:attribute name="code" namespace="" select="'413322009'"/>
										  	<xsl:attribute name="displayName" namespace="" select="'Resolved'"/>
										 </xsl:if>
										 <xsl:attribute name="codeSystem" namespace="" select="$var_alertStatus/@codeSystem"/>
										 <xsl:attribute name="codeSystemName" namespace="" select="$var_alertStatus/@codeSystemName"/>
									 </AlertStatus>
								 </xsl:if>
							
							<!--  Adverse Event Type -->														
								<xsl:for-each select="$var228_observation/cda:value">
		                            <xsl:call-template name="valueCD">
	                                    <xsl:with-param name="value" select="." as="node()" />
		                                <xsl:with-param name="elementName" select="'AdverseEventType'" />
		                            </xsl:call-template>
								</xsl:for-each>	
								
								<!-- Concern Status -->		
								 <ConcernStatus>
								<!--  <xsl:if test="$allergiesSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.30']/cda:statusCode/@code = '55561003'"> -->
								<xsl:if test="cda:statusCode/@code = '55561003'">
								 	 <xsl:attribute name="code" namespace="" select="'active'"/>
								 </xsl:if>
								  <xsl:if test="cda:statusCode/@code = '73425007'">
								  	<xsl:attribute name="code" namespace="" select="'inactive'"/>
								 </xsl:if>
								  <xsl:if test="cda:statusCode/@code = '413322009'">
								  	<xsl:attribute name="code" namespace="" select="'resolved'"/>
								 </xsl:if>	                                
	                           </ConcernStatus>				
	                                       					
								<xsl:for-each select="$var228_observation/cda:effectiveTime">
		                            <xsl:call-template name="ivlTS">
		                                <xsl:with-param name="ivlTS" select="." as="node()" />
		                                <xsl:with-param name="elementName" select="'AdverseEventDate'" />
		                            </xsl:call-template>
								</xsl:for-each>
								
								<!-- Allergy Observation ID -->
								<xsl:for-each select="$var228_observation/cda:id">
							        <xsl:call-template name="idII">
										<xsl:with-param name="idII" select="." as="node()" />
										<xsl:with-param name="elementName" select="'AllergyObservationID'" />
									</xsl:call-template>
							    </xsl:for-each>
							    
							    <!--  Product -->
							    <xsl:for-each
								select="$var228_observation/cda:participant/cda:participantRole/cda:playingEntity/cda:code">
	                                <xsl:call-template name="codeCD">
	                                    <xsl:with-param name="code" select="." as="node()" />
	                                    <xsl:with-param name="elementName" select="'Product'" />
	                                </xsl:call-template>
								</xsl:for-each>
								
								<!--  Reaction -->
								<xsl:for-each select="$var228_observation/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.9']/cda:value">
	                                <xsl:call-template name="valueCD">
	                                    <xsl:with-param name="value" select="." as="node()" />
	                                    <xsl:with-param name="elementName" select="'Reaction'" />
	                                </xsl:call-template>
								</xsl:for-each>
							</Allergy>
						</xsl:for-each>
					</xsl:if>
				</Allergies>
		 </xsl:for-each>
    </xsl:template>        
</xsl:stylesheet>