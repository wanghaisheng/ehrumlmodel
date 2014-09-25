<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt"/>
    
    <xsl:template name="assessmentCCDA">
        <xsl:param name="assessment" />
        <xsl:param name="mnemonic" />
		<xsl:for-each select="$assessment">
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.22.2.8"/>
					<code>
						<xsl:attribute name="code" namespace="" select="'51848-0'"/>
						<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
						<xsl:attribute name="displayName" namespace="" select="'ASSESSMENT'"/>
						<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
					</code>
					<title>
						<xsl:sequence select="'ASSESSMENT'"/>
					</title>
<!--                         <xsl:call-template name="conditionsNarrative"> -->
<!--                             <xsl:with-param name="conditions" select="$activeProblems/toc:conditions"/> -->
<!--                         </xsl:call-template> -->
	                   
	                    <text>
		                    <xsl:apply-templates select="toc:Text/node()"/>
	               		</text>
				</section>
			</component>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>