<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri"
	xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	exclude-result-prefixes="xs fn gcda"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">
	
	<xsl:import href="../modules/Medication_IPtoCIM.xslt" />
	
    <xsl:template name="dischargeMedsSection">
        <xsl:param name="dischargeMedsSection"/>
			<DischargeMeds>						
                        <xsl:for-each select="$dischargeMedsSection/cda:text"> 
                            <Text> 
                            <!-- <xsl:for-each select="node()[fn:boolean(self::text())]"> 
                                <xsl:sequence select="fn:string(.)"/> 
                            </xsl:for-each> --> 
                            <xsl:sequence select="(./@node(), ./node())"/>
                            <xsl:apply-templates select="node()" />
                        </Text> 
                        </xsl:for-each>
		   		<xsl:call-template name="medicationModule">
					<xsl:with-param name="medicationModule"
						select="$dischargeMedsSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.3.88.11.83.8']" />
				</xsl:call-template>		
			</DischargeMeds>
    </xsl:template>        
</xsl:stylesheet>