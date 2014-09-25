<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps.xslt"/>

	<xsl:template name="medication">
		<xsl:param name="medication" />
		<xsl:param name="whereFrom" />
		
        <xsl:variable name="moodCode">
            <xsl:choose>
                <xsl:when test="$whereFrom and ($whereFrom = 'poc')">
                    <xsl:value-of select="'INT'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'EVN'"/>
                </xsl:otherwise> 
            </xsl:choose>
        </xsl:variable>
        
		<entry>
			<substanceAdministration classCode="SBADM">
                <xsl:attribute name="moodCode" namespace="" select="$moodCode" />
                
				<!-- ERROR : CONF-MDHT-152 -->
				<templateId root="2.16.840.1.113883.3.88.11.83.8" />
				<templateId root="2.16.840.1.113883.10.20.1.24" />
				<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.7" />
				<!-- <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.7.1"/> -->
				<id root="2.16.840.1.113883.3.1275" />
				<!--ERROR : CONF-307 MDHT throws it as SHALL CCD says it as SHOULD -->
				<xsl:for-each select="$medication/toc:DeliveryMethod">
	                <xsl:call-template name="codeCD">
	                    <xsl:with-param name="code" select="." as="node()" />
	                    <xsl:with-param name="elementName" select="'code'" />
	                </xsl:call-template>
				</xsl:for-each>
				
				<!--  text/reference -->
				<xsl:for-each select="$medication/toc:Text">
	                <text>
		                <!-- <xsl:for-each select="node()[./self::text()]">
		                       <xsl:sequence select="fn:string(.)"/>
		                </xsl:for-each> -->
		               <xsl:apply-templates select="@* | child::*"/>
					</text>
				</xsl:for-each>
                <statusCode code="completed"/>

				<xsl:for-each select="$medication/toc:IndicateMedicationStopped">
                    <xsl:call-template name="tsTS">
                        <xsl:with-param name="tsTS" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'effectiveTime'" />
                    </xsl:call-template>
				</xsl:for-each>
						
			    <xsl:for-each select="$medication/toc:AdministrationTiming">
					<effectiveTime xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="PIVL_TS" institutionSpecified="true" operator="A">
					<xsl:for-each select="gcda:period">
					<period>							  
	                                        <xsl:for-each select="@unit">
	                                            <xsl:attribute name="unit" select="fn:string(.)"/>
	                                        </xsl:for-each>
	                                        <xsl:for-each select="@value">
	                                            <xsl:attribute name="value" select="fn:string(.)"/>
	                                        </xsl:for-each>	                               
					</period>
					 </xsl:for-each>
					</effectiveTime>
				</xsl:for-each>				
				
				<xsl:for-each select="$medication/toc:Route">
                    <xsl:call-template name="codeCD">
                        <xsl:with-param name="code" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'routeCode'" />
                    </xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:Site">
                    <xsl:call-template name="codeCD">
                        <xsl:with-param name="code" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'approachSiteCode'" />
                    </xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:Dose">
                    <xsl:call-template name="qtyPQ">
                        <xsl:with-param name="qtyPQ" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'doseQuantity'" />
                    </xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:DoseRestriction">
					<maxDoseQuantity>
		                <xsl:for-each select="toc:Numerator">
		                    <xsl:call-template name="qtyPQ">
		                        <xsl:with-param name="qtyPQ" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'numerator'" />
		                    </xsl:call-template>
		                </xsl:for-each>
		                <xsl:for-each select="toc:Denominator">
		                    <xsl:call-template name="qtyPQ">
		                        <xsl:with-param name="qtyPQ" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'denominator'" />
		                    </xsl:call-template>
		                </xsl:for-each>
					</maxDoseQuantity>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:ProductForm">
                    <xsl:call-template name="codeCD">
                        <xsl:with-param name="code" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'administrationUnitCode'" />
                    </xsl:call-template>
				</xsl:for-each>
				<consumable>
					<xsl:for-each select="$medication/toc:MedicationInformation">
						<xsl:variable name="var218_resultof_mapMedicationInformation"
							as="node()?">
							<xsl:call-template name="mapMedicationInformation">
								<xsl:with-param name="medicationInformation" as="node()">
									<xsl:sequence select="." />
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:if test="fn:exists($var218_resultof_mapMedicationInformation)">
							<manufacturedProduct>
								<xsl:attribute name="classCode" namespace=""
									select="'MANU'" />
								<xsl:sequence
									select="($var218_resultof_mapMedicationInformation/@node(), $var218_resultof_mapMedicationInformation/node())" />
							</manufacturedProduct>
						</xsl:if>
					</xsl:for-each>
				</consumable>
				<xsl:for-each select="$medication/toc:Vehicle">
                    <xsl:variable name="var219_select_nullFlavor" as="item()*"
                        select="@nullFlavor" />
					<xsl:variable name="var224_select_name" as="item()*"
						select="@name" />
					<participant typeCode="CSM">
                        <xsl:if test="fn:exists($var219_select_nullFlavor)">
                            <xsl:attribute name="nullFlavor" namespace=""
                                select="fn:string($var219_select_nullFlavor)" />
                        </xsl:if>
						<participantRole classCode="MANU">
					 		<!-- This appears twice hence removed the hard coding 
					 		<code code="412307009" codeSystem="2.16.840.1.113883.6.96" /> -->  
							<playingEntity classCode="MMAT">
			                    <xsl:call-template name="codeCD">
			                        <xsl:with-param name="code" select="." as="node()" />
			                        <xsl:with-param name="elementName" select="'code'" />
			                    </xsl:call-template>
								<name>
									<xsl:if test="fn:exists($var224_select_name)">
										<xsl:sequence select="fn:string($var224_select_name)" />
									</xsl:if>
								</name>
							</playingEntity>
						</participantRole>
					</participant>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:TypeOfMedication">
                    <xsl:variable name="var235_select_nullFlavor" as="item()*"
                        select="@nullFlavor" />
					<entryRelationship typeCode="SUBJ">
                        <xsl:if test="fn:exists($var235_select_nullFlavor)">
                            <xsl:attribute name="nullFlavor" namespace=""
                                select="fn:string($var235_select_nullFlavor)" />
                        </xsl:if>
						<observation classCode="OBS" moodCode="EVN">
							<templateId root="2.16.840.1.113883.3.88.11.83.8.1" />
		                    <!-- <xsl:call-template name="valueCD">
		                        <xsl:with-param name="value" select="." as="node()" />
		                    </xsl:call-template>
		                    -->
		                    <xsl:call-template name="codeCD">
		                        <xsl:with-param name="code" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'code'" />
		                    </xsl:call-template>
						</observation>
					</entryRelationship>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:StatusOfMedication">
                    <xsl:variable name="var251_select_nullFlavor" as="item()*"
                        select="@nullFlavor" />
					<xsl:variable name="var252_select_status" as="item()*"
						select="@status" />
					<entryRelationship typeCode="REFR">
                        <xsl:if test="fn:exists($var251_select_nullFlavor)">
                            <xsl:attribute name="nullFlavor" namespace=""
                                select="fn:string($var251_select_nullFlavor)" />
                        </xsl:if>
						<observation classCode="OBS" moodCode="EVN">
							<templateId root="2.16.840.1.113883.10.20.1.47" />
							<code code="33999-4" displayName="Status" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<statusCode code="completed"/>
							<!-- <statusCode>
								<xsl:if test="fn:exists($var252_select_status)">
									<xsl:attribute name="code" namespace=""
										select="fn:string($var252_select_status)" />
								</xsl:if>
							</statusCode>
							-->
                            <xsl:call-template name="valueCD">
                                <xsl:with-param name="value" select="." as="node()" />
                            </xsl:call-template>
						</observation>
					</entryRelationship>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:Indication">
                    <xsl:variable name="var268_select_nullFlavor" as="item()*"
                        select="@nullFlavor" />
					<xsl:variable name="var269_select_status" as="item()*"
						select="@status" />
					<entryRelationship typeCode="RSON">
                        <xsl:if test="fn:exists($var268_select_nullFlavor)">
                            <xsl:attribute name="nullFlavor" namespace=""
                                select="fn:string($var268_select_nullFlavor)" />
                        </xsl:if>
						<observation classCode="OBS" moodCode="EVN">
							<templateId root="2.16.840.1.113883.10.20.1.28" />
		                    <xsl:call-template name="codeCD">
		                        <xsl:with-param name="code" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'code'" />
		                    </xsl:call-template>
							<text>
								<reference>
									<xsl:attribute name="value" select="concat('#','medication')" />
								</reference>
							</text>
							<statusCode>
								<xsl:if test="fn:exists($var269_select_status)">
									<xsl:attribute name="code" namespace=""
										select="fn:string($var269_select_status)" />
								</xsl:if>
							</statusCode>
						</observation>
					</entryRelationship>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:PatientInstructions">
					<!-- ERROR CCD Reaction Observation The value for entryRelationship 
						/ @typeCode in a relationship between a reaction observation and reaction 
						intervention SHALL be "RSON" "Has reason" 2.16.840.1.113883.5.1002 ActRelationshipType 
						STATIC. (CONF-296) -->
					<!-- ERROR : CONF-333 -->
					<!-- MDHT ERROR : CONF-MDHT-61 -->
					<entryRelationship typeCode="SUBJ" inversionInd="true">
						<!-- ERROR CONF-332 -->
						<act moodCode="INT" classCode="ACT">
							<templateId root='2.16.840.1.113883.10.20.1.49'
								assigningAuthorityName='HITSP C83' />
							<templateId root='1.3.6.1.4.1.19376.1.5.3.1.4.3'
								assigningAuthorityName='HITSP C83' />
							<code>
								<xsl:attribute name="code" namespace="" select="@code" />
								<xsl:attribute name="codeSystem" namespace=""
									select="@codeSystem" />
								<xsl:attribute name="codeSystemName" namespace=""
									select="@codeSystemName" />
							</code>
							<!--ERROR MDHT -->
							<!-- <xsl:attribute name="value"> <xsl:for-each select="node()[./self::text()]"> 
								<xsl:sequence select="fn:string(.)"/> </xsl:for-each> </xsl:attribute> -->
							<text>
								<reference>
									<xsl:attribute name="value" select="@displayName" />
								</reference>
							</text>
						</act>
					</entryRelationship>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:Reaction">
                    <xsl:variable name="var285_select_nullFlavor" as="item()*"
                        select="@nullFlavor" />
					<entryRelationship>
                        <xsl:if test="fn:exists($var285_select_nullFlavor)">
                            <xsl:attribute name="nullFlavor" namespace=""
                                select="fn:string($var285_select_nullFlavor)" />
                        </xsl:if>
						<xsl:attribute name="typeCode" namespace="" select="'CAUS'" />
						<observation>
							<xsl:attribute name="classCode" namespace=""
								select="'OBS'" />
							<xsl:attribute name="moodCode" namespace="" select="'EVN'" />
							<templateId root="2.16.840.1.113883.10.20.1.54" />
		                    <xsl:call-template name="codeCD">
		                        <xsl:with-param name="code" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'code'" />
		                    </xsl:call-template>
							<statusCode>
								<xsl:attribute name="code" namespace="" select="'completed'" />
							</statusCode>
						</observation>
					</entryRelationship>
				</xsl:for-each>
				<xsl:for-each select="$medication/toc:OrderInformation">
					<entryRelationship typeCode="REFR">
						<supply moodCode="INT" classCode="SPLY">
						<templateId root="2.16.840.1.113883.10.20.1.34"/>
							<xsl:for-each select="toc:OrderNumber">
			                    <xsl:call-template name="idII">
			                        <xsl:with-param name="idII" select="." as="node()" />
			                    </xsl:call-template>
							</xsl:for-each>
							<xsl:for-each select="toc:OrderExpirationDateTime">
			                    <xsl:call-template name="tsTS">
			                        <xsl:with-param name="tsTS" select="." as="node()" />
			                        <xsl:with-param name="elementName" select="'effectiveTime'" />
			                    </xsl:call-template>
							</xsl:for-each>
							<xsl:for-each select="toc:Fills">
								<xsl:variable name="var302_select_value" as="item()*"
									select="@value" />
								<repeatNumber>
									<xsl:if test="fn:exists($var302_select_value)">
										<xsl:attribute name="value" namespace=""
											select="xs:string(xs:integer(fn:string($var302_select_value)))" />
									</xsl:if>
								</repeatNumber>
							</xsl:for-each>
							<xsl:for-each select="toc:QuantityOrdered">
			                    <xsl:call-template name="qtyPQ">
			                        <xsl:with-param name="qtyPQ" select="." as="node()" />
			                        <xsl:with-param name="elementName" select="'quantity'" />
			                    </xsl:call-template>
							</xsl:for-each>
							<author>
								<xsl:for-each select="toc:OrderDateTime">
				                    <xsl:call-template name="tsTS">
				                        <xsl:with-param name="tsTS" select="." as="node()" />
				                        <xsl:with-param name="elementName" select="'time'" />
				                    </xsl:call-template>
								</xsl:for-each>
								<!-- ERROR -->
								<assignedAuthor>
									<id extension="KP00017" root="2.16.840.1.113883.19.5" />
								</assignedAuthor>
							</author>
						</supply>
					</entryRelationship>
				</xsl:for-each>
				
							<xsl:for-each select="$medication/toc:FulfillmentInstructions">
					<!-- CCD Reaction Observation The value for entryRelationship / @typeCode 
						in a relationship between a reaction observation and reaction intervention 
						SHALL be "RSON" "Has reason" 2.16.840.1.113883.5.1002 ActRelationshipType 
						STATIC. (CONF-296) -->
                                                <!-- ERROR CONF-336 -->
                                                <!-- ERROR <id root="14ED7742-2428-4e2c-9446-A9B0D0075272" extension="SCRIP#"/> 
								<code code="FINSTRUCT" codeSystem="1.3.6.1.4.1.19376.1.5.3.2" codeSystemName="IHEActCode"/> 
					<entryRelationship typeCode="RSON">
						
						<act moodCode="INT" classCode="ACT">
							<templateId root="2.16.840.1.113883.10.20.1.43" />
							
							<effectiveTime />
							<text>
								<xsl:for-each select="node()[./self::text()]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</text>
        		 	<xsl:for-each select="$medication/toc:fulfillmentHistory">	
							<supply moodCode="EVN">
								<xsl:for-each select="toc:prescriptionNumber">
	                                <xsl:call-template name="idII">
	                                    <xsl:with-param name="idII" select="." as="node()" />
	                                </xsl:call-template>
								</xsl:for-each>							
								<xsl:for-each select="toc:dispenseDate">
                                    <xsl:call-template name="tsTS">
                                        <xsl:with-param name="tsTS" select="." as="node()" />
                                        <xsl:with-param name="elementName" select="'effectiveTime'" />
                                    </xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="toc:quantityDispensed">
	                                <xsl:call-template name="qtyPQ">
	                                    <xsl:with-param name="qtyPQ" select="." as="node()" />
	                                    <xsl:with-param name="elementName" select="'quantity'" />
	                                </xsl:call-template>
								</xsl:for-each>						
								<performer>
									<assignedEntity>
										<xsl:for-each select="toc:dispensingPharmacyLocation">
		                                    <xsl:call-template name="address">
		                                        <xsl:with-param name="address" select="." as="node()" />
		                                    </xsl:call-template>
										</xsl:for-each>
										<xsl:for-each select="toc:provider">
											<representedOrganization>
				                                <xsl:for-each select="gcda:organizationID">
				                                    <xsl:call-template name="idII">
				                                        <xsl:with-param name="idII" select="." as="node()" />
				                                    </xsl:call-template>
				                                </xsl:for-each>
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
										</xsl:for-each>
									</assignedEntity>
								</performer>							
								<entryRelationship>
									<xsl:attribute name="typeCode" namespace=""
										select="'COMP'" />
									<xsl:for-each select="toc:fillNumber">
	                                    <xsl:call-template name="intINT">
	                                        <xsl:with-param name="intINT" select="." as="node()" />
	                                        <xsl:with-param name="elementName" select="'sequenceNumber'" />
	                                    </xsl:call-template>
									</xsl:for-each>
									
								</entryRelationship>
								
								<xsl:for-each select="toc:fillStatus">
										<statusCode>
											<xsl:attribute name="code">
												<xsl:value-of select="@value" />
											</xsl:attribute>
										</statusCode>
									</xsl:for-each>
								
							</supply>
							</xsl:for-each>
						</act>
					</entryRelationship> -->
				</xsl:for-each>	
				<xsl:for-each select="$medication/toc:DoseIndicator">
					<precondition>
						<criterion>
							<xsl:for-each select="node()[./self::text()]">
								<text>
									<xsl:sequence select="fn:string(.)" />
								</text>
							</xsl:for-each>
						</criterion>
					</precondition>
				</xsl:for-each>
			</substanceAdministration>
		</entry>
	</xsl:template>
</xsl:stylesheet>