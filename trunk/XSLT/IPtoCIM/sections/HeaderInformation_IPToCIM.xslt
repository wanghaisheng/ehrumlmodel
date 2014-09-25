<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn" xmlns:sdtc="urn:hl7-org:sdtc"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../templates.xslt" />

	<xsl:template name="headerInformationSection">
		<xsl:param name="clinicalDocument" />
		<xsl:for-each select="$clinicalDocument/cda:id">
			<xsl:call-template name="idII">
				<xsl:with-param name="idII" select="." as="node()" />
				<xsl:with-param name="elementName" select="'SummaryID'" />
			</xsl:call-template>
		</xsl:for-each>

		<xsl:for-each select="$clinicalDocument/cda:effectiveTime">
			<xsl:call-template name="tsTS">
				<xsl:with-param name="tsTS" select="." as="node()" />
				<xsl:with-param name="elementName" select="'DocumentTimeStamp'" />
			</xsl:call-template>
		</xsl:for-each>

		<ServiceEvent>
			<xsl:for-each
				select="$clinicalDocument/cda:documentationOf/cda:serviceEvent/cda:id">
				<xsl:call-template name="idII">
					<xsl:with-param name="idII" select="." as="node()" />
					<xsl:with-param name="elementName" select="'EncounterID'" />
				</xsl:call-template>
			</xsl:for-each>
	
			<xsl:for-each
				select="$clinicalDocument/cda:documentationOf/cda:serviceEvent/cda:effectiveTime">
				<xsl:call-template name="ivlTS">
					<xsl:with-param name="ivlTS" select="." as="node()" />
					<xsl:with-param name="elementName" select="'EncounterDate'" />
				</xsl:call-template>
			</xsl:for-each>
		</ServiceEvent>
		
		<xsl:for-each select="$clinicalDocument/cda:confidentialityCode">
			<xsl:call-template name="codeCE">
				<xsl:with-param name="code" select="." as="node()" />
				<xsl:with-param name="elementName" select="'ConfidentialityStatus'" />
			</xsl:call-template>
		</xsl:for-each>
		
		<xsl:for-each select="$clinicalDocument/cda:languageCode">
			<xsl:call-template name="codeCE">
				<xsl:with-param name="code" select="." as="node()" />
				<xsl:with-param name="elementName" select="'LanguageCode'" />
			</xsl:call-template>
		</xsl:for-each>

		<xsl:for-each select="$clinicalDocument/cda:author">
			<AuthorInformation>
				<xsl:for-each select="cda:time">
					<xsl:call-template name="tsTS">
						<xsl:with-param name="tsTS" select="." as="node()" />
						<xsl:with-param name="elementName" select="'AuthorTime'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:assignedAuthor/cda:assignedPerson/cda:name">
					<xsl:call-template name="personName">
						<xsl:with-param name="personName" select="." as="node()" />
						<xsl:with-param name="elementName" select="'AuthorName'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:assignedAuthor/cda:id">
					<xsl:call-template name="idII">
						<xsl:with-param name="idII" select="." as="node()" />
						<xsl:with-param name="elementName" select="'AuthorID'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:assignedAuthor/cda:addr">
					<xsl:call-template name="address">
						<xsl:with-param name="address" select="." as="node()" />
						<xsl:with-param name="elementName" select="'AuthorAddress'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:assignedAuthor/cda:telecom">
					<xsl:call-template name="telecom">
						<xsl:with-param name="telecom" select="." as="node()" />
						<xsl:with-param name="elementName" select="'AuthorContact'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:assignedAuthor/cda:code">
					<xsl:call-template name="codeCE">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'AuthorCode'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:assignedAuthor/cda:representedOrganization">
					<xsl:call-template name="organization">
						<xsl:with-param name="organization" select="." as="node()" />
						<xsl:with-param name="elementName" select="'AuthorOrganization'" />
					</xsl:call-template>
				</xsl:for-each>
			</AuthorInformation>
		</xsl:for-each>

		<xsl:for-each select="$clinicalDocument/cda:informant">
			<InformantInformation>
				<xsl:for-each select="cda:assignedEntity">
					<AssignedInformant>
						<xsl:for-each select="cda:assignedPerson/cda:name">
							<xsl:call-template name="personName">
								<xsl:with-param name="personName" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:name'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:id">
							<xsl:call-template name="idII">
								<xsl:with-param name="idII" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:id'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:addr">
							<xsl:call-template name="address">
								<xsl:with-param name="address" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:address'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:telecom">
							<xsl:call-template name="telecom">
								<xsl:with-param name="telecom" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:contact'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:code">
							<xsl:call-template name="codeCD">
								<xsl:with-param name="code" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:code'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:representedOrganization">
							<xsl:call-template name="organization">
								<xsl:with-param name="organization" select="."
									as="node()" />
								<xsl:with-param name="elementName"
									select="'gcda:representedOrganization'" />
							</xsl:call-template>
						</xsl:for-each>
					</AssignedInformant>
				</xsl:for-each>
				<xsl:for-each select="cda:relatedEntity">
					<RelatedInformant>
						<xsl:for-each select="cda:relatedPerson/cda:name">
							<xsl:call-template name="personName">
								<xsl:with-param name="personName" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:name'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:addr">
							<xsl:call-template name="address">
								<xsl:with-param name="address" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:address'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:telecom">
							<xsl:call-template name="telecom">
								<xsl:with-param name="telecom" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:contact'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:code">
							<xsl:call-template name="codeCD">
								<xsl:with-param name="code" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:code'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:effectiveTime">
							<xsl:call-template name="ivlTS">
								<xsl:with-param name="ivlTS" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:effectiveTime'" />
							</xsl:call-template>
						</xsl:for-each>
					</RelatedInformant>
				</xsl:for-each>
			</InformantInformation>
		</xsl:for-each>

		<xsl:for-each
			select="$clinicalDocument/cda:custodian/cda:assignedCustodian/cda:representedCustodianOrganization">
			<xsl:call-template name="organization">
				<xsl:with-param name="organization" select="." as="node()" />
				<xsl:with-param name="elementName" select="'CustodianInformation'" />
			</xsl:call-template>
		</xsl:for-each>

		<xsl:for-each select="$clinicalDocument/cda:recordTarget/cda:patientRole">
			<PersonInformation>
				<xsl:for-each select="cda:id">
					<xsl:call-template name="idII">
						<xsl:with-param name="idII" select="." as="node()" />
						<xsl:with-param name="elementName" select="'PersonID'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:addr">
					<xsl:call-template name="address">
						<xsl:with-param name="address" select="." as="node()" />
						<xsl:with-param name="elementName" select="'PersonAddress'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:telecom">
					<xsl:call-template name="telecom">
						<xsl:with-param name="telecom" select="." as="node()" />
						<xsl:with-param name="elementName" select="'PersonContact'" />
					</xsl:call-template>
				</xsl:for-each>
				<PersonalInformation>
					<xsl:for-each select="cda:patient/cda:name">
						<xsl:call-template name="personName">
							<xsl:with-param name="personName" select="." as="node()" />
							<xsl:with-param name="elementName" select="'PersonName'" />
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="cda:patient/cda:administrativeGenderCode">
						<xsl:call-template name="codeCE">
							<xsl:with-param name="code" select="." as="node()" />
							<xsl:with-param name="elementName" select="'Gender'" />
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="cda:patient/cda:birthTime">
						<xsl:call-template name="tsTS">
							<xsl:with-param name="tsTS" select="." as="node()" />
							<xsl:with-param name="elementName" select="'PersonDateOfBirth'" />
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="cda:patient/cda:maritalStatusCode">
						<xsl:call-template name="codeCE">
							<xsl:with-param name="code" select="." as="node()" />
							<xsl:with-param name="elementName" select="'MaritalStatus'" />
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="cda:patient/cda:religiousAffiliationCode">
						<xsl:call-template name="codeCE">
							<xsl:with-param name="code" select="." as="node()" />
							<xsl:with-param name="elementName" select="'ReligiousAffiliation'" />
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="cda:patient/cda:raceCode">
						<xsl:call-template name="codeCE">
							<xsl:with-param name="code" select="." as="node()" />
							<xsl:with-param name="elementName" select="'Race'" />
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="cda:patient/cda:ethnicGroupCode">
						<xsl:call-template name="codeCE">
							<xsl:with-param name="code" select="." as="node()" />
							<xsl:with-param name="elementName" select="'Ethnicity'" />
						</xsl:call-template>
					</xsl:for-each>

<!-- 					<MothersMaidenName /> -->
<!-- 					<MultipleBirthIndicator /> -->
<!-- 					<BirthOrder /> -->
<!-- 					<Age /> -->
					<xsl:for-each select="cda:patient/cda:birthplace/cda:place">
						<BirthPlace>
							<xsl:for-each select="cda:name">
								<xsl:call-template name="personName">
									<xsl:with-param name="personName" select="."
										as="node()" />
									<xsl:with-param name="elementName" select="'gcda:placeName'" />
								</xsl:call-template>
							</xsl:for-each>
							<xsl:for-each select="cda:addr">
								<xsl:call-template name="address">
									<xsl:with-param name="address" select="." as="node()" />
									<xsl:with-param name="elementName" select="'gcda:placeAddress'" />
								</xsl:call-template>
							</xsl:for-each>
						</BirthPlace>
					</xsl:for-each>
				</PersonalInformation>
			</PersonInformation>
		</xsl:for-each>
		<xsl:for-each
			select="$clinicalDocument/cda:documentationOf/cda:serviceEvent/cda:performer">
			<Provider>
				<xsl:for-each select="cda:time">
					<xsl:call-template name="ivlTS">
						<xsl:with-param name="ivlTS" select="." as="node()" />
						<xsl:with-param name="elementName" select="'DateRange'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:functionCode">
					<xsl:call-template name="codeCD">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'ProviderRoleCoded'" />
					</xsl:call-template>
				</xsl:for-each>
				<xsl:for-each select="cda:assignedEntity">
					<ProviderEntity>
						<xsl:for-each select="cda:id">
							<xsl:call-template name="idII">
								<xsl:with-param name="idII" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:nationalProviderID'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:code">
							<xsl:call-template name="codeCD">
								<xsl:with-param name="code" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:providerType'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:addr">
							<xsl:call-template name="address">
								<xsl:with-param name="address" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:providerAddress'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:telecom">
							<xsl:call-template name="telecom">
								<xsl:with-param name="telecom" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:providerTelecom'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:assignedPerson/cda:name">
							<xsl:call-template name="personName">
								<xsl:with-param name="personName" select="." as="node()" />
								<xsl:with-param name="elementName" select="'gcda:providerName'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="cda:representedOrganization/cda:name">
							<xsl:call-template name="organizationName">
								<xsl:with-param name="organizationName" select="."
									as="node()" />
								<xsl:with-param name="elementName"
									select="'gcda:providerOrganizationName'" />
							</xsl:call-template>
						</xsl:for-each>						
						<xsl:for-each select="sdtc:patient/sdtc:id">
								<xsl:call-template name="idII">
								<xsl:with-param name="idII" select="." as="node()" />
								<xsl:with-param name="elementName" select="'ProvidersPatientID'" />
							</xsl:call-template>
						</xsl:for-each>						
					</ProviderEntity>					
				</xsl:for-each>
			</Provider>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>