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

  	<xsl:import href="../templates.xslt"/>    
    <xsl:import href="../modules/Immunization_IPtoCIM.xslt" />
    
    <xsl:template name="immunizationSection">
        <xsl:param name="immunizationSection"/>
        <Immunizations>
          <xsl:if test="fn:exists($immunizationSection/cda:text)">
            <text>
            	<xsl:apply-templates select="$immunizationSection/cda:text/node()"/>
            </text>
          </xsl:if>
          
          
          <xsl:for-each select="$immunizationSection/cda:entry/cda:substanceAdministration[cda:templateId/@root='2.16.840.1.113883.10.20.1.24']">
            <xsl:call-template name="immunizationModule">
              <xsl:with-param name="immunizationModule" select="(self::node())"></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </Immunizations>
    </xsl:template>    
</xsl:stylesheet>