<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    
    <xsl:template name="reasonforVisitCCDA">
        <xsl:param name="reasonforVisit" />
		
		<component>
			<section>
				<templateId root="2.16.840.1.113883.10.20.22.2.12"/>
				<code>
					<xsl:attribute name="code" namespace="" select="'29299-5'"/>
					<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
					<xsl:attribute name="displayName" namespace="" select="'REASON FOR VISIT'"/>
					<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
				</code>
				<title>
					<xsl:sequence select="'REASON FOR VISIT'"/>
				</title>
					 <xsl:if test="fn:exists($reasonforVisit/toc:Text)">
			           	<text>
			            	 	<xsl:apply-templates select="$reasonforVisit/toc:Text/node()"/>
			            </text>
		      		</xsl:if>
				</section>
			</component>
	</xsl:template>
</xsl:stylesheet>