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

    <xsl:import href="../modules/Encounter_IPtoCIM.xslt" />
    
    <xsl:template name="encounterSection">
        <xsl:param name="encounterSection"/>
        <Encounters>
         	<xsl:for-each select="$encounterSection/cda:text">
		     	<Text>
				    <!-- <xsl:for-each select="node()[./self::text()]">
					    <xsl:sequence select="fn:string(.)"/>
				    </xsl:for-each> -->
				    <xsl:apply-templates select="node()" />
			      </Text>
			</xsl:for-each>
          
          <xsl:for-each select="$encounterSection/cda:entry/cda:encounter[cda:templateId/@root='2.16.840.1.113883.10.20.1.21']">
            <xsl:call-template name="encounterModule">
              <xsl:with-param name="encounterModule" select="(self::node())"></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
        </Encounters>
    </xsl:template>    
</xsl:stylesheet>