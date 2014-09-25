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

	<xsl:import href="../modules/Procedure_IPtoCIM.xslt"/>  
    <xsl:import href="../../common/functions.xslt"/>   
    <xsl:template name="listofSurgeriesSection">
        <xsl:param name="listofSurgeriesSection"/>
	        <ListofSurgeries>
	          <xsl:variable name="var_pc575_text" as="item()*" select="$listofSurgeriesSection/cda:text"/>
	          <xsl:if test="fn:exists($var_pc575_text)">
	            <Text><xsl:sequence select="fn:string($var_pc575_text)"/></Text>
	          </xsl:if>
	          <xsl:for-each select="$listofSurgeriesSection/cda:entry/cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.1.29']">
	            <xsl:call-template name="procedureModule">
	              <xsl:with-param name="procedureModule" select="(self::node())"></xsl:with-param>
	            </xsl:call-template>
	          </xsl:for-each>
	      </ListofSurgeries>
    </xsl:template>                                
</xsl:stylesheet>