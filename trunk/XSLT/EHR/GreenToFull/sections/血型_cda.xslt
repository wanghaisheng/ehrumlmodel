<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt"/>
	<xsl:template name="血型_cda">
        <xsl:param name="血型"/>
		
    	<xsl:for-each select="$血型">
    		<component>
    			<section>
    				<templateId root="Section_template_Root_OID.1"/>
    				<code>
    					<xsl:attribute name="code" namespace="" select="'882-1'"/>
    					<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
    					<xsl:attribute name="displayName" namespace="" select="'ABO+RH血型'"/>
    					<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
    				</code>
    				<title>
    					<xsl:sequence select="'血型'"/>
    				</title>
    				<!--                         <xsl:call-template name="conditionsNarrative"> -->
    				<!--                             <xsl:with-param name="conditions" select="$activeProblems/toc:conditions"/> -->
    				<!--                         </xsl:call-template> -->
    				
    				<text>
    					<list>
    						<item>ABO血型代码:<xsl:value-of select="$血型/ABO血型代码"/>
    						</item>
    						<item>Rh血型代码:<xsl:value-of select="$血型/Rh血型代码"/>
    						</item>
    					</list> 
    				</text>
    				<xsl:for-each select="$血型/ABO血型代码">
    				<entry>
    					<observation classCode="OBS" moodCode="EVN">
    						<templateId root="Entry_template_Root_OID.1.1" />
    						<code>
    							<xsl:attribute name="code" select="'HDSD00.01.013'" />
    							<xsl:attribute name="displayName" select="'ABO血型代码'" />    							
    							<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
    							<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
    						</code>
    						<statusCode code="completed" />
    						<value>
    							<xsl:attribute name="xsi:type"
    								namespace="http://www.w3.org/2001/XMLSchema-instance" select="'CD'" />
    							<xsl:attribute name="code" select="$血型/ABO血型代码" />
    							<xsl:attribute name="codeSystem" select="'CV04.50.005'" />
    							<xsl:attribute name="codeSystemName" select="'ABO血型代码'" />	
    							<xsl:choose>
    								<xsl:when test="$血型/ABO血型代码='1'">    									
    									<xsl:attribute name="displayName" select="'A型'" />
    								</xsl:when>
    								<xsl:when test="$血型/ABO血型代码='2'">    									
    									<xsl:attribute name="displayName" select="'B型'" />
    								</xsl:when>
    								<xsl:when test="$血型/ABO血型代码='3'">    									
    									<xsl:attribute name="displayName" select="'O型'" />  
    								</xsl:when> 													
    							</xsl:choose>															
    						</value>
    					</observation>
    				</entry>
    				</xsl:for-each>		
    				<xsl:for-each select="$血型/Rh血型代码">
    					<entry>
    						<observation classCode="OBS" moodCode="EVN">
    							<templateId root="Entry_template_Root_OID.1.2" />
    							<code>
    								<xsl:attribute name="code" select="'HDSD00.01.014'" />
    								<xsl:attribute name="displayName" select="'Rh血型代码'" />    							
    								<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
    								<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
    							</code>
    							<statusCode code="completed" />
    							<value>
    								<xsl:attribute name="xsi:type"
    									namespace="http://www.w3.org/2001/XMLSchema-instance" select="'CD'" />
    								<xsl:attribute name="code" select="$血型/Rh血型代码" />
    								<xsl:attribute name="codeSystem" select="'CV04.50.xxx'" />
    								<xsl:attribute name="codeSystemName" select="'Rh血型代码'" />		
    								<xsl:if test="$血型/Rh血型代码='1'">    									
    										<xsl:attribute name="displayName" select="'Rh阳性'" />
    									</xsl:if>
    								<xsl:if test="$血型/Rh血型代码='2'">    									
    										<xsl:attribute name="displayName" select="'Rh阴性'" />
    									</xsl:if>
    								<xsl:if test="$血型/Rh血型代码='3'">
    										<xsl:attribute name="displayName" select="'不详'" />
    								</xsl:if>    																									
    							</value>
    						</observation>
    					</entry>
    				</xsl:for-each>		    				
    			</section>
    		</component>
    	</xsl:for-each>
    </xsl:template>
</xsl:stylesheet>