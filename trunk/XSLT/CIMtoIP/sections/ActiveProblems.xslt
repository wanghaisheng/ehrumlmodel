<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../modules/Condition.xslt"/>
    <xsl:import href="../narratives.xslt"/>
    
    <xsl:template name="activeProblems">
        <xsl:param name="activeProblems" />
		<xsl:for-each select="$activeProblems/toc:Conditions">
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.1.11"/>
					<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.6"/>
					<templateId root="2.16.840.1.113883.3.88.11.83.103"/>
					<code>
						<xsl:attribute name="code" namespace="" select="'11450-4'"/>
						<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
						<xsl:attribute name="displayName" namespace="" select="'Problem list'"/>
						<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
					</code>
					<title>
						<xsl:sequence select="'problems'"/>
					</title>
                    
<!--                         <xsl:call-template name="conditionsNarrative"> -->
<!--                             <xsl:with-param name="conditions" select="$activeProblems/toc:conditions"/> -->
<!--                         </xsl:call-template> -->
	                   
	                    <text>
	                    	<xsl:apply-templates select="toc:Text/node()"/>
	               		</text>

					<xsl:for-each select="toc:Condition">
	                    <xsl:call-template name="condition">
	                        <xsl:with-param name="condition" select="(self::node())"></xsl:with-param>
	                        <xsl:with-param name="idNum"><xsl:number level="any"/></xsl:with-param>
	                    </xsl:call-template>
								<!--  <xsl:if test="fn:exists($var719_resultof_mapCondition)">
									<xsl:for-each select="$var719_resultof_mapCondition/cxf:entryRelationship">
									<text>
										<xsl:for-each select="$var719_resultof_mapCondition/cxf:entryRelationship/cxf:observation">
										<p>
			                                    	<xsl:for-each select="$var719_resultof_mapCondition/cxf:entryRelationship/cxf:observation/cxf:p">
			                                    	  <xsl:sequence select="(./@node(), ./node())"/>
			                                        </xsl:for-each>
			                                   </p> 
			                     	     </xsl:for-each>
			                                 </text>
			                         </xsl:for-each>
			                     </xsl:if> -->
									
					</xsl:for-each>
				</section>
			</component>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>