<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">
	
	<xsl:import href="../modules/Procedure_IPtoCIM.xslt"/>
    <xsl:import href="../../common/functions.xslt"/>   
    <xsl:template name="resultsSection">
        <xsl:param name="resultsSection"/>
        <Results>
	    
	    <xsl:if test="fn:exists($resultsSection/cda:text)">				
             <xsl:for-each select="$resultsSection/cda:text"> 
              	   <Text> 
					<xsl:apply-templates select="node()"/>
             	</Text>
             </xsl:for-each>
        </xsl:if>
          
          <xsl:for-each select="$resultsSection/cda:entry/cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.1.29']">
            <xsl:call-template name="procedureModule">
              <xsl:with-param name="procedureModule" select="(self::node())"></xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
          <xsl:for-each select="$resultsSection/cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.31']">
            <Result>
              <xsl:variable name="var_rs173_select_codeSystemName" as="item()*" select="cda:value/@codeSystemName"/>
              <xsl:variable name="var_rs174_select_code" as="item()*" select="cda:value/@code"/>
              <xsl:variable name="var_rs175_select_nullFlavor" as="item()*" select="cda:value/@nullFlavor"/>
              <xsl:variable name="var_rs176_select_codeSystem" as="item()*" select="cda:value/@codeSystem"/>
              <xsl:variable name="var_rs177_select_displayName" as="item()*" select="cda:value/@displayName"/>
              <xsl:for-each select="cda:id">
	              <xsl:call-template name="idII">
	                  <xsl:with-param name="idII" select="." as="node()" />
	                  <xsl:with-param name="elementName" select="'resultID'" />
	              </xsl:call-template>
              </xsl:for-each>
              <xsl:for-each select="cda:code">
                  <xsl:call-template name="codeCD">
                      <xsl:with-param name="code" select="." as="node()" />
                      <xsl:with-param name="elementName" select="'resultType'" />
                  </xsl:call-template>
              </xsl:for-each>
              <ResultStatus>
                  <xsl:attribute name="code" namespace="" select="cda:statusCode/@code"/>
              </ResultStatus>
              
              <xsl:for-each select="cda:effectiveTime">
	              <xsl:call-template name="ivlTS">
	                  <xsl:with-param name="ivlTS" select="." as="node()" />
	                  <xsl:with-param name="elementName" select="'resultDateTime'" />
	              </xsl:call-template>
              </xsl:for-each>
              
              <ResultValue>
                <xsl:if test="fn:exists($var_rs175_select_nullFlavor)">
                  <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var_rs175_select_nullFlavor)"/>
                </xsl:if>
                <xsl:if test="fn:exists($var_rs174_select_code)">
                  <xsl:attribute name="code" namespace="" select="fn:string($var_rs174_select_code)"/>
                </xsl:if>
                <xsl:if test="fn:exists($var_rs176_select_codeSystem)">
                  <xsl:attribute name="codeSystem" namespace="" select="fn:string($var_rs176_select_codeSystem)"/>
                </xsl:if>
                <xsl:if test="fn:exists($var_rs173_select_codeSystemName)">
                  <xsl:attribute name="codeSystemName" namespace="" select="fn:string($var_rs173_select_codeSystemName)"/>
                </xsl:if>
                <xsl:if test="fn:exists($var_rs177_select_displayName)">
                  <xsl:attribute name="displayName" namespace="" select="fn:string($var_rs177_select_displayName)"/>
                </xsl:if>
                <xsl:for-each select="cda:value/cda:originalText">
                  <originalText>
                    <xsl:sequence select="fn:string(.)"/>
                  </originalText>
                </xsl:for-each>
                <xsl:for-each select="cda:value">
                  <xsl:variable name="var_rs203_select_value" as="item()*" select="@value"/>
                  <xsl:variable name="var_rs204_select_unit" as="item()*" select="@unit"/>
                    <gcda:physicalQuantity>
                      <xsl:if test="fn:exists($var_rs203_select_value)">
                        <xsl:attribute name="value" namespace="" select="fn:string($var_rs203_select_value)"/>
                      </xsl:if>
                      <xsl:if test="fn:exists($var_rs204_select_unit)">
                        <xsl:attribute name="unit" namespace="" select="fn:string($var_rs204_select_unit)"/>
                      </xsl:if>
                    </gcda:physicalQuantity>
                </xsl:for-each>
              </ResultValue>
              <xsl:for-each select="cda:interpretationCode">
                  <xsl:call-template name="codeCD">
                      <xsl:with-param name="code" select="." as="node()" />
                      <xsl:with-param name="elementName" select="'resultInterpretation'" />
                  </xsl:call-template>
              </xsl:for-each>             
              <xsl:for-each select="cda:referenceRange/cda:observationRange/cda:text">
               <ResultReferenceRange>
	                        <xsl:sequence select="fn:string(.)"/>
	           </ResultReferenceRange>
               </xsl:for-each>                
            </Result>
          </xsl:for-each>
        </Results>
    </xsl:template>
</xsl:stylesheet>