<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri"
	xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	exclude-result-prefixes="xs fn gcda"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">
	
    <xsl:import href="../templates.xslt"/>    
  
    <xsl:template name="procedureModule">
        <xsl:param name="procedureModule"/>
        <xsl:for-each select="$procedureModule">     
		<xsl:variable name="var1028_code" as="node()?" select="cda:code" />
			<Procedure>
            <xsl:for-each select="cda:id">
                <xsl:call-template name="idII">
                    <xsl:with-param name="idII" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'ProcedureID'" />
                </xsl:call-template>
            </xsl:for-each>
           <!--  TODO: Fix the CIM structure, as it is causing the template usage to produce messed up output 
            <xsl:for-each select="cda:code">
                <xsl:call-template name="codeCD">
                    <xsl:with-param name="code" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'procedureType'" />
                </xsl:call-template>
            </xsl:for-each>
            -->
            <xsl:for-each select="cda:code">
            <ProcedureType>
           		 <xsl:for-each select="@nullFlavor">
	                <xsl:attribute name="nullFlavor" select="fn:string(.)"/>
	            </xsl:for-each>
	            <xsl:for-each select="@code">
	                <xsl:attribute name="code" select="fn:string(.)"/>
	            </xsl:for-each>
	            <xsl:for-each select="@codeSystem">
	                <xsl:attribute name="codeSystem" select="fn:string(.)"/>
	            </xsl:for-each>
	            <xsl:for-each select="@codeSystemName">
	                <xsl:attribute name="codeSystemName" select="fn:string(.)"/>
	            </xsl:for-each>
	            <xsl:for-each select="@displayName">
	                <xsl:attribute name="displayName" select="fn:string(.)"/>
	            </xsl:for-each>
                <xsl:for-each select="cda:qualifier">
                    <xsl:call-template name="qualifier">
                        <xsl:with-param name="qualifier" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
            </ProcedureType>
            </xsl:for-each>
            
			<!-- <xsl:for-each select="$var1028_code/cda:originalText/cda:reference"> -->
			<xsl:for-each select="cda:code/cda:originalText/cda:reference">
				<xsl:variable name="var1047_value" as="node()?"
					select="@value" />
				<xsl:if test="fn:exists($var1047_value)">
					<ProcedureFreeTextType>
						<xsl:sequence
							select="xs:string(xs:anyURI(fn:string($var1047_value)))" />
					</ProcedureFreeTextType>
				</xsl:if>
			</xsl:for-each>
            <xsl:for-each select="cda:effectiveTime">
                <xsl:call-template name="ivlTS">
                    <xsl:with-param name="ivlTS" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'ProcedureDateTime'" />
                </xsl:call-template>
            </xsl:for-each>
			<xsl:for-each select="cda:targetSiteCode">
                <xsl:call-template name="codeCD">
                    <xsl:with-param name="code" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'BodySite'" />
                </xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:performer/cda:assignedEntity">
				<ProcedureProvider>
					<xsl:for-each select="cda:id">
                              <xsl:call-template name="idII">
                                  <xsl:with-param name="idII" select="." as="node()" />
                                  <xsl:with-param name="elementName" select="'gcda:organizationID'" />
                              </xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="cda:representedOrganization">
                              <xsl:for-each select="cda:addr">
                                  <xsl:call-template name="address">
                                      <xsl:with-param name="address" select="." as="node()" />
                                      <xsl:with-param name="elementName" select="'gcda:organizationAddress'" />
                                  </xsl:call-template>
                              </xsl:for-each>
                              <xsl:for-each select="cda:telecom">
                                  <xsl:call-template name="telecom">
                                      <xsl:with-param name="telecom" select="." as="node()" />
                                      <xsl:with-param name="elementName" select="'gcda:organizationTelecom'" />
                                  </xsl:call-template>
                              </xsl:for-each>
                              <xsl:for-each select="cda:name">
                                  <xsl:call-template name="organizationName">
                                      <xsl:with-param name="organizationName" select="." as="node()" />
                                      <xsl:with-param name="elementName" select="'gcda:organizationName'" />
                                  </xsl:call-template>
                              </xsl:for-each>
                                   </xsl:for-each>
				</ProcedureProvider>
			</xsl:for-each>
                        <xsl:for-each select="cda:text"> 
                            <Text> 
                            <!-- <xsl:for-each select="node()[fn:boolean(self::text())]"> 
                                <xsl:sequence select="fn:string(.)"/> 
                            </xsl:for-each> --> 
                            <xsl:sequence select="(./@node(), ./node())"/>
                        </Text> 
                        </xsl:for-each>
    		</Procedure>
		</xsl:for-each>
    </xsl:template>        
</xsl:stylesheet>