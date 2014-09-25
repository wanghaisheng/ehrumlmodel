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
        
    <xsl:template name="allergiesSection">
        <xsl:param name="allergiesSection"/>
			<Allergies>
					<Text>
					    <!-- <xsl:for-each select="$allergiesSection/cda:text">
						    <xsl:for-each select="node()[./self::text()]">
							    <xsl:sequence select="fn:string(.)"/>
						    </xsl:for-each>
					    </xsl:for-each> -->
					    <xsl:apply-templates select="$allergiesSection/cda:text/node()"/>
				    </Text>
				    
				    
				    <xsl:for-each select="$allergiesSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.27']">
					<!-- <xsl:for-each select="$allergiesSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.27']/cda:entryRelationship"> -->
					
						<xsl:variable name="var228_observation" as="node()?" select="cda:entryRelationship/cda:observation" />
							
						<Allergy>
						<!-- Concern ID -->
						<xsl:if test="fn:exists(cda:id)">
							<xsl:for-each select="cda:id">
						        <xsl:call-template name="idII">
									<xsl:with-param name="idII" select="." as="node()" />
									<xsl:with-param name="elementName" select="'ConcernID'" />
								</xsl:call-template>
						     </xsl:for-each>
					     </xsl:if>
						 
						 <!-- Concern Duration -->    
					  	<!-- <xsl:for-each select="$allergiesSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.27']/cda:effectiveTime"> -->
					  	<xsl:for-each select="cda:effectiveTime">
	                            <xsl:call-template name="ivlTS">
	                                <xsl:with-param name="ivlTS" select="." as="node()" />
	                                <xsl:with-param name="elementName" select="'ConcernDuration'" />
	                            </xsl:call-template>
							</xsl:for-each>
														
							<xsl:for-each
								select="$var228_observation/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.39']/cda:value">
                                <xsl:call-template name="valueCD">
                                    <xsl:with-param name="value" select="." as="node()" />
                                    <xsl:with-param name="elementName" select="'AlertStatus'" />
                                </xsl:call-template>
							</xsl:for-each>
							
							<!-- AdverseEventType -->
							<xsl:for-each select="$var228_observation/cda:code">
	                            <xsl:call-template name="codeCD">
	                                <xsl:with-param name="code" select="." as="node()" />
	                                <xsl:with-param name="elementName" select="'AdverseEventType'" />
	                            </xsl:call-template>
							</xsl:for-each>
                           
                           <!-- ConcernStatus -->
                           <xsl:for-each select="cda:statusCode">
	                            <xsl:call-template name="codeCD">
	                                <xsl:with-param name="code" select="." as="node()" />
	                                <xsl:with-param name="elementName" select="'ConcernStatus'" />
	                            </xsl:call-template>
							</xsl:for-each>	
							
							<!-- AdverseEventDate -->
							<xsl:for-each select="$var228_observation/cda:effectiveTime">
	                            <xsl:call-template name="ivlTS">
	                                <xsl:with-param name="ivlTS" select="." as="node()" />
	                                <xsl:with-param name="elementName" select="'AdverseEventDate'" />
	                            </xsl:call-template>
							</xsl:for-each>
							
							<!-- Allergy Observation ID -->
							<xsl:if test="fn:exists($var228_observation/cda:id)">
								<xsl:for-each select="$var228_observation/cda:id">
							        <xsl:call-template name="idII">
										<xsl:with-param name="idII" select="." as="node()" />
										<xsl:with-param name="elementName" select="'AllergyObservationID'" />
									</xsl:call-template>
							    </xsl:for-each>
							</xsl:if>
							
							<!-- Product -->
							<xsl:for-each
								select="$var228_observation/cda:participant/cda:participantRole/cda:playingEntity/cda:code">
                                <xsl:call-template name="codeCD">
                                    <xsl:with-param name="code" select="." as="node()" />
                                    <xsl:with-param name="elementName" select="'Product'" />
                                </xsl:call-template>
							</xsl:for-each>
							
							<!-- Reaction -->
							<xsl:for-each select="$var228_observation/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.54']/cda:value">
                                <xsl:call-template name="valueCD">
                                    <xsl:with-param name="value" select="." as="node()" />
                                    <xsl:with-param name="elementName" select="'Reaction'" />
                                </xsl:call-template>
							</xsl:for-each>
							
							<!-- Severity -->
							<xsl:for-each
								select="$var228_observation/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.55']/cda:value">
                                <xsl:call-template name="valueCD">
                                    <xsl:with-param name="value" select="." as="node()" />
                                    <xsl:with-param name="elementName" select="'Severity'" />
                                </xsl:call-template>
							</xsl:for-each>
						</Allergy>
					</xsl:for-each>
				</Allergies>
    </xsl:template>        
</xsl:stylesheet>