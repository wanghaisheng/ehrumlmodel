<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps.xslt"/>
    <xsl:import href="../constants.xslt"/>
    <xsl:import href="../modules/Immunization.xslt"/>
    <xsl:import href="../modules/Encounter.xslt"/>
    <xsl:import href="../modules/Procedure.xslt"/>
    <xsl:import href="../modules/Medication.xslt"/>
    <xsl:template name="planofcare">
        <xsl:param name="planofcare"/>
        
        			<xsl:for-each select="$planofcare">
						<xsl:variable name="var184" as="node()" select="."/>
						<component>
							<section>
                                <templateId>
                                    <xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.3.88.11.83.124'"/>
                                </templateId>
                                <templateId>
                                    <xsl:attribute name="root" namespace="" select="'1.3.6.1.4.1.19376.1.5.3.1.3.31'"/>
                                </templateId>
                                <templateId>
                                    <xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.10.20.2.7'"/>
                                </templateId>
                                <templateId>
                                    <xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.10.20.1.10'"/>
                                </templateId>
                                <code>
                                    <xsl:attribute name="code" namespace="" select="'18776-5'"/>
                                    <xsl:attribute name="codeSystem" namespace="" select="$var1"/>
                                    <xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
                                    <xsl:attribute name="displayName" namespace="" select="'Treatment Plan'"/>
                                </code>
                                <title>
                                    <xsl:sequence select="'Plan of Care'"/>
                                </title>
                                <xsl:if test="fn:exists($planofcare/toc:Text)">
					                <text>
					                 	<xsl:apply-templates select="toc:Text/node()"/>
					                    <!-- <xsl:for-each select="$planofcare/toc:Text">
					                        <xsl:for-each select="node()[./self::text()]">
					                            <xsl:sequence select="fn:string(.)"/>
					                        </xsl:for-each>
					                    </xsl:for-each> -->
					                </text>
				                </xsl:if>
								<xsl:for-each select="toc:Encounters/toc:Encounter">
                                    <xsl:call-template name="encounter">
                                        <xsl:with-param name="encounter" select="(self::node())"></xsl:with-param>
                                        <xsl:with-param name="whereFrom" select="'poc'" />
                                    </xsl:call-template>
								</xsl:for-each>
                                <xsl:for-each select="toc:Medications/toc:Medication">
				                    <xsl:call-template name="medication">
				                        <xsl:with-param name="medication" select="(self::node())"></xsl:with-param>
                                        <xsl:with-param name="whereFrom" select="'poc'" />
				                    </xsl:call-template>
                                </xsl:for-each>
                                <xsl:for-each select="toc:Immunizations/toc:Immunization">
					                <xsl:call-template name="immunization">
					                   <xsl:with-param name="immunization" select="(self::node())"></xsl:with-param>
                                       <xsl:with-param name="whereFrom" select="'poc'" />
					                </xsl:call-template>
                                </xsl:for-each>
                                <xsl:for-each select="toc:Procedures/toc:Procedure">
                                    <xsl:call-template name="procedure">
                                        <xsl:with-param name="procedure" select="(self::node())"></xsl:with-param>
                                        <xsl:with-param name="whereFrom" select="'poc'" />
                                    </xsl:call-template>
                                </xsl:for-each>
							</section>
						</component>
					</xsl:for-each>
        
    </xsl:template>
</xsl:stylesheet>
