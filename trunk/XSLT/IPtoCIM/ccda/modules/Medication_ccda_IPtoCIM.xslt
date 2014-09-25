<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn gcda"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:import href="../templates.xslt" />

	<xsl:template name="medicationModuleCCDA">
		<xsl:param name="medicationModule" />

		<xsl:for-each select="$medicationModule">
			<xsl:variable name="var559_entryRelationship" as="node()*"
				select="$medicationModule//cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.16']" />
			<xsl:for-each select="$var559_entryRelationship">
				<xsl:variable name="var_medMoodCode" as="item()*"
					select="@moodCode" />
				<Medication>
					<xsl:for-each select="cda:text">
						<Text>
							<xsl:sequence select="(./@node(), ./node())" />
						</Text>
					</xsl:for-each>
					<xsl:for-each select="cda:id">
						<xsl:call-template name="idII">
							<xsl:with-param name="idII" select="." as="node()" />
							<xsl:with-param name="elementName" select="'MedicationActivityId'" />
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="cda:code">
						<xsl:call-template name="codeCD">
							<xsl:with-param name="code" select="." as="node()" />
							<xsl:with-param name="elementName" select="'DeliveryMethod'" />
						</xsl:call-template>
					</xsl:for-each>
					<!-- ServiceType -->
					<ServiceType>
						<xsl:sequence select="fn:string($var_medMoodCode)" />
					</ServiceType>
					<!-- Decompose mapping for MedicationActivityStatus -->
					<MedicationActivityStatus>
						<xsl:attribute name="code" namespace=""
							select="cda:statusCode/@code" />
					</MedicationActivityStatus>

					<!-- Decompose mapping for MedicationActivityTime -->
					<xsl:for-each select="cda:effectiveTime">
						<xsl:call-template name="ivlTS">
							<xsl:with-param name="ivlTS" select="." as="node()" />
							<xsl:with-param name="elementName" select="'MedicationActivityTime'" />
						</xsl:call-template>
					</xsl:for-each>

					<xsl:for-each select="cda:consumable/cda:manufacturedProduct">
						<xsl:variable name="var669_cur" as="node()" select="." />
						<xsl:for-each select="cda:manufacturedMaterial">
							<xsl:variable name="var631_code" as="node()?"
								select="cda:code" />
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
							</MedicationInformation>
						</xsl:for-each>
					</xsl:for-each>
				</Medication>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>