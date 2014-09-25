<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt"/>
    <xsl:import href="../modules/Condition_ccda.xslt"/>
    <xsl:import href="../narratives_ccda.xslt"/>
        
    <xsl:template name="dischargeDiagnosisCCDA">
        <xsl:param name="dischargeDiagnosis" />
        <xsl:param name="mnemonic" />
        
        <xsl:for-each select="$dischargeDiagnosis">
			<component>
				<section>
                    <!-- CONF:9546; CONF:7979 -->
                    <templateId root="2.16.840.1.113883.10.20.22.2.24"/>
                    <!-- CONF:7980 -->
                    <code code="11535-2" displayName="Hospital Discharge Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                    <!-- CONF:7981 -->
                    <title>
                        <xsl:sequence select="'Hospital Discharge Diagnosis'"/>
                    </title>
					
					<!--  this narrative block code works but will be commented out 	    
					<xsl:choose>
                 		<xsl:when test="fn:exists(toc:Text)">
		                	<text>
				             	 <xsl:apply-templates select="toc:Text/node()"/>
				            </text>
                 		</xsl:when>
                 		<xsl:when test="fn:exists(toc:Conditions/toc:Text)">
                 			<text>
			               	 	<xsl:apply-templates select="toc:Conditions/toc:Text/node()"/>
	                     	</text>
	                     </xsl:when>
	                     <xsl:otherwise>
	                     	<xsl:call-template name="conditionsNarrative">
                            	<xsl:with-param name="conditions" select="toc:Conditions"/>
                    		</xsl:call-template>
                    	</xsl:otherwise>
	                </xsl:choose> -->
	                
	                	<!-- Discharge Diagnosis Section level Text -->
	                	
	                	<xsl:if test="fn:exists(toc:Text)">
		                	<text>
				             	 <xsl:apply-templates select="toc:Text/node()"/>
				            </text>
                 		</xsl:if>
	                     
			        <!--  For Level 2 and Level 3, the section header and text fields will be generated  -->
					<xsl:for-each select="toc:Conditions">
	                   <!-- CONF:7982 -->
	                    <xsl:if test="(($mnemonic and ($mnemonic='DS_L3')) or ($mnemonic and ($mnemonic='CCDA_TOC_DS_L3')))">
		                    <xsl:for-each select="toc:Condition">
		                     <xsl:variable name="idNumber">
	                            <xsl:number level="any"/>
	                         </xsl:variable>
		                        <xsl:call-template name="conditionCCDA">
		                            <xsl:with-param name="condition" select="(self::node())"/>
		                            <xsl:with-param name="idNum" select="$idNumber"/>
		                        </xsl:call-template>
		                    </xsl:for-each>
	                    </xsl:if>
					</xsl:for-each>
				</section>
			</component>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>