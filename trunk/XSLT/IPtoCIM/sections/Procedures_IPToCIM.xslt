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

	<xsl:import href="../modules/Procedure_IPtoCIM.xslt"/>  
    <xsl:import href="../../common/functions.xslt"/>
    <xsl:import href="../templates.xslt"/>   
    <xsl:template name="proceduresSection">
        <xsl:param name="proceduresSection"/>
        <Procedures>
       <!--    <xsl:variable name="var_pc575_text" as="item()*" select="$proceduresSection/cda:text"/>
          <xsl:if test="fn:exists($var_pc575_text)">
            <text><xsl:sequence select="fn:string($var_pc575_text)"/></text>
          </xsl:if> -->
          
          <xsl:if test="fn:exists($proceduresSection/cda:text)">
         	 <xsl:for-each select="$proceduresSection/cda:text"> 
               	   <Text> 
						<xsl:apply-templates select="node()"/>
	             	</Text>
              </xsl:for-each>
          </xsl:if>
          
          <xsl:for-each select="$proceduresSection/cda:entry/cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.1.29']">
            <xsl:call-template name="procedureModule">
              <xsl:with-param name="procedureModule" select="(self::node())"></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
      </Procedures>
    </xsl:template>                                

   <!--  <xsl:template name="procedure">
        <xsl:param name="procedure"/>
            <procedure>
              <xsl:for-each select="$procedure/cda:id">
                <xsl:variable name="var_pc576_select_extension" as="item()*" select="@extension"/>
                <xsl:variable name="var_pc577_select_root" as="item()*" select="@root"/>
                <xsl:variable name="var_pc578_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                <procedureID>
                  <xsl:if test="fn:exists($var_pc578_select_nullFlavor)">
                    <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc578_select_nullFlavor)"/>
                  </xsl:if>
                  <xsl:if test="fn:exists($var_pc577_select_root)">
                    <xsl:attribute name="root" namespace="" select="fn:string($var_pc577_select_root)"/>
                  </xsl:if>
                  <xsl:if test="fn:exists($var_pc576_select_extension)">
                    <xsl:attribute name="extension" namespace="" select="fn:string($var_pc576_select_extension)"/>
                  </xsl:if>
                </procedureID>
              </xsl:for-each>
              <xsl:for-each select="$procedure/cda:code">
                  <xsl:variable name="var_pc579_select_displayName" as="item()*" select="@displayName"/>
                  <xsl:variable name="var_pc580_select_codeSystem" as="item()*" select="@codeSystem"/>
                  <xsl:variable name="var_pc581_select_code" as="item()*" select="@code"/>
                  <xsl:variable name="var_pc582_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                  <xsl:variable name="var_pc583_select_codeSystemName" as="item()*" select="@codeSystemName"/>
                  <procedureType>
                      <xsl:if test="fn:exists($var_pc582_select_nullFlavor)">
                          <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc582_select_nullFlavor)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_pc581_select_code)">
                          <xsl:attribute name="code" namespace="" select="fn:string($var_pc581_select_code)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_pc580_select_codeSystem)">
                          <xsl:attribute name="codeSystem" namespace="" select="fn:string($var_pc580_select_codeSystem)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_pc583_select_codeSystemName)">
                          <xsl:attribute name="codeSystemName" namespace="" select="fn:string($var_pc583_select_codeSystemName)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_pc579_select_displayName)">
                          <xsl:attribute name="displayName" namespace="" select="fn:string($var_pc579_select_displayName)"/>
                      </xsl:if>
                      <xsl:for-each select="cda:qualifier">
                          <xsl:variable name="var_pc584_select_code" as="item()*" select="cda:name/@code"/>
                          <xsl:variable name="var_pc585_select_codeSystem" as="item()*" select="cda:value/@codeSystem"/>
                          <xsl:variable name="var_pc586_select_codeSystem" as="item()*" select="cda:name/@codeSystem"/>
                          <xsl:variable name="var_pc587_select_nullFlavor" as="item()*" select="cda:name/@nullFlavor"/>
                          <xsl:variable name="var_pc588_select_codeSystemName" as="item()*" select="cda:name/@codeSystemName"/>
                          <xsl:variable name="var_pc589_select_nullFlavor" as="item()*" select="cda:value/@nullFlavor"/>
                          <xsl:variable name="var_pc590_select_displayName" as="item()*" select="cda:name/@displayName"/>
                          <xsl:variable name="var_pc591_select_codeSystemName" as="item()*" select="cda:value/@codeSystemName"/>
                          <xsl:variable name="var_pc592_select_code" as="item()*" select="cda:value/@code"/>
                          <xsl:variable name="var_pc593_select_displayName" as="item()*" select="cda:value/@displayName"/>
                          <qualifier>
                              <name>
                                  <xsl:if test="fn:exists($var_pc587_select_nullFlavor)">
                                      <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc587_select_nullFlavor)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc584_select_code)">
                                      <xsl:attribute name="code" namespace="" select="fn:string($var_pc584_select_code)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc586_select_codeSystem)">
                                      <xsl:attribute name="codeSystem" namespace="" select="fn:string($var_pc586_select_codeSystem)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc588_select_codeSystemName)">
                                      <xsl:attribute name="codeSystemName" namespace="" select="fn:string($var_pc588_select_codeSystemName)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc590_select_displayName)">
                                      <xsl:attribute name="displayName" namespace="" select="fn:string($var_pc590_select_displayName)"/>
                                  </xsl:if>
                                  <xsl:for-each select="cda:name/cda:originalText">
                                      <originalText>
                                          <xsl:sequence select="fn:string(.)"/>
                                      </originalText>
                                  </xsl:for-each>
                                  <xsl:for-each select="cda:name/cda:qualifier">
                                      <qualifier>
                                          <xsl:sequence select="()"/>
                                      </qualifier>
                                  </xsl:for-each>
                              </name>
                              <value>
                                  <xsl:if test="fn:exists($var_pc589_select_nullFlavor)">
                                      <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc589_select_nullFlavor)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc592_select_code)">
                                      <xsl:attribute name="code" namespace="" select="fn:string($var_pc592_select_code)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc585_select_codeSystem)">
                                      <xsl:attribute name="codeSystem" namespace="" select="fn:string($var_pc585_select_codeSystem)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc591_select_codeSystemName)">
                                      <xsl:attribute name="codeSystemName" namespace="" select="fn:string($var_pc591_select_codeSystemName)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc593_select_displayName)">
                                      <xsl:attribute name="displayName" namespace="" select="fn:string($var_pc593_select_displayName)"/>
                                  </xsl:if>
                                  <xsl:for-each select="cda:value/cda:originalText">
                                      <originalText>
                                          <xsl:sequence select="fn:string(.)"/>
                                      </originalText>
                                  </xsl:for-each>
                                  <xsl:for-each select="cda:value/cda:qualifier">
                                      <qualifier>
                                          <xsl:sequence select="()"/>
                                      </qualifier>
                                  </xsl:for-each>
                              </value>
                          </qualifier>
                      </xsl:for-each>
                  </procedureType>
                  <xsl:for-each select="cda:originalText">
                    <procedureFreeTextType>
                      <xsl:sequence select="fn:string(.)"/>
                    </procedureFreeTextType>
                  </xsl:for-each>
              </xsl:for-each>
              <xsl:for-each select="$procedure/cda:effectiveTime">
                  <xsl:variable name="var_pc594_select_value" as="item()*" select="@value"/>
                  <xsl:variable name="var_pc595_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                  <procedureDateTime>
                      <xsl:if test="fn:exists($var_pc595_select_nullFlavor)">
                          <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc595_select_nullFlavor)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_pc594_select_value)">
                          <xsl:attribute name="value" namespace="" select="fn:string($var_pc594_select_value)"/>
                      </xsl:if>
                      <xsl:for-each select="cda:low">
                          <xsl:variable name="var_pc596_select_value" as="item()*" select="@value"/>
                          <xsl:variable name="var_pc597_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                          <low>
                              <xsl:if test="fn:exists($var_pc597_select_nullFlavor)">
                                  <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc597_select_nullFlavor)"/>
                              </xsl:if>
                              <xsl:if test="fn:exists($var_pc596_select_value)">
                                  <xsl:attribute name="value" namespace="" select="fn:string($var_pc596_select_value)"/>
                              </xsl:if>
                          </low>
                      </xsl:for-each>
                      <xsl:for-each select="cda:width">
                          <xsl:variable name="var_pc598_select_unit" as="item()*" select="@unit"/>
                          <xsl:variable name="var_pc599_select_value" as="item()*" select="@value"/>
                          <xsl:variable name="var_pc600_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                          <width>
                              <xsl:if test="fn:exists($var_pc600_select_nullFlavor)">
                                  <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc600_select_nullFlavor)"/>
                              </xsl:if>
                              <xsl:if test="fn:exists($var_pc599_select_value)">
                                  <xsl:attribute name="value" namespace="" select="fn:string($var_pc599_select_value)"/>
                              </xsl:if>
                              <xsl:if test="fn:exists($var_pc598_select_unit)">
                                  <xsl:attribute name="unit" namespace="" select="fn:string($var_pc598_select_unit)"/>
                              </xsl:if>
                          </width>
                      </xsl:for-each>
                      <xsl:for-each select="cda:high">
                          <xsl:variable name="var_pc601_select_value" as="item()*" select="@value"/>
                          <xsl:variable name="var_pc602_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                          <high>
                              <xsl:if test="fn:exists($var_pc602_select_nullFlavor)">
                                  <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc602_select_nullFlavor)"/>
                              </xsl:if>
                              <xsl:if test="fn:exists($var_pc601_select_value)">
                                  <xsl:attribute name="value" namespace="" select="fn:string($var_pc601_select_value)"/>
                              </xsl:if>
                          </high>
                      </xsl:for-each>
                      <xsl:for-each select="cda:center">
                          <center>
                              <xsl:call-template name="tbf1_TS">
                                  <xsl:with-param name="input" select="." as="node()"/>
                              </xsl:call-template>
                          </center>
                      </xsl:for-each>
                  </procedureDateTime>
              </xsl:for-each>
              <xsl:for-each select="$procedure/cda:targetSiteCode">
                  <xsl:variable name="var_pc603_select_displayName" as="item()*" select="@displayName"/>
                  <xsl:variable name="var_pc604_select_codeSystemName" as="item()*" select="@codeSystemName"/>
                  <xsl:variable name="var_pc605_select_code" as="item()*" select="@code"/>
                  <xsl:variable name="var_pc606_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                  <xsl:variable name="var_pc607_select_codeSystem" as="item()*" select="@codeSystem"/>
                  <bodySite>
                      <xsl:if test="fn:exists($var_pc606_select_nullFlavor)">
                          <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc606_select_nullFlavor)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_pc605_select_code)">
                          <xsl:attribute name="code" namespace="" select="fn:string($var_pc605_select_code)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_pc607_select_codeSystem)">
                          <xsl:attribute name="codeSystem" namespace="" select="fn:string($var_pc607_select_codeSystem)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_pc604_select_codeSystemName)">
                          <xsl:attribute name="codeSystemName" namespace="" select="fn:string($var_pc604_select_codeSystemName)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_pc603_select_displayName)">
                          <xsl:attribute name="displayName" namespace="" select="fn:string($var_pc603_select_displayName)"/>
                      </xsl:if>
                      <xsl:for-each select="cda:originalText">
                          <originalText>
                              <xsl:sequence select="fn:string(.)"/>
                          </originalText>
                      </xsl:for-each>
                      <xsl:for-each select="cda:qualifier">
                          <xsl:variable name="var_pc608_select_code" as="item()*" select="cda:value/@code"/>
                          <xsl:variable name="var_pc609_select_displayName" as="item()*" select="cda:value/@displayName"/>
                          <xsl:variable name="var_pc610_select_codeSystem" as="item()*" select="cda:value/@codeSystem"/>
                          <xsl:variable name="var_pc611_select_codeSystem" as="item()*" select="cda:name/@codeSystem"/>
                          <xsl:variable name="var_pc612_select_code" as="item()*" select="cda:name/@code"/>
                          <xsl:variable name="var_pc613_select_codeSystemName" as="item()*" select="cda:name/@codeSystemName"/>
                          <xsl:variable name="var_pc614_select_codeSystemName" as="item()*" select="cda:value/@codeSystemName"/>
                          <xsl:variable name="var_pc615_select_nullFlavor" as="item()*" select="cda:value/@nullFlavor"/>
                          <xsl:variable name="var_pc616_select_nullFlavor" as="item()*" select="cda:name/@nullFlavor"/>
                          <xsl:variable name="var_pc617_select_displayName" as="item()*" select="cda:name/@displayName"/>
                          <qualifier>
                              <name>
                                  <xsl:if test="fn:exists($var_pc616_select_nullFlavor)">
                                      <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc616_select_nullFlavor)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc612_select_code)">
                                      <xsl:attribute name="code" namespace="" select="fn:string($var_pc612_select_code)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc611_select_codeSystem)">
                                      <xsl:attribute name="codeSystem" namespace="" select="fn:string($var_pc611_select_codeSystem)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc613_select_codeSystemName)">
                                      <xsl:attribute name="codeSystemName" namespace="" select="fn:string($var_pc613_select_codeSystemName)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc617_select_displayName)">
                                      <xsl:attribute name="displayName" namespace="" select="fn:string($var_pc617_select_displayName)"/>
                                  </xsl:if>
                                  <xsl:for-each select="cda:name/cda:originalText">
                                      <originalText>
                                          <xsl:sequence select="fn:string(.)"/>
                                      </originalText>
                                  </xsl:for-each>
                                  <xsl:for-each select="cda:name/cda:qualifier">
                                      <qualifier>
                                          <xsl:sequence select="()"/>
                                      </qualifier>
                                  </xsl:for-each>
                              </name>
                              <value>
                                  <xsl:if test="fn:exists($var_pc615_select_nullFlavor)">
                                      <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc615_select_nullFlavor)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc608_select_code)">
                                      <xsl:attribute name="code" namespace="" select="fn:string($var_pc608_select_code)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc610_select_codeSystem)">
                                      <xsl:attribute name="codeSystem" namespace="" select="fn:string($var_pc610_select_codeSystem)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc614_select_codeSystemName)">
                                      <xsl:attribute name="codeSystemName" namespace="" select="fn:string($var_pc614_select_codeSystemName)"/>
                                  </xsl:if>
                                  <xsl:if test="fn:exists($var_pc609_select_displayName)">
                                      <xsl:attribute name="displayName" namespace="" select="fn:string($var_pc609_select_displayName)"/>
                                  </xsl:if>
                                  <xsl:for-each select="cda:value/cda:originalText">
                                      <originalText>
                                          <xsl:sequence select="fn:string(.)"/>
                                      </originalText>
                                  </xsl:for-each>
                                  <xsl:for-each select="cda:value/cda:qualifier">
                                      <qualifier>
                                          <xsl:sequence select="()"/>
                                      </qualifier>
                                  </xsl:for-each>
                              </value>
                          </qualifier>
                      </xsl:for-each>
                  </bodySite>
              </xsl:for-each>
              <xsl:for-each select="$procedure/cda:performer/cda:assignedEntity/cda:representedOrganization">
                  <procedureProvider>
                      <xsl:for-each select="cda:organizationID">
                          <xsl:variable name="var_pc618_select_extension" as="item()*" select="@extension"/>
                          <xsl:variable name="var_pc619_select_root" as="item()*" select="@root"/>
                          <xsl:variable name="var_pc620_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                          <id>
                              <xsl:if test="fn:exists($var_pc620_select_nullFlavor)">
                                  <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc620_select_nullFlavor)"/>
                              </xsl:if>
                              <xsl:if test="fn:exists($var_pc619_select_root)">
                                  <xsl:attribute name="root" namespace="" select="fn:string($var_pc619_select_root)"/>
                              </xsl:if>
                              <xsl:if test="fn:exists($var_pc618_select_extension)">
                                  <xsl:attribute name="extension" namespace="" select="fn:string($var_pc618_select_extension)"/>
                              </xsl:if>
                          </id>
                      </xsl:for-each>
                      <xsl:for-each select="cda:organizationName">
                          <xsl:variable name="var_pc621_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                          <name>
                              <xsl:if test="fn:exists($var_pc621_select_nullFlavor)">
                                  <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc621_select_nullFlavor)"/>
                              </xsl:if>
                              <xsl:for-each select="node()[./self::text()]">
                                  <xsl:sequence select="fn:string(.)"/>
                              </xsl:for-each>
                          </name>
                      </xsl:for-each>
                      <xsl:for-each select="cda:organizationTelecom">
                          <xsl:variable name="var_pc622_select_value" as="item()*" select="@value"/>
                          <xsl:variable name="var_pc623_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                          <telecom>
                              <xsl:if test="fn:exists($var_pc623_select_nullFlavor)">
                                  <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc623_select_nullFlavor)"/>
                              </xsl:if>
                              <xsl:if test="fn:exists($var_pc622_select_value)">
                                  <xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI(fn:string($var_pc622_select_value)))"/>
                              </xsl:if>
                          </telecom>
                      </xsl:for-each>
                      <xsl:for-each select="cda:organizationAddress">
                          <xsl:variable name="var_pc624_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                          <addr>
                              <xsl:if test="fn:exists($var_pc624_select_nullFlavor)">
                                  <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_pc624_select_nullFlavor)"/>
                              </xsl:if>
                              <xsl:for-each select="cda:state">
                                  <state>
                                      <xsl:for-each select="node()[./self::text()]">
                                          <xsl:sequence select="fn:string(.)"/>
                                      </xsl:for-each>
                                  </state>
                              </xsl:for-each>
                              <xsl:for-each select="cda:city">
                                  <city>
                                      <xsl:for-each select="node()[./self::text()]">
                                          <xsl:sequence select="fn:string(.)"/>
                                      </xsl:for-each>
                                  </city>
                              </xsl:for-each>
                              <xsl:for-each select="cda:postalCode">
                                  <postalCode>
                                      <xsl:for-each select="node()[./self::text()]">
                                          <xsl:sequence select="fn:string(.)"/>
                                      </xsl:for-each>
                                  </postalCode>
                              </xsl:for-each>
                              <xsl:for-each select="cda:streetAddressLine">
                                  <streetAddressLine>
                                      <xsl:for-each select="node()[./self::text()]">
                                          <xsl:sequence select="fn:string(.)"/>
                                      </xsl:for-each>
                                  </streetAddressLine>
                              </xsl:for-each>
                          </addr>
                      </xsl:for-each>
                  </procedureProvider>
              </xsl:for-each>
            </procedure>
    </xsl:template> -->                                
</xsl:stylesheet>