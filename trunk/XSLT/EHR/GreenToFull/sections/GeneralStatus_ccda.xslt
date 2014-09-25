<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    
    <xsl:template name="generalStatusCCDA">
        <xsl:param name="generalStatus"/>
        <xsl:param name="mnemonic" />
		<component>
			<section>
				<templateId root="2.16.840.1.113883.10.20.2.5"/>
				<code code="10210-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="GENERAL STATUS"/>
				<title>GENERAL STATUS</title>
			    <text>
			    	<xsl:apply-templates select="$generalStatus/toc:Text/node()"/>
                 </text>
			</section>
		</component>
    </xsl:template>
</xsl:stylesheet>