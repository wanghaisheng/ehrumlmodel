<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

 	<xsl:import href="../maps.xslt"/>
    <xsl:import href="../modules/Condition.xslt"/>
        
    <xsl:template name="dischargeDiagnosis">
        <xsl:param name="dischargeDiagnosis" />
        	<component>
				<section>
					<templateId root="2.16.840.1.113883.3.88.11.83.111"/>
					<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.7"/>
					<code code="11535-2" codeSystem="2.16.840.1.113883.6.1"/>
					<title>
						<xsl:sequence select="'Discharge Diagnosis'"/>
					</title>
					
					<!-- Discharge Diagnosis Section level Text -->
	               	<xsl:if test="fn:exists($dischargeDiagnosis/toc:Text)">
	                	<text>
			             	 <xsl:apply-templates select="$dischargeDiagnosis/toc:Text/node()"/>
			            </text>
	               	</xsl:if>
        
					<xsl:for-each select="$dischargeDiagnosis/toc:Conditions">
	                    <xsl:for-each select="toc:Condition">
	                   		<xsl:variable name="idNumber">
	                            <xsl:number level="any"/>
	                         </xsl:variable>
	                        <xsl:call-template name="condition">
	                            <xsl:with-param name="condition" select="(self::node())"></xsl:with-param>
	                            <xsl:with-param name="idNum" select="$idNumber"/>
	                        </xsl:call-template>
	                    </xsl:for-each>
					</xsl:for-each>
				</section>
			</component>
	</xsl:template>
</xsl:stylesheet>