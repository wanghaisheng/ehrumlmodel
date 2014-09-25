<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt" />
	<!-- ABO血型观察 Observation -->
	<xsl:template name="ABO血型观察">
		<xsl:param name="血型" />
		<xsl:if test="fn:exists($血型/ABO血型代码)">
			<xsl:for-each select="$血型/ABO血型代码">
				<entry>
					<xsl:attribute name="typeCode" select="'DRIV'" />
					<observation classCode="OBS" moodCode="EVN">
						<templateId root="Entry_template_Root_OID.1.1" />
						<code>
							<xsl:attribute name="code" select="'HDSD00.01.013'" />
							<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
						</code>
						<statusCode code="completed" />
						<value>
							<xsl:attribute name="xsi:type"
								namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','CD')" />
							<xsl:attribute name="code" select="$血型/ABO血型代码" />
							<xsl:attribute name="codeSystem" select="'CV04.50.005'" />
							<xsl:attribute name="codeSystemName" select="'ABO血型代码'" />
								<xsl:choose>
									<xsl:when test="fn:exists($血型/ABO血型代码)">
										
										<xsl:attribute name="displayName" select="concat('#', $condition/toc:ProblemName)" />
									</xsl:when>
								</xsl:choose>							
							<xsl:attribute name="" select="@unit" />							
						</value>
					</observation>
				</entry>
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