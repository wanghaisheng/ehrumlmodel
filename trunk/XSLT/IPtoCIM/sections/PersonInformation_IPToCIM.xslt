<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:hl7="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../../common/functions.xslt" />

	<xsl:template name="personInformationSection">
		<xsl:param name="personInformationSection" />
		<PersonInformation>
			<xsl:for-each select="$personInformationSection/hl7:id">
				<xsl:variable name="var38_extension" as="node()?"
					select="@extension" />
				<xsl:variable name="var39_nullFlavor" as="node()?"
					select="@nullFlavor" />
				<xsl:variable name="var40_root" as="node()?" select="@root" />
				<PersonID>
					<xsl:if test="fn:exists($var40_root)">
						<xsl:attribute name="root" namespace=""
							select="fn:string($var40_root)" />
					</xsl:if>
					<xsl:if test="fn:exists($var38_extension)">
						<xsl:attribute name="extension" namespace=""
							select="fn:string($var38_extension)" />
					</xsl:if>
					<xsl:if test="fn:exists($var39_nullFlavor)">
						<xsl:attribute name="nullFlavor" namespace=""
							select="fn:string($var39_nullFlavor)" />
					</xsl:if>
				</PersonID>
			</xsl:for-each>
			<xsl:for-each select="$personInformationSection/hl7:addr">
				<xsl:variable name="var41_nullFlavor" as="node()?"
					select="@nullFlavor" />
				<PersonAddress>
					<xsl:if test="fn:exists($var41_nullFlavor)">
						<xsl:attribute name="nullFlavor" namespace=""
							select="fn:string($var41_nullFlavor)" />
						<xsl:for-each select="hl7:streetAddressLine">
							<gcda:streetAddressLine>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:streetAddressLine>
						</xsl:for-each>
						<xsl:for-each select="hl7:city">
							<gcda:city>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:city>
						</xsl:for-each>
						<xsl:for-each select="hl7:state">
							<gcda:state>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:state>
						</xsl:for-each>
						<xsl:for-each select="hl7:postalCode">
							<gcda:postalCode>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:postalCode>
						</xsl:for-each>
					</xsl:if>
				</PersonAddress>
			</xsl:for-each>
			<xsl:for-each select="$personInformationSection/hl7:telecom">
				<xsl:variable name="var42_nullFlavor" as="node()?"
					select="@nullFlavor" />
				<xsl:variable name="var43_value" as="node()?" select="@value" />
				<PersonContact>
					<xsl:if test="fn:exists($var43_value)">
						<xsl:attribute name="value" namespace=""
							select="xs:string(xs:anyURI(fn:string($var43_value)))" />
					</xsl:if>
					<xsl:if test="fn:exists($var42_nullFlavor)">
						<xsl:attribute name="nullFlavor" namespace=""
							select="fn:string($var42_nullFlavor)" />
					</xsl:if>
				</PersonContact>
			</xsl:for-each>
			<PersonalInformation>
				<xsl:for-each select="$personInformationSection/hl7:patient/hl7:name">
					<xsl:variable name="var44_nullFlavor" as="node()?"
						select="@nullFlavor" />
					<PersonName>
						<xsl:if test="fn:exists($var44_nullFlavor)">
							<xsl:attribute name="nullFlavor" namespace=""
								select="fn:string($var44_nullFlavor)" />
						</xsl:if>
						<xsl:for-each select="hl7:prefix">
							<gcda:prefix>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:prefix>
						</xsl:for-each>
						<xsl:for-each select="hl7:given">
							<gcda:given>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:given>
						</xsl:for-each>
						<xsl:for-each select="hl7:family">
							<gcda:family>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:family>
						</xsl:for-each>
						<xsl:for-each select="hl7:suffix">
							<gcda:suffix>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:suffix>
						</xsl:for-each>
					</PersonName>
				</xsl:for-each>
				<xsl:for-each
					select="$personInformationSection/hl7:patient/hl7:administrativeGenderCode">
					<xsl:variable name="var45_nullFlavor" as="node()?"
						select="@nullFlavor" />
					<xsl:variable name="var46_codeSystem" as="node()?"
						select="@codeSystem" />
					<xsl:variable name="var47_code" as="node()?" select="@code" />
					<xsl:variable name="var48_codeSystemName" as="node()?"
						select="@codeSystemName" />
					<xsl:variable name="var49_displayName" as="node()?"
						select="@displayName" />
					<Gender>
						<xsl:if test="fn:exists($var47_code)">
							<xsl:attribute name="code" namespace=""
								select="fn:string($var47_code)" />
						</xsl:if>
						<xsl:if test="fn:exists($var49_displayName)">
							<xsl:attribute name="displayName" namespace=""
								select="fn:string($var49_displayName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var46_codeSystem)">
							<xsl:attribute name="codeSystem" namespace=""
								select="fn:string($var46_codeSystem)" />
						</xsl:if>
						<xsl:if test="fn:exists($var48_codeSystemName)">
							<xsl:attribute name="codeSystemName" namespace=""
								select="fn:string($var48_codeSystemName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var45_nullFlavor)">
							<xsl:attribute name="nullFlavor" namespace=""
								select="fn:string($var45_nullFlavor)" />
						</xsl:if>
						<xsl:for-each select="hl7:originalText">
							<gcda:originalText>
								<xsl:sequence select="fn:string(.)" />
							</gcda:originalText>
						</xsl:for-each>
						<xsl:for-each select="hl7:qualifier">
							<gcda:qualifier>
								<xsl:for-each select="hl7:name">
									<xsl:variable name="var50_code" as="node()?"
										select="@code" />
									<xsl:variable name="var51_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<xsl:variable name="var52_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var53_displayName" as="node()?"
										select="@displayName" />
									<xsl:variable name="var54_codeSystem" as="node()?"
										select="@codeSystem" />
									<gcda:name>
										<xsl:if test="fn:exists($var50_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var50_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var53_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var53_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var54_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var54_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var51_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var51_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var52_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var52_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:name>
								</xsl:for-each>
								<xsl:for-each select="hl7:value">
									<xsl:variable name="var55_codeSystem" as="node()?"
										select="@codeSystem" />
									<xsl:variable name="var56_code" as="node()?"
										select="@code" />
									<xsl:variable name="var57_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var58_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<xsl:variable name="var59_displayName" as="node()?"
										select="@displayName" />
									<gcda:value>
										<xsl:if test="fn:exists($var56_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var56_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var59_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var59_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var55_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var55_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var58_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var58_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var57_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var57_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:value>
								</xsl:for-each>
							</gcda:qualifier>
						</xsl:for-each>
					</Gender>
				</xsl:for-each>
				<xsl:for-each select="$personInformationSection/hl7:patient/hl7:birthTime">
					<PersonDateOfBirth>
						<xsl:call-template name="tbf1_TS">
							<xsl:with-param name="input" select="." as="node()" />
						</xsl:call-template>
					</PersonDateOfBirth>
				</xsl:for-each>
				<xsl:for-each
					select="$personInformationSection/hl7:patient/hl7:maritalStatusCode">
					<xsl:variable name="var60_code" as="node()?" select="@code" />
					<xsl:variable name="var61_codeSystem" as="node()?"
						select="@codeSystem" />
					<xsl:variable name="var62_nullFlavor" as="node()?"
						select="@nullFlavor" />
					<xsl:variable name="var63_displayName" as="node()?"
						select="@displayName" />
					<xsl:variable name="var64_codeSystemName" as="node()?"
						select="@codeSystemName" />
					<MaritalStatus>
						<xsl:if test="fn:exists($var60_code)">
							<xsl:attribute name="code" namespace=""
								select="fn:string($var60_code)" />
						</xsl:if>
						<xsl:if test="fn:exists($var63_displayName)">
							<xsl:attribute name="displayName" namespace=""
								select="fn:string($var63_displayName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var61_codeSystem)">
							<xsl:attribute name="codeSystem" namespace=""
								select="fn:string($var61_codeSystem)" />
						</xsl:if>
						<xsl:if test="fn:exists($var64_codeSystemName)">
							<xsl:attribute name="codeSystemName" namespace=""
								select="fn:string($var64_codeSystemName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var62_nullFlavor)">
							<xsl:attribute name="nullFlavor" namespace=""
								select="fn:string($var62_nullFlavor)" />
						</xsl:if>
						<xsl:for-each select="hl7:originalText">
							<gcda:originalText>
								<xsl:sequence select="fn:string(.)" />
							</gcda:originalText>
						</xsl:for-each>
						<xsl:for-each select="hl7:qualifier">
							<gcda:qualifier>
								<xsl:for-each select="hl7:name">
									<xsl:variable name="var65_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<xsl:variable name="var66_displayName" as="node()?"
										select="@displayName" />
									<xsl:variable name="var67_code" as="node()?"
										select="@code" />
									<xsl:variable name="var68_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var69_codeSystem" as="node()?"
										select="@codeSystem" />
									<gcda:name>
										<xsl:if test="fn:exists($var67_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var67_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var66_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var66_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var69_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var69_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var65_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var65_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var68_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var68_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:name>
								</xsl:for-each>
								<xsl:for-each select="hl7:value">
									<xsl:variable name="var70_displayName" as="node()?"
										select="@displayName" />
									<xsl:variable name="var71_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<xsl:variable name="var72_codeSystem" as="node()?"
										select="@codeSystem" />
									<xsl:variable name="var73_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var74_code" as="node()?"
										select="@code" />
									<gcda:value>
										<xsl:if test="fn:exists($var74_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var74_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var70_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var70_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var72_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var72_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var71_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var71_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var73_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var73_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:value>
								</xsl:for-each>
							</gcda:qualifier>
						</xsl:for-each>
					</MaritalStatus>
				</xsl:for-each>
				<xsl:for-each
					select="$personInformationSection/hl7:patient/hl7:religiousAffiliationCode">
					<xsl:variable name="var75_displayName" as="node()?"
						select="@displayName" />
					<xsl:variable name="var76_codeSystem" as="node()?"
						select="@codeSystem" />
					<xsl:variable name="var77_codeSystemName" as="node()?"
						select="@codeSystemName" />
					<xsl:variable name="var78_nullFlavor" as="node()?"
						select="@nullFlavor" />
					<xsl:variable name="var79_code" as="node()?" select="@code" />
					<ReligiousAffiliation>
						<xsl:if test="fn:exists($var79_code)">
							<xsl:attribute name="code" namespace=""
								select="fn:string($var79_code)" />
						</xsl:if>
						<xsl:if test="fn:exists($var75_displayName)">
							<xsl:attribute name="displayName" namespace=""
								select="fn:string($var75_displayName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var76_codeSystem)">
							<xsl:attribute name="codeSystem" namespace=""
								select="fn:string($var76_codeSystem)" />
						</xsl:if>
						<xsl:if test="fn:exists($var77_codeSystemName)">
							<xsl:attribute name="codeSystemName" namespace=""
								select="fn:string($var77_codeSystemName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var78_nullFlavor)">
							<xsl:attribute name="nullFlavor" namespace=""
								select="fn:string($var78_nullFlavor)" />
						</xsl:if>
						<xsl:for-each select="hl7:originalText">
							<gcda:originalText>
								<xsl:sequence select="fn:string(.)" />
							</gcda:originalText>
						</xsl:for-each>
						<xsl:for-each select="hl7:qualifier">
							<gcda:qualifier>
								<xsl:for-each select="hl7:name">
									<xsl:variable name="var80_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var81_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<xsl:variable name="var82_code" as="node()?"
										select="@code" />
									<xsl:variable name="var83_codeSystem" as="node()?"
										select="@codeSystem" />
									<xsl:variable name="var84_displayName" as="node()?"
										select="@displayName" />
									<gcda:name>
										<xsl:if test="fn:exists($var82_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var82_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var84_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var84_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var83_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var83_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var81_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var81_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var80_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var80_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:name>
								</xsl:for-each>
								<xsl:for-each select="hl7:value">
									<xsl:variable name="var85_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<xsl:variable name="var86_codeSystem" as="node()?"
										select="@codeSystem" />
									<xsl:variable name="var87_code" as="node()?"
										select="@code" />
									<xsl:variable name="var88_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var89_displayName" as="node()?"
										select="@displayName" />
									<gcda:value>
										<xsl:if test="fn:exists($var87_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var87_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var89_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var89_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var86_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var86_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var85_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var85_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var88_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var88_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:value>
								</xsl:for-each>
							</gcda:qualifier>
						</xsl:for-each>
					</ReligiousAffiliation>
				</xsl:for-each>
				<xsl:for-each select="$personInformationSection/hl7:patient/hl7:raceCode">
					<xsl:variable name="var90_nullFlavor" as="node()?"
						select="@nullFlavor" />
					<xsl:variable name="var91_code" as="node()?" select="@code" />
					<xsl:variable name="var92_codeSystemName" as="node()?"
						select="@codeSystemName" />
					<xsl:variable name="var93_codeSystem" as="node()?"
						select="@codeSystem" />
					<xsl:variable name="var94_displayName" as="node()?"
						select="@displayName" />
					<Race>
						<xsl:if test="fn:exists($var91_code)">
							<xsl:attribute name="code" namespace=""
								select="fn:string($var91_code)" />
						</xsl:if>
						<xsl:if test="fn:exists($var94_displayName)">
							<xsl:attribute name="displayName" namespace=""
								select="fn:string($var94_displayName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var93_codeSystem)">
							<xsl:attribute name="codeSystem" namespace=""
								select="fn:string($var93_codeSystem)" />
						</xsl:if>
						<xsl:if test="fn:exists($var92_codeSystemName)">
							<xsl:attribute name="codeSystemName" namespace=""
								select="fn:string($var92_codeSystemName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var90_nullFlavor)">
							<xsl:attribute name="nullFlavor" namespace=""
								select="fn:string($var90_nullFlavor)" />
						</xsl:if>
						<xsl:for-each select="hl7:originalText">
							<gcda:originalText>
								<xsl:sequence select="fn:string(.)" />
							</gcda:originalText>
						</xsl:for-each>
						<xsl:for-each select="hl7:qualifier">
							<gcda:qualifier>
								<xsl:for-each select="hl7:name">
									<xsl:variable name="var95_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<xsl:variable name="var96_codeSystem" as="node()?"
										select="@codeSystem" />
									<xsl:variable name="var97_displayName" as="node()?"
										select="@displayName" />
									<xsl:variable name="var98_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var99_code" as="node()?"
										select="@code" />
									<gcda:name>
										<xsl:if test="fn:exists($var99_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var99_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var97_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var97_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var96_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var96_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var95_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var95_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var98_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var98_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:name>
								</xsl:for-each>
								<xsl:for-each select="hl7:value">
									<xsl:variable name="var100_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var101_codeSystem" as="node()?"
										select="@codeSystem" />
									<xsl:variable name="var102_displayName" as="node()?"
										select="@displayName" />
									<xsl:variable name="var103_code" as="node()?"
										select="@code" />
									<xsl:variable name="var104_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<gcda:value>
										<xsl:if test="fn:exists($var103_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var103_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var102_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var102_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var101_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var101_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var104_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var104_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var100_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var100_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:value>
								</xsl:for-each>
							</gcda:qualifier>
						</xsl:for-each>
					</Race>
				</xsl:for-each>
				<xsl:for-each
					select="$personInformationSection/hl7:patient/hl7:ethnicGroupCode">
					<xsl:variable name="var105_code" as="node()?" select="@code" />
					<xsl:variable name="var106_displayName" as="node()?"
						select="@displayName" />
					<xsl:variable name="var107_nullFlavor" as="node()?"
						select="@nullFlavor" />
					<xsl:variable name="var108_codeSystemName" as="node()?"
						select="@codeSystemName" />
					<xsl:variable name="var109_codeSystem" as="node()?"
						select="@codeSystem" />
					<Ethnicity>
						<xsl:if test="fn:exists($var105_code)">
							<xsl:attribute name="code" namespace=""
								select="fn:string($var105_code)" />
						</xsl:if>
						<xsl:if test="fn:exists($var106_displayName)">
							<xsl:attribute name="displayName" namespace=""
								select="fn:string($var106_displayName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var109_codeSystem)">
							<xsl:attribute name="codeSystem" namespace=""
								select="fn:string($var109_codeSystem)" />
						</xsl:if>
						<xsl:if test="fn:exists($var108_codeSystemName)">
							<xsl:attribute name="codeSystemName" namespace=""
								select="fn:string($var108_codeSystemName)" />
						</xsl:if>
						<xsl:if test="fn:exists($var107_nullFlavor)">
							<xsl:attribute name="nullFlavor" namespace=""
								select="fn:string($var107_nullFlavor)" />
						</xsl:if>
						<xsl:for-each select="hl7:originalText">
							<gcda:originalText>
								<xsl:sequence select="fn:string(.)" />
							</gcda:originalText>
						</xsl:for-each>
						<xsl:for-each select="hl7:qualifier">
							<gcda:qualifier>
								<xsl:for-each select="hl7:name">
									<xsl:variable name="var110_codeSystem" as="node()?"
										select="@codeSystem" />
									<xsl:variable name="var111_code" as="node()?"
										select="@code" />
									<xsl:variable name="var112_displayName" as="node()?"
										select="@displayName" />
									<xsl:variable name="var113_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var114_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<gcda:name>
										<xsl:if test="fn:exists($var111_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var111_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var112_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var112_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var110_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var110_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var114_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var114_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var113_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var113_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:name>
								</xsl:for-each>
								<xsl:for-each select="hl7:value">
									<xsl:variable name="var115_codeSystem" as="node()?"
										select="@codeSystem" />
									<xsl:variable name="var116_nullFlavor" as="node()?"
										select="@nullFlavor" />
									<xsl:variable name="var117_codeSystemName" as="node()?"
										select="@codeSystemName" />
									<xsl:variable name="var118_code" as="node()?"
										select="@code" />
									<xsl:variable name="var119_displayName" as="node()?"
										select="@displayName" />
									<gcda:value>
										<xsl:if test="fn:exists($var118_code)">
											<xsl:attribute name="code" namespace=""
												select="fn:string($var118_code)" />
										</xsl:if>
										<xsl:if test="fn:exists($var119_displayName)">
											<xsl:attribute name="displayName" namespace=""
												select="fn:string($var119_displayName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var115_codeSystem)">
											<xsl:attribute name="codeSystem" namespace=""
												select="fn:string($var115_codeSystem)" />
										</xsl:if>
										<xsl:if test="fn:exists($var117_codeSystemName)">
											<xsl:attribute name="codeSystemName" namespace=""
												select="fn:string($var117_codeSystemName)" />
										</xsl:if>
										<xsl:if test="fn:exists($var116_nullFlavor)">
											<xsl:attribute name="nullFlavor" namespace=""
												select="fn:string($var116_nullFlavor)" />
										</xsl:if>
										<xsl:for-each select="hl7:originalText">
											<gcda:originalText>
												<xsl:sequence select="fn:string(.)" />
											</gcda:originalText>
										</xsl:for-each>
										<xsl:for-each select="hl7:qualifier">
											<gcda:qualifier>
												<xsl:sequence select="()" />
											</gcda:qualifier>
										</xsl:for-each>
									</gcda:value>
								</xsl:for-each>
							</gcda:qualifier>
						</xsl:for-each>
					</Ethnicity>
				</xsl:for-each>

				<!-- TODO <MothersMaidenName/> <MultipleBirthIndicator/> <BirthOrder/> 
					<Age/> -->
				<MothersMaidenName />
				<MultipleBirthIndicator />
				<BirthOrder />
				<Age />
				<xsl:for-each
					select="$personInformationSection/hl7:patient/hl7:birthplace/hl7:place/hl7:addr">
					<xsl:variable name="var120_nullFlavor" as="node()?"
						select="@nullFlavor" />
					<BirthPlace>
						<xsl:if test="fn:exists($var120_nullFlavor)">
							<xsl:attribute name="nullFlavor" namespace=""
								select="fn:string($var120_nullFlavor)" />
						</xsl:if>
						<xsl:for-each select="hl7:streetAddressLine">
							<gcda:streetAddressLine>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:streetAddressLine>
						</xsl:for-each>
						<xsl:for-each select="hl7:city">
							<gcda:city>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:city>
						</xsl:for-each>
						<xsl:for-each select="hl7:state">
							<gcda:state>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:state>
						</xsl:for-each>
						<xsl:for-each select="hl7:postalCode">
							<gcda:postalCode>
								<xsl:for-each select="node()[fn:boolean(self::text())]">
									<xsl:sequence select="fn:string(.)" />
								</xsl:for-each>
							</gcda:postalCode>
						</xsl:for-each>
					</BirthPlace>
				</xsl:for-each>
			</PersonalInformation>
		</PersonInformation>
	</xsl:template>
</xsl:stylesheet>