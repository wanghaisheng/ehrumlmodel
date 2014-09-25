<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt"/>
    <xsl:template name="resultsCCDA">
        <xsl:param name="results"/>
		<xsl:param name="mnemonic" />
		
		<xsl:for-each select="$results">
        <component>
			<section>
				<templateId root="2.16.840.1.113883.10.20.22.2.3" />
				<code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="RESULTS"/>
				<title>Results</title>
			    <text><xsl:apply-templates select="$results/toc:Text/node()"/></text>
                 <xsl:if test="$mnemonic=$DischargeSummary_Level3 or $mnemonic=$TOCDischargeSummary_Level3 or $mnemonic=$TOCDischargeInstructions_Level3 or $mnemonic=$TOCConsultationRequest_Level3 or $mnemonic=$TOCConsultationSummary_Level3">
	                 <xsl:if test="fn:exists($results/toc:ResultGroup)">
		            	<xsl:for-each select="$results/toc:ResultGroup">
		            		<entry>
		            		  <organizer moodCode="EVN" classCode="{./toc:GroupRole/@code}">
		            		    <templateId root="2.16.840.1.113883.10.20.22.4.1" />
		            		    <xsl:call-template name="idII">
		            		      <xsl:with-param name="idII" select="./toc:GroupID" as="node()" />
								</xsl:call-template>
								<xsl:call-template name="codeCD">
		            		      <xsl:with-param name="elementName" select="'code'" />
								  <xsl:with-param name="code" select="./toc:GroupCode" as="node()" />
								</xsl:call-template>
		            		    <statusCode code="completed" />
		            		    
		            		    <xsl:variable name="GroupSelectID"><xsl:value-of select="./toc:GroupID/@root"/></xsl:variable>
		            		    <xsl:for-each select="parent::*/toc:Result[toc:GroupID/@root=$GroupSelectID]">
		            		      <component>
		            		        <observation classCode="OBS" moodCode="EVN">
		            		          <templateId root="2.16.840.1.113883.10.20.22.4.2" />
		            		          <xsl:for-each select="./toc:ResultID">
			            		          <xsl:call-template name="idII">
			            		            <xsl:with-param name="idII" select="." as="node()" />
									      </xsl:call-template>
								      </xsl:for-each>
								      <xsl:call-template name="codeCD">
		            		            <xsl:with-param name="elementName" select="'code'" />
								        <xsl:with-param name="code" select="./toc:ResultType" as="node()" />
								      </xsl:call-template>
								      <statusCode code="{./toc:ResultStatus/@code}"/>
								      <xsl:call-template name="ivlTS">
								        <xsl:with-param name="elementName" select="'effectiveTime'"/>
								        <xsl:with-param name="ivlTS" select="./toc:ResultDateTime" as="node()"/>
								      </xsl:call-template>
								      <xsl:if test="./toc:ResultValue/gcda:integer">
								        <xsl:call-template name="valueINT">
								          <xsl:with-param name="value" select="./toc:ResultValue/gcda:integer"/>
								        </xsl:call-template>
								      </xsl:if>
								      <xsl:if test="./toc:ResultValue/gcda:monetaryAmount">
								        <xsl:call-template name="valueMO">
								          <xsl:with-param name="value" select="./toc:ResultValue/gcda:monetaryAmount"/>
								        </xsl:call-template>
								      </xsl:if>
								      <xsl:if test="./toc:ResultValue/gcda:physicalQuantity">
								        <xsl:call-template name="valuePQ">
								          <xsl:with-param name="value" select="./toc:ResultValue/gcda:physicalQuantity"/>
								        </xsl:call-template>
								      </xsl:if>
								     
								     <xsl:if test="./toc:ResultInterpretation">
								       <xsl:for-each select="./toc:ResultInterpretation">
									        <xsl:call-template name="codeCE">
									          <xsl:with-param name="code" select="." as="node()" />
			            		              <xsl:with-param name="elementName" select="'interpretationCode'" />
									        </xsl:call-template>
								        </xsl:for-each>
								      </xsl:if>
								      
								      <xsl:for-each select="./toc:ResultReferenceRange">
                						<referenceRange>
                    					  <observationRange>
	                    				    <text><xsl:value-of select="fn:string(.)"/></text>
										  </observationRange>
				                        </referenceRange>
                					  </xsl:for-each>
		            		        </observation>
		            		      </component>
		            		    </xsl:for-each>
		                      </organizer>
		                    </entry>
		            	</xsl:for-each>
		           	</xsl:if>
	           	</xsl:if>
			</section>
		</component>
		</xsl:for-each>
    </xsl:template>
</xsl:stylesheet>