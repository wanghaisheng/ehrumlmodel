<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:template match="*">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="@* | node()" />
		</xsl:element>
	</xsl:template>
	<xsl:template match="@*">
		<xsl:attribute name="{local-name()}">
			<xsl:value-of select="." />
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="Medication-Activity">
		<xsl:param name="context" select="toc:Medication" as="node()"/>
		<substanceAdministration>
			<!--Processing Conformance 7496 and conformance type SHALL -->
			<xsl:attribute name="classCode">SBADM</xsl:attribute>
			<!--Processing Conformance 7497 and conformance type SHALL -->
			<xsl:for-each select="$context/toc:ServiceType">
				<xsl:attribute name="moodCode">
					<xsl:value-of select="." />
				</xsl:attribute>
			</xsl:for-each>
			<!--Processing Conformance 7499 and conformance type SHALL -->
			<templateId>
				<!--Processing Conformance 10504 and conformance type SHALL -->
				<xsl:attribute name="root">2.16.840.1.113883.10.20.22.4.16</xsl:attribute>
			</templateId>
			<!--Processing Conformance 7500 and conformance type SHALL -->
			<xsl:for-each select="$context/toc:MedicationActivityId">
				<id>
					<xsl:apply-templates select="@* | child::*" />
				</id>
			</xsl:for-each>
			<!--Processing Conformance 7506 and conformance type MAY -->
			<xsl:for-each select="$context/toc:DeliveryMethod">
				<code>
					<xsl:apply-templates select="@* | child::*" />
				</code>
			</xsl:for-each>
			<!--Ignored Conformance : 7501 with Conformance type SHOULD -->
			<!--Processing Conformance 7507 and conformance type SHALL -->
			<xsl:for-each select="$context/toc:MedicationActivityStatus">
				<statusCode>
					<xsl:apply-templates select="@* | child::*" />
				</statusCode>
			</xsl:for-each>
			<!--Processing Conformance 7508 and conformance type SHALL -->
			<xsl:for-each select="$context/toc:MedicationActivityTime">
				<effectiveTime>
					<!--Processing Conformance 9104 and conformance type SHALL -->
					<xsl:attribute name="xsi:type">IVL_TS</xsl:attribute>
					<!--Ignored Conformance : 7511 with Conformance type SHALL -->
					<xsl:apply-templates select="@* | child::*" />
				</effectiveTime>
			</xsl:for-each>
			<!--Processing Conformance 7513 and conformance type SHOULD -->
			<xsl:for-each select="$context/toc:AdministrationTiming">
				<effectiveTime>
					<!--Processing Conformance 9106 and conformance type SHALL -->
					<xsl:attribute name="operator">A</xsl:attribute>
					<xsl:apply-templates select="@* | child::*" />
				</effectiveTime>
			</xsl:for-each>
			<!--Ignored Conformance : 7555 with Conformance type MAY -->
			<!--Processing Conformance 7514 and conformance type MAY -->
			<xsl:for-each select="$context/toc:Route">
				<routeCode>
					<xsl:apply-templates select="@* | child::*" />
				</routeCode>
			</xsl:for-each>
			<!--Processing Conformance 7515 and conformance type MAY -->
			<xsl:for-each select="$context/toc:Site">
				<approachSiteCode>
					<xsl:apply-templates select="@* | child::*" />
				</approachSiteCode>
			</xsl:for-each>
			<!--Processing Conformance 7516 and conformance type SHOULD -->
			<xsl:for-each select="$context/toc:Dose">
				<doseQuantity>
					<!--Processing Conformance 7526 and conformance type SHOULD -->
					<!--Ignored Conformance : 7526 with Conformance type SHOULD -->
					<xsl:apply-templates select="@*" />
				</doseQuantity>
			</xsl:for-each>
			<!--Ignored Conformance : 7517 with Conformance type MAY -->
			<!--Processing Conformance 7518 and conformance type MAY -->
			<xsl:for-each select="$context/toc:DoseRestriction">
				<maxDoseQuantity>
					<xsl:apply-templates select="@*" />
				</maxDoseQuantity>
			</xsl:for-each>
			<!--Processing Conformance 7519 and conformance type MAY -->
			<xsl:for-each select="$context/toc:ProductForm">
				<administrationUnitCode>
					<xsl:apply-templates select="@* | child::*" />
				</administrationUnitCode>
			</xsl:for-each>
			<!--Processing Conformance 7520 and conformance type SHALL -->
			<consumable>
				<!--Processing Conformance 7521 and conformance type SHALL -->
				<xsl:call-template name="Medication-Information">
					<xsl:with-param name="subContext"
						select="$context/toc:MedicationInformation" />
				</xsl:call-template>
			</consumable>
			<!--Ignored Conformance : 7522 with Conformance type MAY -->
			<!--Processing Conformance 7523 and conformance type MAY -->
			<xsl:if test="toc:Medication/toc:Vehicle">
				<participant>
					<!--Processing Conformance 7524 and conformance type SHALL -->
					<xsl:attribute name="typeCode">CSM</xsl:attribute>
					<!--Processing Conformance 7535 and conformance type SHALL -->
					<xsl:call-template name="Drug-Vehicle">
						<xsl:with-param name="context" select="toc:Medication/toc:Vehicle" />
					</xsl:call-template>
				</participant>
			</xsl:if>
			<!--Ignored Conformance 7536 and conformance type MAY -->
			
			<!--Processing Conformance 7539 and conformance type MAY -->
			<xsl:if test="toc:Medication/toc:PatientInstructions">
				<entryRelationship>
					<!--Processing Conformance 7540 and conformance type SHALL -->
					<xsl:attribute name="typeCode">SUBJ</xsl:attribute>
					<!--Processing Conformance 7542 and conformance type SHALL -->
					<xsl:attribute name="inversionInd">true</xsl:attribute>
					<!--Processing Conformance 7541 and conformance type SHALL -->
					<xsl:call-template name="Instructions">
						<xsl:with-param name="context"
							select="toc:Medication/toc:PatientInstructions" />
					</xsl:call-template>
				</entryRelationship>
			</xsl:if>
			<!--Ignored Conformance 7543 and conformance type MAY -->
			<!--Ignored Conformance 7549 and conformance type MAY -->
			<!--Ignored Conformance 7552 and conformance type MAY -->
			<!--Ignored Conformance : 7546 with Conformance type MAY -->
		</substanceAdministration>
	</xsl:template>
	<xsl:template name="Drug-Vehicle">
		<xsl:param name="context" select="toc:Medication/toc:Vehicle" />
		<participantRole>
			<!--Processing Conformance 7490 and conformance type SHALL -->
			<xsl:attribute name="classCode">MANU</xsl:attribute>
			<!--Processing Conformance 7495 and conformance type SHALL -->
			<templateId>
				<!--Processing Conformance 10493 and conformance type SHALL -->
				<xsl:attribute name="root">2.16.840.1.113883.10.20.22.4.24</xsl:attribute>
			</templateId>
			<!--Processing Conformance 7491 and conformance type SHALL -->
			<code>
				<!--Processing Conformance 7491 and conformance type SHALL -->
				<xsl:attribute name="code">412307009</xsl:attribute>
				<!--Processing Conformance 7491 and conformance type SHALL -->
				<xsl:attribute name="codeSystem">2.16.840.1.113883.6.96</xsl:attribute>
			</code>
			<!--Processing Conformance 7492 and conformance type SHALL -->
			<playingEntity>
				<!--Processing Conformance 7493 and conformance type SHALL -->
				<xsl:for-each select="$context">
					<code>
						<xsl:apply-templates select="@* | child::*" />
					</code>
				</xsl:for-each>
			</playingEntity>
		</participantRole>
	</xsl:template>
	<xsl:template name="Instructions">
		<xsl:param name="context" select="toc:Medication/toc:PatientInstructions" />
		<act>
			<!--Processing Conformance 7391 and conformance type SHALL -->
			<xsl:attribute name="classCode">ACT</xsl:attribute>
			<!--Processing Conformance 7392 and conformance type SHALL -->
			<xsl:attribute name="moodCode">INT</xsl:attribute>
			<!--Processing Conformance 7393 and conformance type SHALL -->
			<templateId>
				<!--Processing Conformance 10503 and conformance type SHALL -->
				<xsl:attribute name="root">2.16.840.1.113883.10.20.22.4.20</xsl:attribute>
			</templateId>
			<!--Processing Conformance 7394 and conformance type SHALL -->
			<xsl:for-each select="$context">
				<code>
					<xsl:apply-templates select="@* | child::*" />
				</code>
			</xsl:for-each>
			<!--Ignored Conformance : 7395 with Conformance type SHOULD -->
			<!--Processing Conformance 7396 and conformance type SHALL -->
			<statusCode>
				<!--Processing Conformance 7396 and conformance type SHALL -->
				<xsl:attribute name="code">completed</xsl:attribute>
			</statusCode>
		</act>
	</xsl:template>
	<xsl:template name="Medication-Information">
		<xsl:param name="subContext" select="toc:MedicationInformation" />
		<manufacturedProduct>
			<!--Processing Conformance 7408 and conformance type SHALL -->
			<xsl:attribute name="classCode">MANU</xsl:attribute>
			<!--Processing Conformance 7409 and conformance type SHALL -->
			<templateId>
				<!--Processing Conformance 10506 and conformance type SHALL -->
				<xsl:attribute name="root">2.16.840.1.113883.10.20.22.4.23</xsl:attribute>
			</templateId>
			<!--Ignored Conformance : 7410 with Conformance type MAY -->
			<!--Processing Conformance 7411 and conformance type SHALL -->
			<manufacturedMaterial>
				<!--Processing Conformance 7412 and conformance type SHALL -->
				<xsl:for-each select="$subContext/toc:CodedProductName">
					<code>
						<!--Ignored Conformance 7413 and conformance type SHOULD -->
						<!--Processing Conformance 7417 and conformance type SHOULD -->
						<!--Processing Conformance 7417 and conformance type SHOULD -->
						<!--Ignored Conformance : 7417 with Conformance type SHOULD -->
						<xsl:apply-templates select="@* | child::*" />
					</code>
				</xsl:for-each>
			</manufacturedMaterial>
			<!--Processing Conformance 7416 and conformance type MAY -->
		</manufacturedProduct>
	</xsl:template>
</xsl:stylesheet>