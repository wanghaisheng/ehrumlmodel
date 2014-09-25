<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt" />
	<xsl:template name="conditionCCDA">
		<xsl:param name="condition" />
		<xsl:param name="idNum" />
		<!-- CONF:7983 -->
		<entry>
			<!-- CONF:7663;CONF:7664 -->
			<act classCode="ACT" moodCode="EVN">
				<!-- CONF:7984 -->
				<templateId root="2.16.840.1.113883.10.20.22.4.33" />
				<!-- CONF:7665 -->
				<code code="11535-2" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC" displayName="HOSPITAL DISCHARGE DIAGNOSIS" />
				<statusCode>
					<xsl:if test="fn:exists(toc:ConcernStatus/@code)">
						<xsl:attribute name="code" namespace=""
							select="toc:ConcernStatus/@code" />
					</xsl:if>
				</statusCode>
				<!-- effectiveTime -->
				<xsl:for-each select="toc:ConcernDuration">
					<xsl:call-template name="ivlTS">
						<xsl:with-param name="ivlTS" select="." as="node()" />
						<xsl:with-param name="elementName" select="'effectiveTime'" />
					</xsl:call-template>
				</xsl:for-each>

				<!-- CONF:7666;CONF:7667 -->
				<entryRelationship typeCode="SUBJ">
					<!-- CONF:9041;CONF:9042 -->
					<observation>
						<xsl:attribute name="classCode" select="$condition/toc:Role" />
						<xsl:attribute name="moodCode" select="'EVN'" />
						<!-- CONF:7669 -->
						<templateId root="2.16.840.1.113883.10.20.22.4.4" />
						<!-- CONF:9043 -->
						<xsl:for-each select="$condition/toc:ProblemObservationID">
							<xsl:call-template name="idII">
								<xsl:with-param name="idII" select="." as="node()" />
							</xsl:call-template>
						</xsl:for-each>
						<!-- CONF:9045 -->
						<xsl:choose>
							<xsl:when test="fn:exists($condition/toc:ProblemType/@code)">
								<xsl:for-each select="$condition/toc:ProblemType">
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


						<!-- Added the text transformation to test the narrative block -->
						<!-- Text/reference value -->
						<text>
							<reference>
								<xsl:choose>
									<xsl:when test="fn:exists($condition/toc:ProblemName)">
										<xsl:attribute name="value" select="concat('#', $condition/toc:ProblemName)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="value" select="concat('#problem-', $idNum)" />
									</xsl:otherwise>
								</xsl:choose>
							</reference>
						</text>

						<!-- CONF:9049 -->
						<statusCode code="completed" />

						<!-- Problem Date -->
						<xsl:if test="fn:exists($condition/toc:ProblemDate)">
							<xsl:for-each select="$condition/toc:ProblemDate">
								<xsl:call-template name="ivlTS">
									<xsl:with-param name="ivlTS" select="." as="node()" />
									<xsl:with-param name="elementName" select="'effectiveTime'" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>

						<!-- CONF:9058 -->
						<xsl:if test="fn:exists($condition/toc:ProblemCode)">
							<xsl:for-each select="$condition/toc:ProblemCode">
								<xsl:call-template name="valueCD">
									<xsl:with-param name="value" select="." as="node()" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>

						<xsl:call-template name="ageObservation">
							<xsl:with-param name="condition" select="$condition"></xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="problemStatusObservation">
							<xsl:with-param name="condition" select="$condition"></xsl:with-param>
							<xsl:with-param name="idNum" select="$idNum"/>
						</xsl:call-template>
						<xsl:call-template name="healthStatusObservation">
							<xsl:with-param name="condition" select="$condition"></xsl:with-param>
							<xsl:with-param name="idNum" select="$idNum"/>
						</xsl:call-template>
					</observation>
				</entryRelationship>
			</act>
		</entry>
	</xsl:template>


	<!-- This covers the ActiveProblems/Condition Active Problems 
		* Problem Concern Act 
		* Problem Observation 
		* Age Observation 
		* Health Status Observation 
		* Problem Status Observation 
		-->
	<xsl:template name="conditionCCDAProblemAct">
		<xsl:param name="condition" />
		<xsl:param name="idNum" />
		<xsl:param name="mnemonic" />
		<!-- <entry typeCode="DRIV"> -->
		<entry>
			<!-- CONF:9024;CONF:9025 -->
			<act classCode="ACT" moodCode="EVN">
				<!-- CONF:9026 -->
				<templateId root="2.16.840.1.113883.10.20.22.4.3" />
				<xsl:for-each select="$condition/toc:ConcernID">
					<xsl:call-template name="idII">
						<xsl:with-param name="idII" select="." as="node()" />
					</xsl:call-template>
				</xsl:for-each>

				<!-- CONF:9027; CONF:9440 -->
				<code code="CONC" codeSystem="2.16.840.1.113883.5.6"/>

				<statusCode>
					<xsl:if test="fn:exists(toc:ConcernStatus/@code)">
						<xsl:attribute name="code" namespace=""
							select="toc:ConcernStatus/@code" />
					</xsl:if>
				</statusCode>
				<!-- effectiveTime -->
				<xsl:for-each select="toc:ConcernDuration">
					<xsl:call-template name="ivlTS">
						<xsl:with-param name="ivlTS" select="." as="node()" />
						<xsl:with-param name="elementName" select="'effectiveTime'" />
					</xsl:call-template>
				</xsl:for-each>

				<!-- Problem Observation -->
				<!-- CONF:7666;CONF:7667 -->
				<entryRelationship typeCode="SUBJ">
					<!-- CONF:9041;CONF:9042 -->
					<observation>
						<xsl:attribute name="classCode" select="$condition/toc:Role" />
						<xsl:attribute name="moodCode" select="'EVN'" />
						<templateId root="2.16.840.1.113883.10.20.22.4.4" />

						<xsl:for-each select="$condition/toc:ProblemObservationID">
							<xsl:call-template name="idII">
								<xsl:with-param name="idII" select="." as="node()" />
							</xsl:call-template>
						</xsl:for-each>

						<!-- Problem Type -->
						<xsl:choose>
							<xsl:when test="fn:exists($condition/toc:ProblemType/@code)">
								<xsl:for-each select="$condition/toc:ProblemType">
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

						<!-- Text/reference value -->
						<text>
							<reference>
								<xsl:choose>
									<xsl:when test="fn:exists($condition/toc:ProblemName)">
										<xsl:attribute name="value" select="concat('#', $condition/toc:ProblemName)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="value" select="concat('#problem-', $idNum)" />
									</xsl:otherwise>
								</xsl:choose>
							</reference>
						</text>

						<statusCode code="completed" />
						<!-- Problem Date -->
						<xsl:if test="fn:exists($condition/toc:ProblemDate)">
							<xsl:for-each select="$condition/toc:ProblemDate">
								<xsl:call-template name="ivlTS">
									<xsl:with-param name="ivlTS" select="." as="node()" />
									<xsl:with-param name="elementName" select="'effectiveTime'" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>

						<!-- Problem Code -->
						<xsl:if test="fn:exists($condition/toc:ProblemCode)">
							<xsl:for-each select="$condition/toc:ProblemCode">
								<xsl:call-template name="valueCD">
									<xsl:with-param name="value" select="." as="node()" />
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>

						<xsl:call-template name="ageObservation">
							<xsl:with-param name="condition" select="$condition"></xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="problemStatusObservation">
							<xsl:with-param name="condition" select="$condition"></xsl:with-param>
							<xsl:with-param name="idNum" select="$idNum"/>
						</xsl:call-template>
						<xsl:call-template name="healthStatusObservation">
							<xsl:with-param name="condition" select="$condition"></xsl:with-param>
							<xsl:with-param name="idNum" select="$idNum"/>
						</xsl:call-template>

					</observation>
				</entryRelationship>
			</act>
		</entry>
	</xsl:template>

	<!-- Age Observation -->
	<xsl:template name="ageObservation">
		<xsl:param name="condition" />
		<xsl:if test="fn:exists($condition/toc:AgeatOnset)">
			<xsl:for-each select="$condition/toc:AgeatOnset">
				<entryRelationship>
					<xsl:attribute name="typeCode" select="'SUBJ'" />
					<xsl:attribute name="inversionInd" select="xs:string(xs:boolean('true'))" />
					<observation classCode="OBS" moodCode="EVN">
						<templateId root="2.16.840.1.113883.10.20.22.4.31" />
						<code>
							<xsl:attribute name="code" select="'445518008'" />
							<xsl:attribute name="codeSystem" select="'2.16.840.1.113883.6.96'" /> 
						</code>
						<statusCode code="completed" />
						<value>
							<xsl:attribute name="type"
								namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','PQ')" />
							<xsl:attribute name="value" select="@value" />
							<xsl:attribute name="unit" select="@unit" />
						</value>
					</observation>
				</entryRelationship>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<!-- Problem Status Observation -->
	<xsl:template name="problemStatusObservation">
		<xsl:param name="condition" />
		<xsl:param name="idNum" />
		<xsl:for-each select="$condition/toc:ProblemStatus">
			<entryRelationship typeCode="REFR">
				<observation classCode="OBS" moodCode="EVN">
					<templateId root="2.16.840.1.113883.10.20.22.4.6" />
					<code code="33999-4" codeSystem="2.16.840.1.113883.6.1"/>
	                 <!-- Text/reference value -->
						<text>
							<reference>
								<xsl:choose>
									<xsl:when test="fn:exists($condition/toc:ProblemName)">
										<xsl:attribute name="value" select="concat('#', $condition/toc:ProblemName)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="value" select="concat('#problem-', $idNum)" />
									</xsl:otherwise>
								</xsl:choose>
							</reference>
						</text>
 					<statusCode code="completed" />
					<xsl:call-template name="valueCD">
						<xsl:with-param name="value" select="$condition/toc:ProblemStatus"
							as="node()" />
					</xsl:call-template>
				</observation>
			</entryRelationship>
		</xsl:for-each>
	</xsl:template>

	<!-- Health Status Observation -->
	<xsl:template name="healthStatusObservation">
		<xsl:param name="condition" />
		<xsl:param name="idNum" />
		<xsl:if test="fn:exists($condition/toc:HealthStatus)">
			<entryRelationship typeCode="REFR">
				<observation classCode="OBS" moodCode="EVN">
					<templateId root="2.16.840.1.113883.10.20.22.4.5" />
					<code code="11323-3" displayName="Health status" codeSystem="2.16.840.1.113883.6.1"
						codeSystemName="LOINC" />
						 <!-- Text/reference value -->
						<text>
							<reference>
								<xsl:choose>
									<xsl:when test="fn:exists($condition/toc:ProblemName)">
										<xsl:attribute name="value" select="concat('#', $condition/toc:ProblemName)" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="value" select="concat('#problem-', $idNum)" />
									</xsl:otherwise>
								</xsl:choose>
							</reference>
						</text>
					<statusCode code="completed" />
					<xsl:for-each select="$condition/toc:HealthStatus">
						<xsl:call-template name="valueCE">
							<xsl:with-param name="value" select="." as="node()" />
						</xsl:call-template>
					</xsl:for-each>
				</observation>
			</entryRelationship>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>