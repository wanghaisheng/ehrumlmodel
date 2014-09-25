<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    <xsl:import href="../modules/Procedure_ccda.xslt"/>
    
    <xsl:template name="proceduresCCDA">
        <xsl:param name="procedures" />
        <xsl:param name="mnemonic" />
		
		<xsl:for-each select="$procedures">
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.22.2.7"/>
					<code>
						<xsl:attribute name="code" namespace="" select="'47519-4'"/>
						<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
						<xsl:attribute name="displayName" namespace="" select="'PROCEDURES'"/>
						<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
					</code>
					<title>
						<xsl:sequence select="'Procedures'"/>
					</title>
<!--                         <xsl:call-template name="conditionsNarrative"> -->
<!--                             <xsl:with-param name="conditions" select="$activeProblems/toc:conditions"/> -->
<!--                         </xsl:call-template> -->
	                   
	                    <text>
		                    <xsl:apply-templates select="toc:Text/node()"/>
	               		</text>
	               		
	               		 <xsl:if test="$mnemonic=$TOCDischargeSummary_Level3 or $mnemonic=$TOCConsultationRequest_Level3 or $mnemonic=$TOCConsultationSummary_Level3">
			               	<xsl:for-each select="$procedures/toc:Procedure">
								<xsl:call-template name="procedureCCDA">
									<xsl:with-param name="procedure" select="(self::node())" />
			                        <xsl:with-param name="mnemonic" select="$mnemonic" />
			                        <xsl:with-param name="where-from" select="'procedures'" />
								</xsl:call-template>
							</xsl:for-each>	
						</xsl:if>
				</section>
			</component>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>