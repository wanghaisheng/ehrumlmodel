<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps.xslt"/>    

    <xsl:template name="immunization">
        <xsl:param name="immunization"/>
        <xsl:param name="whereFrom"/>
		<xsl:variable name="var378_select_refusalInd" as="item()*" select="$immunization/@RefusalInd"/>

        <xsl:variable name="moodCode">
            <xsl:choose>
                <xsl:when test="$whereFrom and ($whereFrom = 'poc')">
                    <xsl:value-of select="'INT'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'EVN'"/>
                </xsl:otherwise> 
            </xsl:choose>
        </xsl:variable>
        
		<entry>
			<substanceAdministration classCode="SBADM">
                <xsl:attribute name="moodCode" namespace="" select="$moodCode"/>
			    <xsl:choose>
				<xsl:when test="fn:exists($var378_select_refusalInd)">
					<xsl:attribute name="negationInd" namespace="" select="xs:string(xs:boolean(fn:string($var378_select_refusalInd)))"/>
				</xsl:when>
				<xsl:otherwise>
                    <xsl:attribute name="negationInd" namespace="" select="xs:string(false())"/>
				</xsl:otherwise>
				</xsl:choose>
				<templateId root="2.16.840.1.113883.10.20.1.24"/>
				 <!-- ERROR : CONF-MDHT-152 -->
				<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.12"/>
				<templateId root="2.16.840.1.113883.3.88.11.83.13"/>
				<!-- <id nullFlavor="NI"/> -->
				<id root="2.16.840.1.113883.3.1275" extension="20"/>
				<code code="IMMUNIZ" codeSystem="2.16.840.1.113883.5.4" codeSystemName="ActCode" />
				<!--  text/reference -->
				<xsl:for-each select="$immunization/toc:Text">
	                <text>
		               <!--  <xsl:for-each select="node()[./self::text()]">
		                       <xsl:sequence select="fn:string(.)"/>
		                </xsl:for-each> -->
		               <xsl:apply-templates select="node()"/>
					</text>
				</xsl:for-each>
				
<!--            <code code="82" displayName="History of immunizations" codeSystem="2.16.840.1.114222.4.11.934"/> -->
                <!--ERROR : CONF-307 MDHT throws it as SHALL CCD says it as SHOULD -->
				<statusCode code="completed"/>
				<xsl:for-each select="$immunization/toc:AdministeredDate">
                    <xsl:call-template name="tsTS">
                        <xsl:with-param name="tsTS" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'effectiveTime'" />
                    </xsl:call-template>
                </xsl:for-each>
				<consumable>
					<xsl:for-each select="$immunization/toc:MedicationInformation">
                        <xsl:call-template name="mapMedicationInformation">
                            <xsl:with-param name="medicationInformation" as="node()">
                                <xsl:sequence select="." />
                            </xsl:with-param>
                        </xsl:call-template>
					</xsl:for-each>
				</consumable>
				<xsl:for-each select="$immunization/toc:Provider">
					<performer>
						<assignedEntity>
                        <!-- NOTE : need to set as parameter -->
                            <id root="2.16.840.1.113883.3.1275"/>
	                        <xsl:call-template name="organization">
	                            <xsl:with-param name="organization" select="." as="node()" />
	                            <xsl:with-param name="elementName" select="'representedOrganization'"/>
	                        </xsl:call-template>
						</assignedEntity>
					</performer>
				</xsl:for-each>
				<xsl:for-each select="$immunization/toc:MedicationSeriesNumber">
					<entryRelationship typeCode="SUBJ">
                        <observation classCode="OBS" moodCode="EVN">
	                        <code/>
		                    <xsl:call-template name="valuePQ">
		                        <xsl:with-param name="value" select="." as="node()" />
		                    </xsl:call-template>
						</observation>
					</entryRelationship>
				</xsl:for-each>
				<xsl:for-each select="$immunization/toc:Reaction">
					<entryRelationship typeCode="CAUS">
						<observation classCode="OBS" moodCode="EVN">
							<templateId root="2.16.840.1.113883.10.20.1.54"/>
		                    <xsl:call-template name="codeCD">
		                        <xsl:with-param name="code" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'code'" />
		                    </xsl:call-template>
							<statusCode code="completed"/>
						</observation>
					</entryRelationship>
				</xsl:for-each>
				<xsl:for-each select="$immunization/toc:RefusalReason">
					<entryRelationship typeCode="RSON">
						<act classCode="ACT" moodCode="EVN">
							<templateId root="2.16.840.1.113883.10.20.1.27"/>
							<!-- <templateId root="2.16.840.1.113883.3.88.11.83.6"/>
							<templateId root="2.16.840.1.113883.3.88.11.83.7"/>
							<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.5.2"/>
							<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.5.1"/>-->
		                    <xsl:call-template name="codeCE">
		                        <xsl:with-param name="code" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'code'" />
		                    </xsl:call-template>
						</act>
					</entryRelationship>
				</xsl:for-each>
			</substanceAdministration>
		</entry>
    </xsl:template>
</xsl:stylesheet>