<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../templates.xslt" />

	<xsl:template name="advanceDirectivesSectionCCDA">
		<xsl:param name="advanceDirectivesSection" />
		<xsl:param name="srcMnemonic" />
		<AdvanceDirectives>
			<Text>
				<xsl:apply-templates select="$advanceDirectivesSection/cda:text/node()" />
			</Text>
			<xsl:for-each
				select="$advanceDirectivesSection/cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.48']">
				<AdvanceDirective>
					<!-- Observation Directive ID -->
					<xsl:for-each select="cda:id">
						<xsl:call-template name="idII">
							<xsl:with-param name="idII" select="." as="node()" />
							<xsl:with-param name="elementName" select="'ObservationDirectiveID'" />
						</xsl:call-template>
					</xsl:for-each>

					<xsl:for-each select="cda:code">
						<xsl:call-template name="codeCD">
							<xsl:with-param name="code" select="." as="node()" />
							<xsl:with-param name="elementName" select="'Type'" />
						</xsl:call-template>
					</xsl:for-each>

					<xsl:for-each select="cda:value">
						<xsl:call-template name="valueCD">
							<xsl:with-param name="value" select="." as="node()" />
							<xsl:with-param name="elementName" select="'Value'" />
						</xsl:call-template>
					</xsl:for-each>

					<xsl:for-each select="cda:effectiveTime">
						<xsl:call-template name="ivlTS">
							<xsl:with-param name="ivlTS" select="." as="node()" />
							<xsl:with-param name="elementName" select="'EffectiveDate'" />
						</xsl:call-template>
					</xsl:for-each>

					<Status>
						<xsl:attribute name="code" namespace=""
							select="cda:statusCode/@code" />
						<xsl:attribute name="codeSystem" namespace=""
							select="'2.16.840.1.113883.6.96'" />
					</Status>

					<xsl:for-each
						select="cda:participant[@typeCode='VRF'][cda:templateId/@root='2.16.840.1.113883.10.20.1.58']">
						<DocumentCustodian>
							<gcda:ParticipationType>
								<xsl:sequence select="'Verifier'" />
							</gcda:ParticipationType>
							<xsl:for-each select="cda:participantRole/cda:id">
								<xsl:call-template name="idII">
									<xsl:with-param name="idII" select="." as="node()" />
									<xsl:with-param name="elementName" select="'gcda:organizationID'" />
								</xsl:call-template>
							</xsl:for-each>
							<xsl:for-each select="cda:participantRole/cda:playingEntity/cda:name">
								<xsl:call-template name="organizationName">
									<xsl:with-param name="organizationName" select="."
										as="node()" />
									<xsl:with-param name="elementName" select="'gcda:organizationName'" />
								</xsl:call-template>
							</xsl:for-each>
						</DocumentCustodian>
					</xsl:for-each>

					<xsl:for-each
						select="cda:participant[@typeCode='CST']/cda:participantRole[@classCode='AGNT']">
						<DocumentCustodian>
							<gcda:ParticipationType>
								<xsl:sequence select="'Custodian'" />
							</gcda:ParticipationType>
							<xsl:for-each select="cda:addr">
								<xsl:call-template name="address">
									<xsl:with-param name="address" select="." as="node()" />
									<xsl:with-param name="elementName"
										select="'gcda:organizationAddress'" />
								</xsl:call-template>
							</xsl:for-each>
							<xsl:for-each select="cda:telecom">
								<xsl:call-template name="telecom">
									<xsl:with-param name="telecom" select="." as="node()" />
									<xsl:with-param name="elementName"
										select="'gcda:organizationTelecom'" />
								</xsl:call-template>
							</xsl:for-each>
							<xsl:for-each select="cda:playingEntity/cda:name">
								<xsl:call-template name="organizationName">
									<xsl:with-param name="organizationName" select="."
										as="node()" />
									<xsl:with-param name="elementName" select="'gcda:organizationName'" />
								</xsl:call-template>
							</xsl:for-each>
						</DocumentCustodian>
					</xsl:for-each>

				</AdvanceDirective>
			</xsl:for-each>
		</AdvanceDirectives>
	</xsl:template>
</xsl:stylesheet>