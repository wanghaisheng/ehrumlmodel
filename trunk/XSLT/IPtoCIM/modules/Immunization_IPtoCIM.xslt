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

    <xsl:template name="immunizationModule">
        <xsl:param name="immunizationModule"/>
        <xsl:for-each select="$immunizationModule">     
            <xsl:variable name="var_im68_select_negationInd" as="item()*" select="@negationInd"/>
            <xsl:variable name="var_immMoodCode" as="item()*" select="@moodCode" />
            <Immunization>
	            <xsl:if test="fn:exists($var_im68_select_negationInd)">
	                <xsl:attribute name="RefusalInd" namespace="" select="xs:string(xs:boolean(fn:string($var_im68_select_negationInd)))"/>
	            </xsl:if>
	            
	            <!-- ImmunizationID -->
				<xsl:if test="fn:exists(cda:id)">
					<xsl:for-each select="cda:id">
				        <xsl:call-template name="idII">
							<xsl:with-param name="idII" select="." as="node()" />
							<xsl:with-param name="elementName" select="'ImmunizationID'" />
						</xsl:call-template>
				     </xsl:for-each>
			     </xsl:if>
			     
			     <!-- ImmunizationStatus -->
                <xsl:if test="fn:exists(cda:statusCode)">
					<xsl:for-each select="cda:statusCode">
				        <xsl:call-template name="codeCD">
							<xsl:with-param name="code" select="." as="node()" />
							<xsl:with-param name="elementName" select="'ImmunizationStatus'" />
						</xsl:call-template>
				     </xsl:for-each>
			     </xsl:if>
			     
			    <!-- ServiceType -->
			    <xsl:if test="fn:exists($var_immMoodCode)" >
					<ServiceType>
							<xsl:sequence select="fn:string($var_immMoodCode)"/>
				     </ServiceType>
			     </xsl:if>
			     
			     <!-- AdministeredDate -->
	            <xsl:for-each select="cda:effectiveTime">
		            <xsl:call-template name="tsTS">
		                <xsl:with-param name="tsTS" select="." as="node()" />
		                <xsl:with-param name="elementName" select="'AdministeredDate'" />
		            </xsl:call-template>
	            </xsl:for-each>
	            
	             <!-- MedicationSeriesNumber -->
                <xsl:for-each select="cda:entryRelationship[@typeCode='SUBJ']/cda:observation/cda:value[@xsi:type='PQ']">
                      <xsl:call-template name="valuePQ">
                          <xsl:with-param name="value" select="." as="node()" />
                          <xsl:with-param name="elementName" select="'MedicationSeriesNumber'" />
                      </xsl:call-template>
                </xsl:for-each>
                
                <!-- Reaction -->
                <xsl:for-each select="cda:entryRelationship[@typeCode='CAUS']/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.1.54']/cda:code">
                      <xsl:call-template name="codeCD">
                          <xsl:with-param name="code" select="." as="node()" />
                          <xsl:with-param name="elementName" select="'Reaction'" />
                      </xsl:call-template>
                </xsl:for-each>
	            
	            <!-- Provider -->
	             <xsl:for-each select="cda:performer/cda:assignedEntity/cda:representedOrganization">
			          <xsl:call-template name="organization">
			              <xsl:with-param name="organization" select="." as="node()" />
			              <xsl:with-param name="elementName" select="'Provider'" />
			          </xsl:call-template>
               </xsl:for-each>
               
               	<!-- Medication Information -->
                  <xsl:for-each select="cda:consumable/cda:manufacturedProduct">
                         <xsl:variable name="var669_cur" as="node()" select="." />
                         <xsl:for-each select="cda:manufacturedMaterial">
                             <xsl:variable name="var631_code" as="node()?"                                   
                                 select="cda:code" />
                             <MedicationInformation>
                                 <xsl:for-each select="$var631_code">
                                     <xsl:variable name="var632_nullFlavor" as="node()?"
                                         select="@nullFlavor" />
                                     <xsl:variable name="var633_codeSystemName" as="node()?"
                                         select="@codeSystemName" />
                                     <xsl:variable name="var634_codeSystem" as="node()?"
                                         select="@codeSystem" />
                                     <xsl:variable name="var635_displayName" as="node()?"
                                         select="@displayName" />
                                     <xsl:variable name="var636_code" as="node()?"
                                         select="@code" />
                                     <CodedProductName>
                                         <xsl:if test="fn:exists($var636_code)">
                                             <xsl:attribute name="code" namespace=""
                                                 select="fn:string($var636_code)" />
                                         </xsl:if>
                                         <xsl:if test="fn:exists($var635_displayName)">
                                             <xsl:attribute name="displayName" namespace=""
                                                 select="fn:string($var635_displayName)" />
                                         </xsl:if>
                                         <xsl:if test="fn:exists($var634_codeSystem)">
                                             <xsl:attribute name="codeSystem" namespace=""
                                                 select="fn:string($var634_codeSystem)" />
                                         </xsl:if>
                                         <xsl:if test="fn:exists($var633_codeSystemName)">
                                             <xsl:attribute name="codeSystemName"
                                                 namespace="" select="fn:string($var633_codeSystemName)" />
                                         </xsl:if>
                                         <xsl:if test="fn:exists($var632_nullFlavor)">
                                             <xsl:attribute name="nullFlavor" namespace=""
                                                 select="fn:string($var632_nullFlavor)" />
                                         </xsl:if>
                                         <!-- 
                                         <gcda:originalText>
                                             <xsl:for-each
                                                 select="cda:originalText/node()[fn:boolean(self::text())]">
                                                 <xsl:sequence select="fn:string(.)" />
                                             </xsl:for-each>
                                         </gcda:originalText>
                                          -->
                                         <xsl:for-each select="cda:qualifier">
                                             <xsl:call-template name="qualifier">
                                                 <xsl:with-param name="qualifier" select="." as="node()" />
                                             </xsl:call-template>
                                         </xsl:for-each>
                                     </CodedProductName>
                                 </xsl:for-each>
                                 <xsl:for-each select="$var631_code/cda:translation">
                                     <xsl:variable name="var647_nullFlavor" as="node()?"
                                         select="@nullFlavor" />
                                     <xsl:variable name="var648_codeSystemName" as="node()?"
                                         select="@codeSystemName" />
                                     <xsl:variable name="var649_codeSystem" as="node()?"
                                         select="@codeSystem" />
                                     <xsl:variable name="var650_displayName" as="node()?"
                                         select="@displayName" />
                                     <xsl:variable name="var651_code" as="node()?"
                                         select="@code" />
                                     <CodedBrandName>
                                         <xsl:if test="fn:exists($var651_code)">
                                             <xsl:attribute name="code" namespace=""
                                                 select="fn:string($var651_code)" />
                                         </xsl:if>
                                         <xsl:if test="fn:exists($var650_displayName)">
                                             <xsl:attribute name="displayName" namespace=""
                                                 select="fn:string($var650_displayName)" />
                                         </xsl:if>
                                         <xsl:if test="fn:exists($var649_codeSystem)">
                                             <xsl:attribute name="codeSystem" namespace=""
                                                 select="fn:string($var649_codeSystem)" />
                                         </xsl:if>
                                         <xsl:if test="fn:exists($var648_codeSystemName)">
                                             <xsl:attribute name="codeSystemName"
                                                 namespace="" select="fn:string($var648_codeSystemName)" />
                                         </xsl:if>
                                         <xsl:if test="fn:exists($var647_nullFlavor)">
                                             <xsl:attribute name="nullFlavor" namespace=""
                                                 select="fn:string($var647_nullFlavor)" />
                                         </xsl:if>
                                          <!--  
                                         <xsl:for-each select="cda:originalText">
                                             <gcda:originalText>
                                                 <xsl:for-each select="node()[fn:boolean(self::text())]">
                                                     <xsl:sequence select="fn:string(.)" />
                                                 </xsl:for-each>
                                             </gcda:originalText>
                                         </xsl:for-each>
                                         -->
                                         <xsl:for-each select="cda:qualifier">
                                             <xsl:call-template name="qualifier">
                                                 <xsl:with-param name="qualifier" select="." as="node()" />
                                             </xsl:call-template>
                                         </xsl:for-each>
                                     </CodedBrandName>
                                 </xsl:for-each>
                                  
                             <FreeTextProductName>                               
                             <xsl:for-each select="$var631_code/cda:originalText/node()[fn:boolean(self::text())]"> 
                                         <!-- <xsl:sequence select="fn:string(.)"/> -->
                                    <xsl:apply-templates select="."/>
                              </xsl:for-each>
                             </FreeTextProductName>
                             <!-- 
                             <xsl:choose>
                             	<xsl:when test="fn:exists($var631_code/cda:originalText/node()[fn:boolean(self::text())])">
	                             	<FreeTextBrandName>
	                             		<xsl:for-each select="$var631_code/cda:originalText/node()[fn:boolean(self::text())]"> 
                                         	<xsl:sequence select="fn:string(.)"/>
                              			</xsl:for-each>
	                             	</FreeTextBrandName>
                             	</xsl:when>
                             	<xsl:otherwise test="fn:exists($var631_code/cda:originalText/cda:reference)">
                             		<FreeTextBrandName>
                             			<xsl:sequence select="fn:string(@value)"/>
                             		</FreeTextBrandName>
                             	</xsl:otherwise>
                             	</xsl:choose> -->
                             
                             
                                 <xsl:for-each select="cda:name">
                                     <FreeTextBrandName>
                                         <xsl:sequence select="fn:string(.)" />
                                     </FreeTextBrandName>
                                 </xsl:for-each>
                                 <xsl:for-each select="$var669_cur/cda:manufacturerOrganization">
                                     <xsl:call-template name="organization">
                                         <xsl:with-param name="organization" select="." as="node()" />
                                         <xsl:with-param name="elementName" select="'drugManufacturer'" />
                                     </xsl:call-template>
                                 </xsl:for-each>
                             </MedicationInformation>
                     </xsl:for-each>
                  </xsl:for-each>
                  
                  <!-- Refusal Reason -->
	            <xsl:for-each select="cda:entryRelationship[@typeCode='RSON']/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.1.27']/cda:code">
		            <xsl:call-template name="codeCD">
		                <xsl:with-param name="code" select="." as="node()" />
		                <xsl:with-param name="elementName" select="'RefusalReason'" />
		            </xsl:call-template>
	            </xsl:for-each>
               
	            <!-- Immunization Text -->
	            	<!-- <xsl:if test="fn:exists(cda:text)"> -->
                            <Text> 
                            <!-- <xsl:sequence select="(./@node(), ./node())"/> -->
                            	<!-- <xsl:apply-templates select="(./@node(), ./node())"/> -->
                            	<xsl:apply-templates select="cda:text/node()"/>
                        	</Text> 
                     <!-- </xsl:if> -->
                     <xsl:if test="fn:exists(cda:text/cda:reference)">
                     <Text>
                     	<xsl:sequence select="fn:string(@value)" />
                     </Text>
                     </xsl:if>
	            </Immunization>
            </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>