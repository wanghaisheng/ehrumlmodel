<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../templates.xslt" />

	<xsl:template name="dischargeDiagnosisSectionCCDA">
		<xsl:param name="dischargeDiagnosisSection" />
		<xsl:param name="srcMnemonic" />
		<DischargeDiagnosis>
			<xsl:if test="fn:exists($dischargeDiagnosisSection/cda:text)">
			    <Text>
					<xsl:apply-templates select="$dischargeDiagnosisSection/cda:text/node()" />
				</Text>
			</xsl:if>
			<xsl:if test="$dischargeDiagnosisSection/cda:entry">
			<Conditions>
				<xsl:if
					test="(($srcMnemonic and ($srcMnemonic='DS_L3')) or ($srcMnemonic and ($srcMnemonic='CCDA_TOC_DS_L3')))">
					<xsl:for-each select="$dischargeDiagnosisSection/cda:entry">
						<xsl:variable name="var552_act" as="node()?"
							select="cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.33']" />

						<Condition>
							<Role>
								<xsl:for-each
									select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']">
									<xsl:variable name="var_classCode" as="item()*"
										select="@classCode" />
									<xsl:value-of select="$var_classCode" />
								</xsl:for-each>
							</Role>
							
							<ConcernStatus>
								<xsl:attribute name="code" namespace=""
									select="$var552_act/cda:statusCode/@code" />
							</ConcernStatus>

							<xsl:for-each select="$var552_act/cda:effectiveTime">
								<xsl:call-template name="ivlTS">
									<xsl:with-param name="ivlTS" select="." as="node()" />
									<xsl:with-param name="elementName" select="'ConcernDuration'" />
								</xsl:call-template>
							</xsl:for-each>

							<xsl:for-each
								select="$var552_act/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.5']/cda:value">
								<xsl:call-template name="valueCD">
									<xsl:with-param name="value" select="." as="node()" />
									<xsl:with-param name="elementName" select="'HealthStatus'" />
								</xsl:call-template>
							</xsl:for-each>

							<xsl:for-each
								select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:effectiveTime">
								<xsl:call-template name="ivlTS">
									<xsl:with-param name="ivlTS" select="." as="node()" />
									<xsl:with-param name="elementName" select="'ProblemDate'" />
								</xsl:call-template>
							</xsl:for-each>

							<!-- Problem Observation ID -->
							<xsl:for-each
								select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:id">
								<xsl:call-template name="idII">
									<xsl:with-param name="idII" select="." as="node()" />
									<xsl:with-param name="elementName" select="'ProblemObservationID'" />
								</xsl:call-template>
							</xsl:for-each>

							<!-- TODO: Figure this out when we actually implement narrative block -->
							<xsl:for-each select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:text/cda:reference/@value">
								<ProblemName><xsl:value-of select="substring-after(.,'#')"/></ProblemName>
							</xsl:for-each>

							<xsl:for-each
								select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:code">
								<xsl:call-template name="codeCD">
									<xsl:with-param name="code" select="." as="node()" />
									<xsl:with-param name="elementName" select="'ProblemType'" />
								</xsl:call-template>
							</xsl:for-each>

							<xsl:for-each
								select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:value">
								<xsl:call-template name="valueCD">
									<xsl:with-param name="value" select="." as="node()" />
									<xsl:with-param name="elementName" select="'ProblemCode'" />
								</xsl:call-template>
							</xsl:for-each>

							<!-- ageAtOnset -->
							<xsl:for-each
								select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.31']/cda:value">
								<xsl:variable name="var_ageAtonSet" as="item()*"
									select="@value" />
								<xsl:if test="fn:exists($var_ageAtonSet)">
									<AgeatOnset>
										<xsl:attribute name="value" select="@value" />
										<xsl:attribute name="unit" select="@unit" />
										<!-- <xsl:sequence select="xs:string(xs:integer(fn:string($var_ageAtonSet)))" 
											/> -->
									</AgeatOnset>
								</xsl:if>
							</xsl:for-each>

							<!-- Problem Status -->
							<xsl:for-each
								select="$var552_act/cda:entryRelationship[@typeCode='SUBJ']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.4']/cda:entryRelationship/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.6']/cda:value">
								<xsl:call-template name="valueCE">
									<xsl:with-param name="value" select="." as="node()" />
									<xsl:with-param name="elementName" select="'ProblemStatus'" />
								</xsl:call-template>
							</xsl:for-each>

						</Condition>
					</xsl:for-each>
				</xsl:if>
			</Conditions>
			</xsl:if>
		</DischargeDiagnosis>
	</xsl:template>
</xsl:stylesheet>