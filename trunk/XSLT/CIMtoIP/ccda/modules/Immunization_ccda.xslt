<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>    

    <xsl:template name="immunizationCCDA">
        <xsl:param name="immunization"/>
        <xsl:param name="whereFrom"/>

		<xsl:if test="fn:exists(toc:*)">
			<xsl:variable name="var378_select_refusalInd" as="item()*" select="$immunization/@RefusalInd"/>
       		<xsl:variable name="moodCode" as="item()*" select="$immunization/toc:ServiceType"/>
        
	        <!-- CONF:8809 -->
			<entry>
				<substanceAdministration classCode="SBADM" >
				<xsl:attribute name="moodCode" namespace="" select="$moodCode"/>
				    <xsl:choose>
						<xsl:when test="fn:exists($var378_select_refusalInd)">
							<xsl:attribute name="negationInd" namespace="" select="xs:string(xs:boolean(fn:string($var378_select_refusalInd)))"/>
						</xsl:when>
						<xsl:otherwise>
	                    <xsl:attribute name="negationInd" namespace="" select="xs:string(false())"/>
						</xsl:otherwise>
					</xsl:choose>
					
	                <!-- CONF:8810; CONF:8570; CONF:10513 -->
	                <templateId root="2.16.840.1.113883.10.20.22.4.52"/>
	                
	                <!-- CONF:8571; -->
	                <xsl:for-each select="$immunization/toc:ImmunizationID">
	                    <xsl:call-template name="idII">
	                        <xsl:with-param name="idII" select="." as="node()" />
	                    </xsl:call-template>
	                </xsl:for-each>
	                
					<!-- No conformance stated in CCDA-->
					<!-- <code code="IMMUNIZ" codeSystem="2.16.840.1.113883.5.4" codeSystemName="ActCode" /> -->
					
					<!--  text/reference -->
					<xsl:if test="fn:exists($immunization/toc:Text)" >
					<xsl:variable name="var_immText" select="$immunization/toc:Text"/>
						<xsl:for-each select="$immunization/toc:Text">
			                <text>
								<xsl:choose>
			                        <xsl:when test="fn:starts-with($var_immText, '#')">
			                        	<reference>
			                        		<xsl:attribute name="value" select="fn:string($var_immText)" />
			                        	</reference>
			                        </xsl:when>
			                        <xsl:otherwise>
			                        	<xsl:sequence select="fn:string($var_immText)"/>
			                        </xsl:otherwise>
	                        	</xsl:choose>
		                    </text>
						</xsl:for-each>
					</xsl:if>
					
	<!--            <code code="82" displayName="History of immunizations" codeSystem="2.16.840.1.114222.4.11.934"/> -->
	                <!--ERROR : CONF-307 MDHT throws it as SHALL CCD says it as SHOULD -->
					<statusCode code="completed"/>
					
					<xsl:for-each select="$immunization/toc:AdministeredDate">
	                     <xsl:call-template name="ivlTS">
	                        <xsl:with-param name="ivlTS" select="." as="node()" />
	                        <xsl:with-param name="elementName" select="'effectiveTime'" />
	                        <xsl:with-param name="timeType" select="'IVL_TS'"/>
	                    </xsl:call-template>
	                </xsl:for-each>
	
				<!-- Immunization Medication Information -->				
						<xsl:for-each select="$immunization/toc:MedicationInformation">
							<consumable>
		                        <xsl:call-template name="mapMedicationInformation">
		                            <xsl:with-param name="medicationInformation" as="node()">
		                                <xsl:sequence select="." />
		                            </xsl:with-param>
		                            <xsl:with-param name="medicationInformationTemplateId" select="'2.16.840.1.113883.10.20.22.4.54'"/>
		                        </xsl:call-template>
								</consumable>
						</xsl:for-each>
					
					<!-- SHOULD conformance -->
					<!-- <xsl:if test="fn:exists($immunization/toc:Provider)" >
						<xsl:for-each select="$immunization/toc:Provider">
							<performer>
								<assignedEntity>
		                        NOTE : need to set as parameter
		                            <id root="2.16.840.1.113883.3.1275"/>
			                        <xsl:call-template name="organization">
			                            <xsl:with-param name="organization" select="." as="node()" />
			                            <xsl:with-param name="elementName" select="'representedOrganization'"/>
			                        </xsl:call-template>
								</assignedEntity>
							</performer>
						</xsl:for-each>
					</xsl:if> -->
					
					<xsl:if test="fn:exists($immunization/toc:MedicationSeriesNumber)" >
						<xsl:for-each select="$immunization/toc:MedicationSeriesNumber">
							<entryRelationship typeCode="SUBJ">
		                        <observation classCode="OBS" moodCode="EVN">
			                        <code/>
				                    <xsl:call-template name="valuePQ">
				                        <xsl:with-param name="value" select="." as="node()" />
				                    </xsl:call-template>
								</observation>
							</entryRelationship>
						</xsl:for-each>
					</xsl:if>
					
				<!-- 	<xsl:for-each select="$immunization/toc:Reaction">
						<entryRelationship typeCode="CAUS">
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="2.16.840.1.113883.10.20.1.54"/>
			                    <xsl:call-template name="codeCD">
			                        <xsl:with-param name="code" select="." as="node()" />
			                        <xsl:with-param name="elementName" select="'code'" />
			                    </xsl:call-template>
								<statusCode code="completed"/>
							</observation>
						</entryRelationship>
					</xsl:for-each> -->
					
					<!-- Refusal Reason -->
					<xsl:if test="fn:exists($immunization/toc:RefusalReason) or fn:exists($immunization/toc:RefusalReasonID)" >
						 <entryRelationship typeCode="RSON">
							<observation classCode="OBS" moodCode="EVN">
									<templateId root="2.16.840.1.113883.10.20.22.4.53"/>
									<xsl:if test="fn:exists($immunization/toc:RefusalReasonID)">
										  <xsl:for-each select="$immunization/toc:RefusalReasonID">
						                    <xsl:call-template name="idII">
						                        <xsl:with-param name="idII" select="." as="node()" />
						                    </xsl:call-template>
						                </xsl:for-each>
					                </xsl:if>
					                
					                <xsl:if test="fn:exists($immunization/toc:RefusalReason)">
					                    <xsl:call-template name="codeCD">
					                        <xsl:with-param name="code" select="$immunization/toc:RefusalReason" as="node()" />
					                        <xsl:with-param name="elementName" select="'code'" />
					                    </xsl:call-template>
				                    </xsl:if>
				                    <!--  Fixed value -->
	                                <statusCode code="completed"/>
								</observation>
							</entryRelationship>
						</xsl:if>
				</substanceAdministration>
			</entry>
		</xsl:if>
    </xsl:template>
</xsl:stylesheet>