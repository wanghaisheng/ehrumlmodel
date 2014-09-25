<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri"
	xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">
       
	<xsl:import href="../modules/Medication_IPtoCIM.xslt" />
	<xsl:import href="../modules/Encounter_IPtoCIM.xslt"/>
	<xsl:import href="../modules/Procedure_IPtoCIM.xslt"/>
	<xsl:import href="../modules/Immunization_IPtoCIM.xslt"/>
    
    <xsl:template name="planofCareSection">
        <xsl:param name="planofCareSection"/>
			<PlanofCare>				
                  <xsl:for-each select="$planofCareSection/cda:text"> 
                      <Text> 
                      	<xsl:apply-templates select="$planofCareSection/cda:text/node()" />
                  	</Text> 
                  </xsl:for-each>
			<xsl:if test="fn:exists($planofCareSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.8'])">
			<Medications>
                <xsl:call-template name="medicationModule">
					<xsl:with-param name="medicationModule"
						select="$planofCareSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.8']" />
				</xsl:call-template>				
			</Medications>					
			</xsl:if>
				
			<xsl:if test="fn:exists($planofCareSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.13'])">
			<Immunizations>
                <xsl:for-each
                    select="$planofCareSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.13']">
                    <xsl:call-template name="immunizationModule">
                        <xsl:with-param name="immunizationModule" select="(self::node())"/>
                    </xsl:call-template>
                </xsl:for-each>
			</Immunizations>
			</xsl:if>
					
			<xsl:if test="fn:exists($planofCareSection/cda:entry/cda:encounter)">
			<Encounters>
				<xsl:for-each
					select="$planofCareSection/cda:entry/cda:encounter">
					<xsl:call-template name="encounterModule">
    					<xsl:with-param name="encounterModule" select="(self::node())"/>
					</xsl:call-template>
				</xsl:for-each>
			</Encounters>
			</xsl:if>
					
			<xsl:if test="fn:exists($planofCareSection/cda:entry/cda:procedure)">
			<Procedures>
				<xsl:for-each
					select="$planofCareSection/cda:entry/cda:procedure">
					<xsl:call-template name="procedureModule">
    					<xsl:with-param name="procedureModule" select="(self::node())"/>
					</xsl:call-template>
				</xsl:for-each>
			</Procedures>
			</xsl:if>
		</PlanofCare>
    </xsl:template>        
</xsl:stylesheet>