<xsl:stylesheet version="2.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:gcda="urn:hl7-org:gcda" xmlns:tbf="http://www.altova.com/MapForce/UDF/tbf" xmlns:user="http://www.altova.com/MapForce/UDF/user" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns="urn:hl7-org:v3" exclude-result-prefixes="toc tbf user xs fn gcda">
    <xsl:import href="../../common/functions.xslt"/>   
    
    <xsl:import href="../maps.xslt"/>   
    
    <xsl:template name="result">
        <xsl:param name="result"/>
        
       <!--  <entry>
            <procedure classCode="PROC" moodCode="EVN">
              <templateId root="2.16.840.1.113883.3.88.11.83.17"/>
              <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.19" />
              <id root="e401f340-7be2-11db-9fe1-0800200c9a66"/>
              <text>Hip Replacement Procedure</text>
              <code code="52734007" codeSystem="2.16.840.1.113883.6.96" displayName="Total hip replacement">
                <originalText>
                           <reference value=" Total hip replacement, left and right"/>
                        </originalText>
              </code>
              <statusCode code="completed"/>
              <effectiveTime value="0921999"/>
              <targetSiteCode/>
              <performer>
                <assignedEntity>
                  <id root="14ED7742" extension="5678"/>
                  <addr>
                              <state>VA</state>
                              <city>Baltimore</city>
                              <postalCode>10001</postalCode>
                              <streetAddressLine>123, Main Street</streetAddressLine>
                           </addr>
                  <telecom value="tel:630-786-7032"/>
                  <representedOrganization>
                    <name>West Elm Pharmacies</name>
                  </representedOrganization>
                </assignedEntity>
              </performer>
            </procedure>
          </entry> 
          -->
        
        <entry>
            <!-- Note : make sure classCode is valid or not (added classCode to avoid the structural issues -->
            <observation moodCode="EVN" classCode="OBS">
            	<templateId root="2.16.840.1.113883.10.20.1.31"/>
            	<templateId root="2.16.840.1.113883.3.88.11.83.15.1"/>
            	<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.13"/>
            		
            	<xsl:for-each select="$result/toc:resultID">
	                <xsl:call-template name="idII">
	                    <xsl:with-param name="idII" select="." as="node()" />
	                </xsl:call-template>
                </xsl:for-each>
           		
            		<!--  code -->
				<xsl:for-each select="$result/toc:resultType">
					<xsl:call-template name="codeCD">
						<xsl:with-param name="code" select="." as="node()" />
						<xsl:with-param name="elementName" select="'code'" />
					</xsl:call-template>
				</xsl:for-each>
              
				<statusCode>
				    <xsl:attribute name="code" namespace="" select="$result/toc:resultStatus/@code"/>
				</statusCode>
                                <xsl:for-each select="$result/toc:resultDateTime">
                       <xsl:call-template name="ivlTS">
                           <xsl:with-param name="ivlTS" select="." as="node()" />
                           <xsl:with-param name="elementName" select="'effectiveTime'" />
                       </xsl:call-template>
                </xsl:for-each>
              
				<value>
					<xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','PQ')"/>
					<xsl:for-each select="$result/toc:resultValue/gcda:physicalQuantity">
						<xsl:variable name="var3_resultValue_physicalQuantity" as="node()" select="."/>
						<xsl:for-each select="@value">
							<xsl:variable name="var2_resultValue_physicalQuantity_value" as="node()" select="."/>
							<xsl:attribute name="value" select="$var2_resultValue_physicalQuantity_value"/>
							<xsl:attribute name="unit" select="$var3_resultValue_physicalQuantity/@unit"/>
    					</xsl:for-each>
					</xsl:for-each>
				</value>
              
				<xsl:for-each select="$result/toc:resultInterpretation">
				    <xsl:call-template name="codeCD">
				        <xsl:with-param name="code" select="." as="node()" />
				        <xsl:with-param name="elementName" select="'interpretationCode'" />
				    </xsl:call-template>
				</xsl:for-each>
                <xsl:for-each select="toc:resultReferenceRange">
                <referenceRange>
                    <observationRange>
	                    <text>
	                        <xsl:sequence select="fn:string(.)"/>
	                    </text>

<!-- 						<xsl:for-each select="node()[./self::text()]"> -->
<!-- 							<xsl:sequence select="fn:string(.)"/> -->
<!-- 						</xsl:for-each> -->
					</observationRange>
				</referenceRange>
                </xsl:for-each>
            </observation>
        </entry>
    </xsl:template>
</xsl:stylesheet>