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
       
    <xsl:template name="functionalStatusSectionCCDA">
        <xsl:param name="functionalStatusSection"/>
        <xsl:param name="srcMnemonic"/>
			<FunctionalStatus>				
              <xsl:for-each select="$functionalStatusSection/cda:text"> 
                  <Text> 
					<xsl:apply-templates select="$functionalStatusSection/cda:text/node()"/>
               	  </Text> 
              </xsl:for-each>
			</FunctionalStatus>
    </xsl:template>        
</xsl:stylesheet>