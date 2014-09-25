<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    
    <xsl:template name="财务与卫生费用_CDA">
        <xsl:param name="居民基础信息_居民社会保障信息" />
		
		<xsl:for-each select="$居民基础信息_居民社会保障信息">
			<component>
				<section>
					<templateId root="Section_template_Root_OID.3"/>
					<code>
						<xsl:attribute name="code" namespace="" select="'48768-6'"/>
						<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
						<!-- <xsl:attribute name="displayName" namespace="" select="'Encounters'"/>
						<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/> -->
					</code>
					<title>
						<xsl:sequence select="'财务与卫生费用章节'"/>
					</title>
<!--                         <xsl:call-template name="conditionsNarrative"> -->
<!--                             <xsl:with-param name="conditions" select="$activeProblems/toc:conditions"/> -->
<!--                         </xsl:call-template> -->
	                   
					<text>
						<list>
							<item>医疗费用支付方式代码:<xsl:value-of select="$居民基础信息_居民社会保障信息/居民社会保障信息/医疗费用支付方式代码"/>
							</item>						
						</list> 
					</text>
					<xsl:for-each select="$居民基础信息_居民社会保障信息/居民社会保障信息/医疗费用支付方式代码">
						<entry>
							<act classCode="ACT" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.3" />
								<code>
									<xsl:attribute name="code" select="$居民基础信息_居民社会保障信息/居民社会保障信息/医疗费用支付方式代码" />
									<xsl:attribute name="displayName" select="'xxx'" />    							
									<xsl:attribute name="codeSystemName" select="'CV07.10.003'" />   							
									<xsl:attribute name="codeSystem" select="'CV07.10.003'" /> 
								</code>
								<statusCode code="completed" />
							</act>
						</entry>
					</xsl:for-each>						
				</section>
			</component>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>