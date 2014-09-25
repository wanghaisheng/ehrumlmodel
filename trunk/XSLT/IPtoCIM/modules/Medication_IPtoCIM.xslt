<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn gcda"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../templates.xslt" />

	<xsl:template name="medicationModule">
		<xsl:param name="medicationModule" />

		<xsl:for-each select="$medicationModule">
			<xsl:variable name="var559_entryRelationship" as="node()*"
				select="cda:entryRelationship" />
			<Medication>

				<xsl:for-each select="cda:text">
					<Text>
						<!-- <xsl:for-each select="node()[fn:boolean(self::text())]"> <xsl:sequence 
							select="fn:string(.)"/> </xsl:for-each> -->
						<xsl:sequence select="(./@node(), ./node())" />
					</Text>
				</xsl:for-each>
				
<!-- 			<xsl:for-each select="cda:effectiveTime">
                <xsl:call-template name="ivlTS">
                    <xsl:with-param name="ivlTS" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'IndicateMedicationStopped'" />
                </xsl:call-template>
			</xsl:for-each>   -->
				
			 	<xsl:for-each select="cda:effectiveTime">
					<xsl:if test="position()=1">
						<xsl:variable name="var560_nullFlavor" as="node()?"
							select="@nullFlavor" />
						<xsl:variable name="var561_value" as="node()?"
							select="@value" />
						<IndicateMedicationStopped>
							<xsl:if test="fn:exists(@nullFlavor)">
								<xsl:attribute name="nullFlavor" namespace=""
									select="fn:string(@nullFlavor)" />
							</xsl:if>
							<xsl:if test="fn:exists(@value)">
								<xsl:attribute name="value" namespace=""
									select="fn:string(@value)" />
							</xsl:if>
						</IndicateMedicationStopped>
					</xsl:if>
					<xsl:if test="position()=2">
						<xsl:variable name="var1524_unit" as="node()?"
							select="cda:period/@unit" />
						<xsl:variable name="var1523_value" as="node()?"
							select="cda:period/@value" />
						<AdministrationTiming>
							<gcda:period>
								<xsl:if test="fn:exists($var1524_unit)">
									<xsl:attribute name="unit" namespace=""
										select="fn:string($var1524_unit)" />
								</xsl:if>
								<xsl:if test="fn:exists($var1523_value)">
									<xsl:attribute name="value" namespace=""
										select="fn:string($var1523_value)" />
								</xsl:if>
							</gcda:period>
						</AdministrationTiming>
					</xsl:if>
				</xsl:for-each> 

				<xsl:for-each select="cda:routeCode">
					<xsl:call-template name="codeCD">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'Route'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:doseQuantity">
					<xsl:variable name="var577_nullFlavor" as="node()?"
						select="@nullFlavor" />
					<xsl:variable name="var578_unit" as="node()?" select="@unit" />
					<xsl:variable name="var579_value" as="node()?" select="@value" />
					<Dose>
						<xsl:if test="fn:exists($var579_value)">
							<xsl:attribute name="value" namespace=""
								select="fn:string($var579_value)" />
						</xsl:if>
						<xsl:if test="fn:exists($var578_unit)">
							<xsl:attribute name="unit" namespace=""
								select="fn:string($var578_unit)" />
						</xsl:if>
						<xsl:if test="fn:exists($var577_nullFlavor)">
							<xsl:attribute name="nullFlavor" namespace=""
								select="fn:string($var577_nullFlavor)" />
						</xsl:if>
					</Dose>
				</xsl:for-each>
				<xsl:for-each select="cda:approachSiteCode">
					<xsl:call-template name="codeCD">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'Site'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:maxDoseQuantity">
					<DoseRestriction>
						<xsl:for-each select="cda:numerator">
							<xsl:variable name="var595_nullFlavor" as="node()?"
								select="@nullFlavor" />
							<xsl:variable name="var596_unit" as="node()?"
								select="@unit" />
							<xsl:variable name="var597_value" as="node()?"
								select="@value" />
							<Numerator>
								<xsl:if test="fn:exists($var597_value)">
									<xsl:attribute name="value" namespace=""
										select="fn:string($var597_value)" />
								</xsl:if>
								<xsl:if test="fn:exists($var596_unit)">
									<xsl:attribute name="unit" namespace=""
										select="fn:string($var596_unit)" />
								</xsl:if>
								<xsl:if test="fn:exists($var595_nullFlavor)">
									<xsl:attribute name="nullFlavor" namespace=""
										select="fn:string($var595_nullFlavor)" />
								</xsl:if>
							</Numerator>
						</xsl:for-each>
						<xsl:for-each select="cda:denominator">
							<xsl:variable name="var598_nullFlavor" as="node()?"
								select="@nullFlavor" />
							<xsl:variable name="var599_unit" as="node()?"
								select="@unit" />
							<xsl:variable name="var600_value" as="node()?"
								select="@value" />
							<Denominator>
								<xsl:if test="fn:exists($var600_value)">
									<xsl:attribute name="value" namespace=""
										select="fn:string($var600_value)" />
								</xsl:if>
								<xsl:if test="fn:exists($var599_unit)">
									<xsl:attribute name="unit" namespace=""
										select="fn:string($var599_unit)" />
								</xsl:if>
								<xsl:if test="fn:exists($var598_nullFlavor)">
									<xsl:attribute name="nullFlavor" namespace=""
										select="fn:string($var598_nullFlavor)" />
								</xsl:if>
							</Denominator>
						</xsl:for-each>
					</DoseRestriction>
				</xsl:for-each>
				<xsl:for-each select="cda:administrationUnitCode">
					<xsl:call-template name="codeCD">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'ProductForm'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:code">
					<xsl:call-template name="codeCD">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'DeliveryMethod'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:consumable/cda:manufacturedProduct">
					<xsl:variable name="var669_cur" as="node()" select="." />
					<xsl:for-each select="cda:manufacturedMaterial">
						<xsl:variable name="var631_code" as="node()?" select="cda:code" />
						<MedicationInformation>
							<xsl:for-each select="$var631_code">
								<xsl:variable name="var632_nullFlavor" as="node()?"
									select="@nullFlavor" />
								<xsl:variable name="var633_codeSystemName" as="node()?"
									select="@codeSystemName" />
								<xsl:variable name="var634_codeSystem" as="node()?"
									select="@codeSystem" />
								<xsl:variable name="var635_displayName" as="node()?"
									select="@displayName" />
								<xsl:variable name="var636_code" as="node()?"
									select="@code" />
								<CodedProductName>
									<xsl:if test="fn:exists($var636_code)">
										<xsl:attribute name="code" namespace=""
											select="fn:string($var636_code)" />
									</xsl:if>
									<xsl:if test="fn:exists($var635_displayName)">
										<xsl:attribute name="displayName" namespace=""
											select="fn:string($var635_displayName)" />
									</xsl:if>
									<xsl:if test="fn:exists($var634_codeSystem)">
										<xsl:attribute name="codeSystem" namespace=""
											select="fn:string($var634_codeSystem)" />
									</xsl:if>
									<xsl:if test="fn:exists($var633_codeSystemName)">
										<xsl:attribute name="codeSystemName" namespace=""
											select="fn:string($var633_codeSystemName)" />
									</xsl:if>
									<xsl:if test="fn:exists($var632_nullFlavor)">
										<xsl:attribute name="nullFlavor" namespace=""
											select="fn:string($var632_nullFlavor)" />
									</xsl:if>
									<!-- <gcda:originalText> <xsl:for-each select="cda:originalText/node()[fn:boolean(self::text())]"> 
										<xsl:sequence select="fn:string(.)" /> </xsl:for-each> </gcda:originalText> -->
									<xsl:for-each select="cda:qualifier">
										<xsl:call-template name="qualifier">
											<xsl:with-param name="qualifier" select="."
												as="node()" />
										</xsl:call-template>
									</xsl:for-each>
								</CodedProductName>
							</xsl:for-each>
							<xsl:for-each select="$var631_code/cda:translation">
								<xsl:variable name="var647_nullFlavor" as="node()?"
									select="@nullFlavor" />
								<xsl:variable name="var648_codeSystemName" as="node()?"
									select="@codeSystemName" />
								<xsl:variable name="var649_codeSystem" as="node()?"
									select="@codeSystem" />
								<xsl:variable name="var650_displayName" as="node()?"
									select="@displayName" />
								<xsl:variable name="var651_code" as="node()?"
									select="@code" />
								<CodedBrandName>
									<xsl:if test="fn:exists($var651_code)">
										<xsl:attribute name="code" namespace=""
											select="fn:string($var651_code)" />
									</xsl:if>
									<xsl:if test="fn:exists($var650_displayName)">
										<xsl:attribute name="displayName" namespace=""
											select="fn:string($var650_displayName)" />
									</xsl:if>
									<xsl:if test="fn:exists($var649_codeSystem)">
										<xsl:attribute name="codeSystem" namespace=""
											select="fn:string($var649_codeSystem)" />
									</xsl:if>
									<xsl:if test="fn:exists($var648_codeSystemName)">
										<xsl:attribute name="codeSystemName" namespace=""
											select="fn:string($var648_codeSystemName)" />
									</xsl:if>
									<xsl:if test="fn:exists($var647_nullFlavor)">
										<xsl:attribute name="nullFlavor" namespace=""
											select="fn:string($var647_nullFlavor)" />
									</xsl:if>
									<!-- <xsl:for-each select="cda:originalText"> <gcda:originalText> 
										<xsl:for-each select="node()[fn:boolean(self::text())]"> <xsl:sequence select="fn:string(.)" 
										/> </xsl:for-each> </gcda:originalText> </xsl:for-each> -->
									<xsl:for-each select="cda:qualifier">
										<xsl:call-template name="qualifier">
											<xsl:with-param name="qualifier" select="."
												as="node()" />
										</xsl:call-template>
									</xsl:for-each>
								</CodedBrandName>
							</xsl:for-each>
							<xsl:for-each select="$var631_code/cda:originalText/cda:reference">
								<FreeTextProductName>
									<xsl:sequence select="fn:string(@value)" />
								</FreeTextProductName>
							</xsl:for-each>
							<!-- Related to RELEASE 1.0  -->
							<!-- <FreeTextProductName> <xsl:for-each select="$var631_code/cda:originalText/node()[fn:boolean(self::text())]"> 
								<xsl:sequence select="fn:string(.)"/> </xsl:for-each> </FreeTextProductName> -->
							<xsl:for-each select="cda:name">
								<FreeTextBrandName>
									<xsl:sequence select="fn:string(.)" />
								</FreeTextBrandName>
							</xsl:for-each>

							<xsl:for-each select="$var669_cur/cda:manufacturerOrganization">
								<xsl:call-template name="organization">
									<xsl:with-param name="organization" select="."
										as="node()" />
									<xsl:with-param name="elementName" select="'DrugManufacturer'" />
								</xsl:call-template>
							</xsl:for-each>
						</MedicationInformation>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each
					select="$var559_entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.8.1']/cda:code">
					<xsl:call-template name="codeCD">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'TypeOfMedication'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each
					select="$var559_entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.47']/cda:value">
					<xsl:variable name="var696_cur" as="node()" select="." />
					<xsl:variable name="var685_result" as="xs:boolean*">
						<xsl:for-each select="@xsi:type">
							<xsl:sequence
								select="(fn:resolve-QName(fn:string(.), $var696_cur) = xs:QName('cda:CD'))" />
						</xsl:for-each>
					</xsl:variable>
					<xsl:if test="fn:exists($var685_result[.])">
						<xsl:variable name="var686_nullFlavor" as="node()?"
							select="@nullFlavor" />
						<xsl:variable name="var687_codeSystemName" as="node()?"
							select="@codeSystemName" />
						<xsl:variable name="var688_codeSystem" as="node()?"
							select="@codeSystem" />
						<xsl:variable name="var689_displayName" as="node()?"
							select="@displayName" />
						<xsl:variable name="var690_code" as="node()?" select="@code" />
						<StatusOfMedication>
							<xsl:if test="fn:exists($var690_code)">
								<xsl:attribute name="code" namespace=""
									select="fn:string($var690_code)" />
							</xsl:if>
							<xsl:if test="fn:exists($var689_displayName)">
								<xsl:attribute name="displayName" namespace=""
									select="fn:string($var689_displayName)" />
							</xsl:if>
							<xsl:if test="fn:exists($var688_codeSystem)">
								<xsl:attribute name="codeSystem" namespace=""
									select="fn:string($var688_codeSystem)" />
							</xsl:if>
							<xsl:if test="fn:exists($var687_codeSystemName)">
								<xsl:attribute name="codeSystemName" namespace=""
									select="fn:string($var687_codeSystemName)" />
							</xsl:if>
							<xsl:if test="fn:exists($var686_nullFlavor)">
								<xsl:attribute name="nullFlavor" namespace=""
									select="fn:string($var686_nullFlavor)" />
							</xsl:if>
							<xsl:for-each select="cda:originalText">
								<gcda:originalText>
									<xsl:for-each select="node()[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)" />
									</xsl:for-each>
								</gcda:originalText>
							</xsl:for-each>
							<xsl:for-each select="cda:qualifier">
								<gcda:qualifier>
									<xsl:for-each select="cda:name">
										<xsl:variable name="var691_nullFlavor" as="node()?"
											select="@nullFlavor" />
										<xsl:variable name="var692_codeSystemName" as="node()?"
											select="@codeSystemName" />
										<xsl:variable name="var693_codeSystem" as="node()?"
											select="@codeSystem" />
										<xsl:variable name="var694_displayName" as="node()?"
											select="@displayName" />
										<xsl:variable name="var695_code" as="node()?"
											select="@code" />
										<gcda:name>
											<xsl:if test="fn:exists($var695_code)">
												<xsl:attribute name="code" namespace=""
													select="fn:string($var695_code)" />
											</xsl:if>
											<xsl:if test="fn:exists($var694_displayName)">
												<xsl:attribute name="displayName" namespace=""
													select="fn:string($var694_displayName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var693_codeSystem)">
												<xsl:attribute name="codeSystem" namespace=""
													select="fn:string($var693_codeSystem)" />
											</xsl:if>
											<xsl:if test="fn:exists($var692_codeSystemName)">
												<xsl:attribute name="codeSystemName"
													namespace="" select="fn:string($var692_codeSystemName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var691_nullFlavor)">
												<xsl:attribute name="nullFlavor" namespace=""
													select="fn:string($var691_nullFlavor)" />
											</xsl:if>
											<xsl:for-each select="cda:originalText">
												<gcda:originalText>
													<xsl:sequence select="fn:string(.)" />
												</gcda:originalText>
											</xsl:for-each>
											<xsl:for-each select="cda:qualifier">
												<gcda:qualifier>
													<xsl:sequence select="()" />
												</gcda:qualifier>
											</xsl:for-each>
										</gcda:name>
									</xsl:for-each>
									<xsl:for-each select="cda:value">
										<gcda:value>
											<xsl:sequence select="()" />
										</gcda:value>
									</xsl:for-each>
								</gcda:qualifier>
							</xsl:for-each>
						</StatusOfMedication>
					</xsl:if>
				</xsl:for-each>
				<xsl:for-each
					select="$var559_entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.54']/cda:code">
					<xsl:call-template name="codeCD">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'reaction'" />
					</xsl:call-template>
				</xsl:for-each>

				<xsl:for-each
					select="cda:entryRelationship[@inversionInd='true']/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.49']">
					<PatientInstructions>
						<xsl:for-each select="cda:code">
							<xsl:if test="fn:exists(@code)">
								<xsl:attribute name="code" namespace=""
									select="fn:string(@code)" />
							</xsl:if>
							<xsl:if test="fn:exists(@displayName)">
								<xsl:attribute name="displayName" namespace=""
									select="fn:string(@displayName)" />
							</xsl:if>
							<xsl:if test="fn:exists(@codeSystem)">
								<xsl:attribute name="codeSystem" namespace=""
									select="fn:string(@codeSystem)" />
							</xsl:if>
							<xsl:if test="fn:exists(@codeSystemName)">
								<xsl:attribute name="codeSystemName" namespace=""
									select="fn:string(@codeSystemName)" />
							</xsl:if>
							<xsl:if test="fn:exists(@nullFlavor)">
								<xsl:attribute name="nullFlavor" namespace=""
									select="fn:string(@nullFlavor)" />
							</xsl:if>
							<xsl:for-each select="cda:originalText">
								<gcda:originalText>
									<xsl:for-each select="node()[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)" />
									</xsl:for-each>
								</gcda:originalText>
							</xsl:for-each>
							<xsl:for-each select="cda:qualifier">
								<gcda:qualifier>
									<xsl:for-each select="cda:name">
										<xsl:variable name="var717_nullFlavor" as="node()?"
											select="@nullFlavor" />
										<xsl:variable name="var718_codeSystemName" as="node()?"
											select="@codeSystemName" />
										<xsl:variable name="var719_codeSystem" as="node()?"
											select="@codeSystem" />
										<xsl:variable name="var720_displayName" as="node()?"
											select="@displayName" />
										<xsl:variable name="var721_code" as="node()?"
											select="@code" />
										<gcda:name>
											<xsl:if test="fn:exists($var721_code)">
												<xsl:attribute name="code" namespace=""
													select="fn:string($var721_code)" />
											</xsl:if>
											<xsl:if test="fn:exists($var720_displayName)">
												<xsl:attribute name="displayName" namespace=""
													select="fn:string($var720_displayName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var719_codeSystem)">
												<xsl:attribute name="codeSystem" namespace=""
													select="fn:string($var719_codeSystem)" />
											</xsl:if>
											<xsl:if test="fn:exists($var718_codeSystemName)">
												<xsl:attribute name="codeSystemName"
													namespace="" select="fn:string($var718_codeSystemName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var717_nullFlavor)">
												<xsl:attribute name="nullFlavor" namespace=""
													select="fn:string($var717_nullFlavor)" />
											</xsl:if>
											<xsl:for-each select="cda:originalText">
												<gcda:originalText>
													<xsl:sequence select="fn:string(.)" />
												</gcda:originalText>
											</xsl:for-each>
											<xsl:for-each select="cda:qualifier">
												<gcda:qualifier>
													<xsl:sequence select="()" />
												</gcda:qualifier>
											</xsl:for-each>
										</gcda:name>
									</xsl:for-each>
									<xsl:for-each select="cda:value">
										<xsl:variable name="var722_nullFlavor" as="xs:string?"
											select="@nullFlavor" />
										<xsl:variable name="var723_codeSystemName" as="xs:string?"
											select="@codeSystemName" />
										<xsl:variable name="var724_codeSystem" as="xs:string?"
											select="@codeSystem" />
										<xsl:variable name="var725_displayName" as="xs:string?"
											select="@displayName" />
										<xsl:variable name="var726_code" as="xs:string?"
											select="@code" />
										<gcda:value>
											<xsl:if test="fn:exists($var726_code)">
												<xsl:attribute name="code" namespace=""
													select="fn:string($var726_code)" />
											</xsl:if>
											<xsl:if test="fn:exists($var725_displayName)">
												<xsl:attribute name="displayName" namespace=""
													select="fn:string($var725_displayName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var724_codeSystem)">
												<xsl:attribute name="codeSystem" namespace=""
													select="fn:string($var724_codeSystem)" />
											</xsl:if>
											<xsl:if test="fn:exists($var723_codeSystemName)">
												<xsl:attribute name="codeSystemName"
													namespace="" select="fn:string($var723_codeSystemName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var722_nullFlavor)">
												<xsl:attribute name="nullFlavor" namespace=""
													select="fn:string($var722_nullFlavor)" />
											</xsl:if>
											<xsl:for-each select="cda:originalText">
												<gcda:originalText>
													<xsl:sequence select="fn:string(.)" />
												</gcda:originalText>
											</xsl:for-each>
											<xsl:for-each select="cda:qualifier">
												<gcda:qualifier>
													<xsl:sequence select="()" />
												</gcda:qualifier>
											</xsl:for-each>
										</gcda:value>
									</xsl:for-each>
								</gcda:qualifier>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="cda:text/cda:reference">
							<xsl:if test="fn:exists(@value)">
								<xsl:attribute name="displayName" namespace=""
									select="fn:string(@value)" />
							</xsl:if>
						</xsl:for-each>
					</PatientInstructions>
				</xsl:for-each>

				<xsl:for-each
					select="$var559_entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.28']/cda:code">
					<xsl:call-template name="codeCD">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'Indication'" />
					</xsl:call-template>
				</xsl:for-each>

				<xsl:for-each
					select="cda:participant[@typeCode='CSM']/cda:participantRole[@classCode='MANU']/cda:playingEntity">
					<Vehicle>
						<xsl:for-each select="cda:code">
							<xsl:variable name="var712_nullFlavor" as="node()?"
								select="@nullFlavor" />
							<xsl:variable name="var713_codeSystemName" as="node()?"
								select="@codeSystemName" />
							<xsl:variable name="var714_codeSystem" as="node()?"
								select="@codeSystem" />
							<xsl:variable name="var715_displayName" as="node()?"
								select="@displayName" />
							<xsl:variable name="var716_code" as="node()?"
								select="@code" />

							<xsl:if test="fn:exists($var716_code)">
								<xsl:attribute name="code" namespace=""
									select="fn:string($var716_code)" />
							</xsl:if>
							<xsl:if test="fn:exists($var715_displayName)">
								<xsl:attribute name="displayName" namespace=""
									select="fn:string($var715_displayName)" />
							</xsl:if>
							<xsl:if test="fn:exists($var714_codeSystem)">
								<xsl:attribute name="codeSystem" namespace=""
									select="fn:string($var714_codeSystem)" />
							</xsl:if>
							<xsl:if test="fn:exists($var713_codeSystemName)">
								<xsl:attribute name="codeSystemName" namespace=""
									select="fn:string($var713_codeSystemName)" />
							</xsl:if>
							<xsl:if test="fn:exists($var712_nullFlavor)">
								<xsl:attribute name="nullFlavor" namespace=""
									select="fn:string($var712_nullFlavor)" />
							</xsl:if>
							<xsl:for-each select="cda:originalText">
								<gcda:originalText>
									<xsl:for-each select="node()[fn:boolean(self::text())]">
										<xsl:sequence select="fn:string(.)" />
									</xsl:for-each>
								</gcda:originalText>
							</xsl:for-each>
							<xsl:for-each select="cda:qualifier">
								<gcda:qualifier>
									<xsl:for-each select="cda:name">
										<xsl:variable name="var717_nullFlavor" as="node()?"
											select="@nullFlavor" />
										<xsl:variable name="var718_codeSystemName" as="node()?"
											select="@codeSystemName" />
										<xsl:variable name="var719_codeSystem" as="node()?"
											select="@codeSystem" />
										<xsl:variable name="var720_displayName" as="node()?"
											select="@displayName" />
										<xsl:variable name="var721_code" as="node()?"
											select="@code" />
										<gcda:name>
											<xsl:if test="fn:exists($var721_code)">
												<xsl:attribute name="code" namespace=""
													select="fn:string($var721_code)" />
											</xsl:if>
											<xsl:if test="fn:exists($var720_displayName)">
												<xsl:attribute name="displayName" namespace=""
													select="fn:string($var720_displayName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var719_codeSystem)">
												<xsl:attribute name="codeSystem" namespace=""
													select="fn:string($var719_codeSystem)" />
											</xsl:if>
											<xsl:if test="fn:exists($var718_codeSystemName)">
												<xsl:attribute name="codeSystemName"
													namespace="" select="fn:string($var718_codeSystemName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var717_nullFlavor)">
												<xsl:attribute name="nullFlavor" namespace=""
													select="fn:string($var717_nullFlavor)" />
											</xsl:if>
											<xsl:for-each select="cda:originalText">
												<gcda:originalText>
													<xsl:sequence select="fn:string(.)" />
												</gcda:originalText>
											</xsl:for-each>
											<xsl:for-each select="cda:qualifier">
												<gcda:qualifier>
													<xsl:sequence select="()" />
												</gcda:qualifier>
											</xsl:for-each>
										</gcda:name>
									</xsl:for-each>
									<xsl:for-each select="cda:value">
										<xsl:variable name="var722_nullFlavor" as="node()?"
											select="@nullFlavor" />
										<xsl:variable name="var723_codeSystemName" as="node()?"
											select="@codeSystemName" />
										<xsl:variable name="var724_codeSystem" as="node()?"
											select="@codeSystem" />
										<xsl:variable name="var725_displayName" as="node()?"
											select="@displayName" />
										<xsl:variable name="var726_code" as="node()?"
											select="@code" />
										<gcda:value>
											<xsl:if test="fn:exists($var726_code)">
												<xsl:attribute name="code" namespace=""
													select="fn:string($var726_code)" />
											</xsl:if>
											<xsl:if test="fn:exists($var725_displayName)">
												<xsl:attribute name="displayName" namespace=""
													select="fn:string($var725_displayName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var724_codeSystem)">
												<xsl:attribute name="codeSystem" namespace=""
													select="fn:string($var724_codeSystem)" />
											</xsl:if>
											<xsl:if test="fn:exists($var723_codeSystemName)">
												<xsl:attribute name="codeSystemName"
													namespace="" select="fn:string($var723_codeSystemName)" />
											</xsl:if>
											<xsl:if test="fn:exists($var722_nullFlavor)">
												<xsl:attribute name="nullFlavor" namespace=""
													select="fn:string($var722_nullFlavor)" />
											</xsl:if>
											<xsl:for-each select="cda:originalText">
												<gcda:originalText>
													<xsl:sequence select="fn:string(.)" />
												</gcda:originalText>
											</xsl:for-each>
											<xsl:for-each select="cda:qualifier">
												<gcda:qualifier>
													<xsl:sequence select="()" />
												</gcda:qualifier>
											</xsl:for-each>
										</gcda:value>
									</xsl:for-each>
								</gcda:qualifier>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="cda:name">
							<xsl:attribute name="name" namespace="" select="fn:string(.)" />
						</xsl:for-each>
					</Vehicle>
				</xsl:for-each>

				<xsl:for-each
					select="$var559_entryRelationship/cda:supply[@moodCode='INT']">
					<OrderInformation>
						<xsl:for-each select="cda:id">
							<xsl:variable name="var727_nullFlavor" as="node()?"
								select="@nullFlavor" />
							<xsl:variable name="var728_extension" as="node()?"
								select="@extension" />
							<xsl:variable name="var729_root" as="node()?"
								select="@root" />
							<OrderNumber>
								<xsl:if test="fn:exists($var729_root)">
									<xsl:attribute name="root" namespace=""
										select="fn:string($var729_root)" />
								</xsl:if>
								<xsl:if test="fn:exists($var728_extension)">
									<xsl:attribute name="extension" namespace=""
										select="fn:string($var728_extension)" />
								</xsl:if>
								<xsl:if test="fn:exists($var727_nullFlavor)">
									<xsl:attribute name="nullFlavor" namespace=""
										select="fn:string($var727_nullFlavor)" />
								</xsl:if>
							</OrderNumber>
						</xsl:for-each>
						<xsl:for-each select="cda:repeatNumber">
							<xsl:variable name="var730_value" as="node()?"
								select="@value" />
							<Fills>
								<xsl:if test="fn:exists($var730_value)">
									<xsl:attribute name="value" namespace=""
										select="xs:string(xs:integer(fn:string($var730_value)))" />
								</xsl:if>
							</Fills>
						</xsl:for-each>
						<xsl:for-each select="cda:quantity">
							<xsl:variable name="var731_nullFlavor" as="node()?"
								select="@nullFlavor" />
							<xsl:variable name="var732_unit" as="node()?"
								select="@unit" />
							<xsl:variable name="var733_value" as="node()?"
								select="@value" />
							<QuantityOrdered>
								<xsl:if test="fn:exists($var733_value)">
									<xsl:attribute name="value" namespace=""
										select="fn:string($var733_value)" />
								</xsl:if>
								<xsl:if test="fn:exists($var732_unit)">
									<xsl:attribute name="unit" namespace=""
										select="fn:string($var732_unit)" />
								</xsl:if>
								<xsl:if test="fn:exists($var731_nullFlavor)">
									<xsl:attribute name="nullFlavor" namespace=""
										select="fn:string($var731_nullFlavor)" />
								</xsl:if>
							</QuantityOrdered>
						</xsl:for-each>
						<xsl:for-each select="cda:effectiveTime">
							<xsl:variable name="var734_nullFlavor" as="node()?"
								select="@nullFlavor" />
							<xsl:variable name="var735_value" as="node()?"
								select="@value" />
							<OrderExpirationDateTime>
								<xsl:if test="fn:exists($var735_value)">
									<xsl:attribute name="value" namespace=""
										select="fn:string($var735_value)" />
								</xsl:if>
								<xsl:if test="fn:exists($var734_nullFlavor)">
									<xsl:attribute name="nullFlavor" namespace=""
										select="fn:string($var734_nullFlavor)" />
								</xsl:if>
							</OrderExpirationDateTime>
						</xsl:for-each>
						<xsl:for-each select="cda:author/cda:time">
							<xsl:variable name="var736_nullFlavor" as="node()?"
								select="@nullFlavor" />
							<xsl:variable name="var737_value" as="node()?"
								select="@value" />
							<OrderDateTime>
								<xsl:if test="fn:exists($var737_value)">
									<xsl:attribute name="value" namespace=""
										select="fn:string($var737_value)" />
								</xsl:if>
								<xsl:if test="fn:exists($var736_nullFlavor)">
									<xsl:attribute name="nullFlavor" namespace=""
										select="fn:string($var736_nullFlavor)" />
								</xsl:if>
							</OrderDateTime>
						</xsl:for-each>
					</OrderInformation>
				</xsl:for-each>
				<!-- The below transformation code should remain commented until the 
					structural issues are fixed for fulfillmentinstructions and fulfillmentHistory -->
				<!-- <xsl:for-each select="$var559_entryRelationship/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.43']/cda:text"> 
					<fulfillmentInstructions> <xsl:value-of select="."/> </fulfillmentInstructions> 
					</xsl:for-each> <xsl:for-each select="$var559_entryRelationship/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.43']/cda:supply[@moodCode='EVN']"> 
					<xsl:variable name="var534_performer" as="node()*" select="cda:performer"/> 
					<fulfillmentHistory> <xsl:for-each select="cda:id"> <xsl:variable name="var535_nullFlavor" 
					as="node()?" select="@nullFlavor"/> <xsl:variable name="var536_root" as="node()?" 
					select="@root"/> <xsl:variable name="var537_extension" as="node()?" select="@extension"/> 
					<prescriptionNumber> <xsl:if test="fn:exists($var536_root)"> <xsl:attribute 
					name="root" namespace="" select="fn:string($var536_root)"/> </xsl:if> <xsl:if 
					test="fn:exists($var537_extension)"> <xsl:attribute name="extension" namespace="" 
					select="fn:string($var537_extension)"/> </xsl:if> <xsl:if test="fn:exists($var535_nullFlavor)"> 
					<xsl:attribute name="nullFlavor" namespace="" select="fn:string($var535_nullFlavor)"/> 
					</xsl:if> </prescriptionNumber> </xsl:for-each> <provider> <xsl:for-each 
					select="$var534_performer/cda:assignedEntity/cda:representedOrganization/cda:id"> 
					<xsl:variable name="var538_nullFlavor" as="node()?" select="@nullFlavor"/> 
					<xsl:variable name="var539_extension" as="node()?" select="@extension"/> 
					<xsl:variable name="var540_root" as="node()?" select="@root"/> <gcda:organizationID> 
					<xsl:if test="fn:exists($var540_root)"> <xsl:attribute name="root" namespace="" 
					select="fn:string($var540_root)"/> </xsl:if> <xsl:if test="fn:exists($var539_extension)"> 
					<xsl:attribute name="extension" namespace="" select="fn:string($var539_extension)"/> 
					</xsl:if> <xsl:if test="fn:exists($var538_nullFlavor)"> <xsl:attribute name="nullFlavor" 
					namespace="" select="fn:string($var538_nullFlavor)"/> </xsl:if> </gcda:organizationID> 
					</xsl:for-each> <xsl:for-each select="$var534_performer/cda:assignedEntity/cda:representedOrganization/cda:addr"> 
					<xsl:variable name="var541_nullFlavor" as="node()?" select="@nullFlavor"/> 
					<gcda:organizationAddress> <xsl:if test="fn:exists($var541_nullFlavor)"> 
					<xsl:attribute name="nullFlavor" namespace="" select="fn:string($var541_nullFlavor)"/> 
					</xsl:if> <xsl:for-each select="cda:streetAddressLine"> <gcda:streetAddressLine> 
					<xsl:for-each select="node()[fn:boolean(self::text())]"> <xsl:sequence select="fn:string(.)"/> 
					</xsl:for-each> </gcda:streetAddressLine> </xsl:for-each> <xsl:for-each select="cda:city"> 
					<gcda:city> <xsl:for-each select="node()[fn:boolean(self::text())]"> <xsl:sequence 
					select="fn:string(.)"/> </xsl:for-each> </gcda:city> </xsl:for-each> <xsl:for-each 
					select="cda:state"> <gcda:state> <xsl:for-each select="node()[fn:boolean(self::text())]"> 
					<xsl:sequence select="fn:string(.)"/> </xsl:for-each> </gcda:state> </xsl:for-each> 
					<xsl:for-each select="cda:postalCode"> <gcda:postalCode> <xsl:for-each select="node()[fn:boolean(self::text())]"> 
					<xsl:sequence select="fn:string(.)"/> </xsl:for-each> </gcda:postalCode> 
					</xsl:for-each> </gcda:organizationAddress> </xsl:for-each> <xsl:for-each 
					select="$var534_performer/cda:assignedEntity/cda:representedOrganization/cda:telecom"> 
					<xsl:variable name="var542_nullFlavor" as="node()?" select="@nullFlavor"/> 
					<xsl:variable name="var543_value" as="node()?" select="@value"/> <gcda:organizationTelecom> 
					<xsl:if test="fn:exists($var543_value)"> <xsl:attribute name="value" namespace="" 
					select="xs:string(xs:anyURI(fn:string($var543_value)))"/> </xsl:if> <xsl:if 
					test="fn:exists($var542_nullFlavor)"> <xsl:attribute name="nullFlavor" namespace="" 
					select="fn:string($var542_nullFlavor)"/> </xsl:if> </gcda:organizationTelecom> 
					</xsl:for-each> <xsl:for-each select="$var534_performer/cda:assignedEntity/cda:representedOrganization/cda:name"> 
					<xsl:variable name="var544_nullFlavor" as="node()?" select="@nullFlavor"/> 
					<gcda:organizationName> <xsl:if test="fn:exists($var544_nullFlavor)"> <xsl:attribute 
					name="nullFlavor" namespace="" select="fn:string($var544_nullFlavor)"/> </xsl:if> 
					<xsl:for-each select="node()[fn:boolean(self::text())]"> <xsl:sequence select="fn:string(.)"/> 
					</xsl:for-each> </gcda:organizationName> </xsl:for-each> </provider> <xsl:for-each 
					select="$var534_performer/cda:assignedEntity/cda:addr"> <xsl:variable name="var545_nullFlavor" 
					as="node()?" select="@nullFlavor"/> <dispensingPharmacyLocation> <xsl:if 
					test="fn:exists($var545_nullFlavor)"> <xsl:attribute name="nullFlavor" namespace="" 
					select="fn:string($var545_nullFlavor)"/> </xsl:if> <xsl:for-each select="cda:streetAddressLine"> 
					<gcda:streetAddressLine> <xsl:for-each select="node()[fn:boolean(self::text())]"> 
					<xsl:sequence select="fn:string(.)"/> </xsl:for-each> </gcda:streetAddressLine> 
					</xsl:for-each> <xsl:for-each select="cda:city"> <gcda:city> <xsl:for-each 
					select="node()[fn:boolean(self::text())]"> <xsl:sequence select="fn:string(.)"/> 
					</xsl:for-each> </gcda:city> </xsl:for-each> <xsl:for-each select="cda:state"> 
					<gcda:state> <xsl:for-each select="node()[fn:boolean(self::text())]"> <xsl:sequence 
					select="fn:string(.)"/> </xsl:for-each> </gcda:state> </xsl:for-each> <xsl:for-each 
					select="cda:postalCode"> <gcda:postalCode> <xsl:for-each select="node()[fn:boolean(self::text())]"> 
					<xsl:sequence select="fn:string(.)"/> </xsl:for-each> </gcda:postalCode> 
					</xsl:for-each> </dispensingPharmacyLocation> </xsl:for-each> <xsl:for-each 
					select="cda:effectiveTime"> <xsl:variable name="var546_operator" as="node()?" 
					select="@operator"/> <xsl:variable name="var547_value" as="node()?" select="@value"/> 
					<xsl:variable name="var548_nullFlavor" as="node()?" select="@nullFlavor"/> 
					<dispenseDate> <xsl:if test="fn:exists($var547_value)"> <xsl:attribute name="value" 
					namespace="" select="fn:string($var547_value)"/> </xsl:if> <xsl:if test="fn:exists($var548_nullFlavor)"> 
					<xsl:attribute name="nullFlavor" namespace="" select="fn:string($var548_nullFlavor)"/> 
					</xsl:if> <xsl:if test="fn:exists($var546_operator)"> <xsl:attribute name="operator" 
					namespace="" select="fn:string($var546_operator)"/> </xsl:if> </dispenseDate> 
					</xsl:for-each> <xsl:for-each select="cda:quantity"> <xsl:variable name="var549_unit" 
					as="node()?" select="@unit"/> <xsl:variable name="var550_value" as="node()?" 
					select="@value"/> <xsl:variable name="var551_nullFlavor" as="node()?" select="@nullFlavor"/> 
					<quantityDispensed> <xsl:if test="fn:exists($var550_value)"> <xsl:attribute 
					name="value" namespace="" select="fn:string($var550_value)"/> </xsl:if> <xsl:if 
					test="fn:exists($var549_unit)"> <xsl:attribute name="unit" namespace="" select="fn:string($var549_unit)"/> 
					</xsl:if> <xsl:if test="fn:exists($var551_nullFlavor)"> <xsl:attribute name="nullFlavor" 
					namespace="" select="fn:string($var551_nullFlavor)"/> </xsl:if> </quantityDispensed> 
					</xsl:for-each> <xsl:for-each select="cda:entryRelationship/cda:sequenceNumber"> 
					<fillNumber> <xsl:call-template name="tbf2_INT"> <xsl:with-param name="input" 
					select="." as="node()"/> </xsl:call-template> </fillNumber> </xsl:for-each> 
					<xsl:for-each select="cda:statusCode"> <fillStatus> <xsl:attribute name="value"> 
					<xsl:value-of select="@code"/> </xsl:attribute> </fillStatus> </xsl:for-each> 
					</fulfillmentHistory> </xsl:for-each> -->

			</Medication>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>