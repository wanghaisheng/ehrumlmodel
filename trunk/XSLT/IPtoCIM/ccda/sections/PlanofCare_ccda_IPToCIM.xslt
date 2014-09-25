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

    <xsl:import href="../modules/PocResults_ccda_IPtoCIM.xslt"/>
    <xsl:import href="../modules/PocHealthCareService_ccda_IPtoCIM.xslt"/>
    <xsl:import href="../modules/PocEncounters_ccda_IPtoCIM.xslt"/>
    <xsl:import href="../modules/PocPlannedMedication_ccda_IPtoCIM.xslt"/>
    <xsl:import href="../modules/PocProcedures_ccda_IPtoCIM.xslt"/>
    <xsl:import href="../modules/PocProduct_ccda_IPtoCIM.xslt"/>
        
     
    <xsl:template name="planofCareSectionCCDA">
        <xsl:param name="planofCareSection"/>
        <xsl:param name="srcMnemonic"/>
		
		<xsl:for-each select="$planofCareSection">
		<PlanofCare>				
	            <xsl:for-each select="$planofCareSection/cda:text"> 
	                <Text> 
						<xsl:apply-templates select="$planofCareSection/cda:text/node()"/>
	             	</Text> 
	            </xsl:for-each>
				 <xsl:if test="$srcMnemonic=$DischargeSummary_Level3 or $srcMnemonic=$TOCDischargeSummary_Level3 or $srcMnemonic=$TOCDischargeInstructions_Level3 or $srcMnemonic=$TOCConsultationRequest_Level3 or $srcMnemonic=$TOCConsultationSummary_Level3">
			           <!--  HealthCare Service -->
			        <xsl:if test="fn:exists($planofCareSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.39'])">
			 			<HealthCareService>
			 				<xsl:for-each select="$planofCareSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.39']" >
		                        <xsl:call-template name="pocHealthCareServiceSectionCCDA">
		                            <xsl:with-param name="pocHealthCareServiceSection" select="." as="node()" ></xsl:with-param>
		                        </xsl:call-template>
	                    	</xsl:for-each>
	                      </HealthCareService>
                    </xsl:if>
                    <!--  Encounters -->
                    <xsl:if test="fn:exists($planofCareSection/cda:entry/cda:encounter[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.40'])">
	                    <Encounters>
		                    <xsl:for-each select="$planofCareSection/cda:entry/cda:encounter[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.40']" >
		                        <xsl:call-template name="pocEncountersSectionCCDA">
		                            <xsl:with-param name="pocEncountersSection" select="." as="node()"></xsl:with-param>
		                        </xsl:call-template>
		                    </xsl:for-each>
	                    </Encounters>
                    </xsl:if>
                  
                    <!--  Results -->
                    <xsl:if test="fn:exists($planofCareSection/cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.44'])">
                    <Results>
		 				<xsl:for-each select="$planofCareSection/cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.44']" >
	                        <xsl:call-template name="pocResultSectionCCDA">
	                            <xsl:with-param name="pocResultSection" select="(self::node())"></xsl:with-param>
	                        </xsl:call-template>
	                    </xsl:for-each>
                    </Results>
                    </xsl:if>
                    
                   <!--  Procedures -->
                   <xsl:if test="fn:exists($planofCareSection/cda:entry/cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.41'])" >
	                   <Procedures>
			 			<xsl:for-each select="$planofCareSection/cda:entry/cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.41']" >
	                        <xsl:call-template name="pocProceduresSectionCCDA">
	                            <xsl:with-param name="pocProceduresSection" select="(self::node())"></xsl:with-param>
	                        </xsl:call-template>
	                    </xsl:for-each>
	                    </Procedures>
                    </xsl:if>
                    
                  <!--  Planned Medication -->
                  <xsl:if test="fn:exists($planofCareSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.42'])" >
	                  <PlannedMedication>
				 			<xsl:for-each select="$planofCareSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.42']" >
		                        <xsl:call-template name="pocPlannedMedicationSectionCCDA">
		                            <xsl:with-param name="pocPlannedMedicationSection" select="(self::node())"></xsl:with-param>
		                        </xsl:call-template>
		                    </xsl:for-each>
	                    </PlannedMedication>
                   </xsl:if>
                    
				  <!--  Product -->
				  <xsl:if test="fn:exists($planofCareSection/cda:entry/cda:supply[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.43'])" >
					  <Product>
					 		<xsl:for-each select="$planofCareSection/cda:entry/cda:supply[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.43']" >
			                        <xsl:call-template name="pocProductSectionCCDA">
			                            <xsl:with-param name="pocProductSection" select="(self::node())"></xsl:with-param>
			                        </xsl:call-template>
			                    </xsl:for-each>
	                   </Product>
				 </xsl:if>
			</xsl:if>
		</PlanofCare>
		</xsl:for-each>
    </xsl:template>        
</xsl:stylesheet>