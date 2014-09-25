<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt" />
	<xsl:import href="../narratives_ccda.xslt" />

	<xsl:template name="advanceDirectivesCCDA">
		<xsl:param name="advanceDirectives" />
		<xsl:param name="mnemonic" />
		<component>
			<section>
				<templateId root="2.16.840.1.113883.10.20.22.2.21" />
				<code code="42348-3" codeSystem="2.16.840.1.113883.6.1" />
				<title>
					<xsl:sequence select="'Advance Directives'" />
				</title>
				<xsl:choose>
					<xsl:when test="fn:exists($advanceDirectives/toc:Text)">
						<text>
							<xsl:apply-templates select="$advanceDirectives/toc:Text/node()" />
						</text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="advanceDirectivesNarrative">
							<xsl:with-param name="advanceDirectives" select="$advanceDirectives" />
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:for-each select="$advanceDirectives/toc:AdvanceDirective">
					<entry>
						<observation>
							<xsl:attribute name="classCode" namespace=""
								select="'OBS'" />
							<xsl:attribute name="moodCode" namespace="" select="'EVN'" />
							<templateId root="2.16.840.1.113883.10.20.22.4.48" />
							<xsl:for-each select="toc:ObservationDirectiveID">
								<xsl:call-template name="idII">
									<xsl:with-param name="idII" select="." as="node()" />
								</xsl:call-template>
							</xsl:for-each>
							<xsl:choose>
								<xsl:when test="fn:exists(toc:Type/@code)">
									<xsl:for-each select="toc:Type">
										<xsl:call-template name="codeCD">
											<xsl:with-param name="code" select="." as="node()" />
											<xsl:with-param name="elementName" select="'code'" />
										</xsl:call-template>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<code nullFlavor="NA" />
								</xsl:otherwise>
							</xsl:choose>
							<statusCode>
								<xsl:if test="fn:exists(toc:Status/@code)">
									<xsl:attribute name="code" namespace=""
										select="toc:Status/@code" />
								</xsl:if>
							</statusCode>
							<xsl:for-each select="toc:EffectiveDate">
								<xsl:call-template name="ivlTS">
									<xsl:with-param name="ivlTS" select="." as="node()" />
									<xsl:with-param name="elementName" select="'effectiveTime'" />
								</xsl:call-template>
							</xsl:for-each>
							<xsl:for-each select="toc:Value">
								<xsl:call-template name="valueCD">
									<xsl:with-param name="value" select="." as="node()" />
								</xsl:call-template>
							</xsl:for-each>

							<xsl:for-each select="toc:DocumentCustodian">
								<xsl:if test="fn:exists(gcda:ParticipationType)">
									<xsl:if test="gcda:ParticipationType = 'Verifier'">
										<participant>
											<xsl:attribute name="typeCode" namespace=""
												select="'VRF'" />
											<templateId root="2.16.840.1.113883.10.20.1.58" />
											<participantRole>
												<xsl:for-each select="gcda:organizationID">
													<xsl:call-template name="idII">
														<xsl:with-param name="idII" select="." as="node()" />
													</xsl:call-template>
												</xsl:for-each>
												<xsl:if test="fn:exists(gcda:organizationName)">
													<playingEntity>
														<xsl:for-each select="gcda:organizationName">
															<xsl:call-template name="organizationName">
																<xsl:with-param name="organizationName"
																	select="." as="node()" />
															</xsl:call-template>
														</xsl:for-each>
													</playingEntity>
												</xsl:if>
											</participantRole>
										</participant>
									</xsl:if>
									<xsl:if test="gcda:ParticipationType = 'Custodian'">
										<participant>
											<xsl:attribute name="typeCode" namespace=""
												select="'CST'" />
											<participantRole>
												<xsl:attribute name="classCode" namespace=""
													select="'AGNT'" />

												<xsl:for-each select="gcda:organizationAddress">
													<xsl:call-template name="address">
														<xsl:with-param name="address" select="."
															as="node()" />
													</xsl:call-template>
												</xsl:for-each>
												<xsl:for-each select="gcda:organizationTelecom">
													<xsl:call-template name="telecom">
														<xsl:with-param name="telecom" select="."
															as="node()" />
													</xsl:call-template>
												</xsl:for-each>
												<!-- <xsl:if test="fn:exists(gcda:organizationName)"> -->
												<playingEntity>
													<!-- <xsl:for-each select="gcda:organizationName"> <xsl:call-template 
														name="organizationName"> <xsl:with-param name="organizationName" select="." 
														as="node()" /> </xsl:call-template> </xsl:for-each> -->
													<xsl:for-each select="gcda:organizationName/gcda:prefix">
														<xsl:call-template name="organizationName">
															<xsl:with-param name="organizationName"
																select="." as="node()" />
														</xsl:call-template>
													</xsl:for-each>
													<xsl:for-each select="gcda:organizationName/gcda:family">
														<xsl:call-template name="organizationName">
															<xsl:with-param name="organizationName"
																select="." as="node()" />
														</xsl:call-template>
													</xsl:for-each>
													<xsl:for-each select="gcda:organizationName/gcda:given">
														<xsl:call-template name="organizationName">
															<xsl:with-param name="organizationName"
																select="." as="node()" />
														</xsl:call-template>
													</xsl:for-each>
												</playingEntity>
												<!-- </xsl:if> -->
											</participantRole>
										</participant>
									</xsl:if>
								</xsl:if>
							</xsl:for-each>

						</observation>
					</entry>
				</xsl:for-each>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>