<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri"
	xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">
       
    <xsl:import href="../templates.xslt"/>
       
    <xsl:template name="resultsSectionCCDA">
        <xsl:param name="resultsSection"/>
        <xsl:param name="srcMnemonic"/>
			<Results>				
              <xsl:for-each select="$resultsSection/cda:text"> 
                  	<Text> 
						<xsl:apply-templates select="$resultsSection/cda:text/node()"/>
	             	</Text>
              </xsl:for-each>
              <xsl:if test="$srcMnemonic=$DischargeSummary_Level3 or $srcMnemonic=$TOCDischargeSummary_Level3 or $srcMnemonic=$TOCDischargeInstructions_Level3 or $srcMnemonic=$TOCConsultationRequest_Level3 or $srcMnemonic=$TOCConsultationSummary_Level3">
	                 <xsl:if test="fn:exists($resultsSection/cda:entry/cda:organizer)">
		            	<xsl:for-each select="$resultsSection/cda:entry/cda:organizer">
		            		<ResultGroup>
		            		  <xsl:call-template name="idII">
		            		  	  <xsl:with-param name="elementName" select="'GroupID'" />
		            		      <xsl:with-param name="idII" select="./cda:id" as="node()" />
							  </xsl:call-template>
							  <GroupRole code="{@classCode}"/>
							  <xsl:call-template name="codeCD">
		            		      <xsl:with-param name="elementName" select="'GroupCode'" />
								  <xsl:with-param name="code" select="./cda:code" as="node()" />
							  </xsl:call-template>
		            		</ResultGroup>
		            	</xsl:for-each>
		            	<xsl:for-each select="$resultsSection/cda:entry/cda:organizer/cda:component/cda:observation">
		            		<Result>
		            		  <xsl:call-template name="idII">
		            		    <xsl:with-param name="elementName" select="'GroupID'" />
		            		    <xsl:with-param name="idII" select="parent::*/parent::*/cda:id" as="node()" />
		            		  </xsl:call-template>
		            		  <xsl:for-each select="./cda:id">
			            		  <xsl:call-template name="idII">
			            		    <xsl:with-param name="elementName" select="'ResultID'" />
			            		    <xsl:with-param name="idII" select="." as="node()" />
			            		  </xsl:call-template>
		            		  </xsl:for-each>
		            		  <xsl:call-template name="codeCD">
		            		      <xsl:with-param name="elementName" select="'ResultType'" />
								  <xsl:with-param name="code" select="./cda:code" as="node()" />
							  </xsl:call-template>
							  <xsl:call-template name="codeCD">
		            		      <xsl:with-param name="elementName" select="'ResultStatus'" />
								  <xsl:with-param name="code" select="./cda:statusCode" as="node()" />
							  </xsl:call-template>
							  <xsl:call-template name="ivlTS">
								  <xsl:with-param name="elementName" select="'ResultDateTime'"/>
								  <xsl:with-param name="ivlTS" select="./cda:effectiveTime" as="node()"/>
						      </xsl:call-template>
						      <xsl:for-each select="./cda:value[@xsi:type='INT']">
						        <ResultValue>
								  <xsl:call-template name="gcdaINT">
								    <xsl:with-param name="value" select="."/>
								  </xsl:call-template>
								</ResultValue>
							  </xsl:for-each>
							  <xsl:for-each select="./cda:value[@xsi:type='MO']">
						        <ResultValue>
								  <xsl:call-template name="gcdaMO">
								    <xsl:with-param name="value" select="."/>
								  </xsl:call-template>
								</ResultValue>
							  </xsl:for-each>
							  <xsl:for-each select="./cda:value[@xsi:type='PQ']">
						        <ResultValue>
								  <xsl:call-template name="gcdaPQ">
								    <xsl:with-param name="value" select="."/>
								  </xsl:call-template>
								</ResultValue>
							  </xsl:for-each>
							  
							  <xsl:if test="./cda:interpretationCode">
							  	<xsl:for-each select="./cda:interpretationCode">
							        <xsl:call-template name="codeCE">
	            		              <xsl:with-param name="elementName" select="'ResultInterpretation'" />
							          <xsl:with-param name="code" select="." as="node()" />
							        </xsl:call-template>
						        </xsl:for-each>
						      </xsl:if>
						      <xsl:for-each select="./cda:referenceRange/cda:observationRange/cda:text">
              				    <ResultReferenceRange><xsl:value-of select="fn:string(.)"/></ResultReferenceRange>
              			      </xsl:for-each>								      
		            		</Result>   
		            	</xsl:for-each>
		           	</xsl:if>
	           	</xsl:if>
			</Results>
    </xsl:template>        
</xsl:stylesheet>