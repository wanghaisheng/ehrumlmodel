<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    
    <xsl:template name="reasonforReferralCCDA">
        <xsl:param name="reasonforReferral" />
        <xsl:param name="mnemonic" />
		
			<component>
				<section>
					<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.1"/>
					<code>
						<xsl:attribute name="code" namespace="" select="'42349-1'"/>
						<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
						<xsl:attribute name="displayName" namespace="" select="'REASON FOR REFERRAL'"/>
						<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
					</code>
					<title>
						<xsl:sequence select="'REASON FOR REFERRAL'"/>
					</title>
					<xsl:if test="fn:exists($reasonforReferral/toc:Text)">
	                    <text>
		                    <xsl:apply-templates select="$reasonforReferral/toc:Text/node()"/>
	               		</text>
               		</xsl:if>
				</section>
			</component>
	</xsl:template>
</xsl:stylesheet>