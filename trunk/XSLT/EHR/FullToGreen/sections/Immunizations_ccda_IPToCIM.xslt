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
	
	 <xsl:import href="../modules/Immunization_ccda_IPtoCIM.xslt" />
       
    <xsl:template name="immunizationsSectionCCDA">
        <xsl:param name="immunizationsSection"/>
        <xsl:param name="srcMnemonic"/>
			<Immunizations>				
	           <text> 
					<xsl:apply-templates select="$immunizationsSection/cda:text/node()"/>
	           </text> 
	           
	            <xsl:if test="$srcMnemonic=$DischargeSummary_Level3 or $srcMnemonic=$TOCDischargeSummary_Level3 or $srcMnemonic=$TOCDischargeInstructions_Level3 or $srcMnemonic=$TOCConsultationRequest_Level3 or $srcMnemonic=$TOCConsultationSummary_Level3">
	            	<xsl:for-each select="$immunizationsSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.52']">
	            		<xsl:call-template name="immunizationModuleCCDA">
	              			<xsl:with-param name="immunizationModule" select="(self::node())"></xsl:with-param>
	            		</xsl:call-template>
          			</xsl:for-each>
          		</xsl:if>
          		
			</Immunizations>
    </xsl:template>        
</xsl:stylesheet>