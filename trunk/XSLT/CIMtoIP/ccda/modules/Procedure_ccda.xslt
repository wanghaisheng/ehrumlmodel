<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps_ccda.xslt"/>
    <xsl:template name="procedureCCDA">
        <xsl:param name="procedure"/>
        <xsl:param name="mnemonic"/> 
       <xsl:param name="where-from"/> 

            <xsl:if test="($mnemonic and ($where-from='poc'))">
            	<!-- CONF:8809 -->
            	<entry>
	            	<!-- CONF:8568; CONF:8569; -->
	            	<procedure classCode="PROC">
	                	<xsl:attribute name="moodCode" namespace="" select="$procedure/toc:ServiceType"/>
	                <!-- CONF:8810; CONF:8570; CONF:10513 -->
	                	<templateId root="2.16.840.1.113883.10.20.22.4.41"/>
	                	   <!-- CONF:8571; -->
		                <xsl:for-each select="$procedure/toc:ProcedureID">
		                    <xsl:call-template name="idII">
		                        <xsl:with-param name="idII" select="." as="node()" />
		                    </xsl:call-template>
		                </xsl:for-each>
		             </procedure>
        		</entry>
	          </xsl:if>
                
            <!--   <xsl:if test="(($mnemonic and ($mnemonic='CCDA_TOC_CS_L3')) or ($mnemonic and ($mnemonic='CCDA_TOC_CR_L3')) or ($mnemonic and ($mnemonic='CCDA_TOC_DS_L3')))"> -->
            <xsl:if test="($mnemonic and ($where-from='procedures'))">
            	<xsl:variable name="var_procedureClass" select="$procedure/toc:ProcedureClass" />
            	<xsl:if test="($var_procedureClass='ACT')">
              	<!-- Procedure Activity Procedure -->
               		<!-- <entry typeCode="DRIV"> -->
               		<entry>               		
               			<act classCode="ACT">
               			<!-- TODO: Check tomorrow whether we need to pass in the moodCode attribute -->
               			<xsl:attribute name="moodCode" namespace="" select="'INT'"/>
               			 <templateId root="2.16.840.1.113883.10.20.22.4.12"/>
			                <xsl:for-each select="$procedure/toc:ProcedureID">
			                    <xsl:call-template name="idII">
			                        <xsl:with-param name="idII" select="." as="node()" />
			                    </xsl:call-template>
			                </xsl:for-each>
			
			                <xsl:for-each select="$procedure/toc:ProcedureType">
					         	 <xsl:call-template name="procedureType">
					                 <xsl:with-param name="procedureType" select="." as="node()" />
					                 <xsl:with-param name="procedureFreeTextType" select="$procedure/toc:ProcedureFreeTextType"/>
					             </xsl:call-template>
							</xsl:for-each>
			                
			                <xsl:for-each select="$procedure/toc:ProcedureStatus">
			                	<xsl:call-template name="codeCD">
				                    <xsl:with-param name="code" select="." as="node()" />
				                    <xsl:with-param name="elementName" select="'statusCode'" />
				                </xsl:call-template>
			                </xsl:for-each>
			                
			                <xsl:if test="fn:exists($procedure/toc:Text/toc:reference)">
				                <xsl:for-each select="$procedure/toc:Text/toc:reference">
					                <text>
						                <xsl:for-each select="node()[./self::text()]">
						                       <xsl:sequence select="fn:string(.)"/>
						                </xsl:for-each>
									</text>
								</xsl:for-each>
							</xsl:if>
							
			                <xsl:for-each select="$procedure/toc:ProcedureDateTime">
			                    <xsl:call-template name="ivlTS">
			                        <xsl:with-param name="ivlTS" select="." as="node()" />
			                        <xsl:with-param name="elementName" select="'effectiveTime'" />
			                    </xsl:call-template>
			                </xsl:for-each>
			                
			               <xsl:for-each select="$procedure/toc:ProcedurePerformer">
                 				<xsl:call-template name="procedureProvider">
                      				<xsl:with-param name="provider" select="." as="node()" />
                  				</xsl:call-template>
	      	  				</xsl:for-each>
			            </act>
			         </entry>
			        </xsl:if>
			        
       <!-- Procedure Activity Observation -->
       <xsl:if test="($var_procedureClass='OBS')">
         <entry>
      		<observation classCode="OBS">
      		<!-- TODO: Check tomorrow whether we need to pass in these attributes -->
      			<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
      		 	<templateId root="2.16.840.1.113883.10.20.22.4.13"/>
         <xsl:for-each select="$procedure/toc:ProcedureID">
             <xsl:call-template name="idII">
                 <xsl:with-param name="idII" select="." as="node()" />
             </xsl:call-template>
         </xsl:for-each>

           <xsl:for-each select="$procedure/toc:ProcedureType">
         	 <xsl:call-template name="procedureType">
                 <xsl:with-param name="procedureType" select="." as="node()" />
                 <xsl:with-param name="procedureFreeTextType" select="$procedure/toc:ProcedureFreeTextType"/>
             </xsl:call-template>
		    </xsl:for-each>
          
	          <xsl:for-each select="$procedure/toc:ProcedureStatus">
	          	<xsl:call-template name="codeCD">
	               <xsl:with-param name="code" select="." as="node()" />
	               <xsl:with-param name="elementName" select="'statusCode'" />
	           </xsl:call-template>
	          </xsl:for-each>
	          
	          <value xsi:type="CD"/>
	          
	            <xsl:for-each select="$procedure/toc:ProcedureDateTime">
	              <xsl:call-template name="ivlTS">
	                  <xsl:with-param name="ivlTS" select="." as="node()" />
	                  <xsl:with-param name="elementName" select="'effectiveTime'" />
	              </xsl:call-template>
	          </xsl:for-each>
          
	         <xsl:for-each select="$procedure/toc:ProcedureBodyType">
	          <xsl:call-template name="codeCD">
	              <xsl:with-param name="code" select="." as="node()" />
	              <xsl:with-param name="elementName" select="'targetSiteCode'" />
	          </xsl:call-template>
	         </xsl:for-each>
        	
        	  <xsl:for-each select="$procedure/toc:ProcedureProvider">
                 <xsl:call-template name="procedureProvider">
                      <xsl:with-param name="provider" select="." as="node()" />
                  </xsl:call-template>
	      	  </xsl:for-each>
	    	</observation>
	  	</entry>
	  	</xsl:if>
	  	
	  	<!-- Procedure Activity Procedure -->
	  	<xsl:if test="($var_procedureClass='PROC')">
         <entry>
      		<procedure classCode="PROC">
      			<!-- TODO: Check tomorrow whether we need to pass in the moodCode attribute -->
      			<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
      		 	<templateId root="2.16.840.1.113883.10.20.22.4.14"/>
		         <xsl:for-each select="$procedure/toc:ProcedureID">
		             <xsl:call-template name="idII">
		                 <xsl:with-param name="idII" select="." as="node()" />
		             </xsl:call-template>
		         </xsl:for-each>
		         
		         <xsl:for-each select="$procedure/toc:ProcedureType">
		         	 <xsl:call-template name="procedureType">
		                 <xsl:with-param name="procedureType" select="." as="node()" />
		                 <xsl:with-param name="procedureFreeTextType" select="$procedure/toc:ProcedureFreeTextType"/>
		             </xsl:call-template>
		         </xsl:for-each>

			          <xsl:for-each select="$procedure/toc:ProcedureStatus">
			          	<xsl:call-template name="codeCD">
			               <xsl:with-param name="code" select="." as="node()" />
			               <xsl:with-param name="elementName" select="'statusCode'" />
			           </xsl:call-template>
			          </xsl:for-each>
	          
			          <xsl:if test="fn:exists($procedure/toc:Text/toc:reference)">
		                <xsl:for-each select="$procedure/toc:Text/toc:reference">
			                <text>
				                <xsl:for-each select="node()[./self::text()]">
				                       <xsl:sequence select="fn:string(.)"/>
				                </xsl:for-each>
							</text>
						</xsl:for-each>
					</xsl:if>
					
			            <xsl:for-each select="$procedure/toc:ProcedureDateTime">
			              <xsl:call-template name="ivlTS">
			                  <xsl:with-param name="ivlTS" select="." as="node()" />
			                  <xsl:with-param name="elementName" select="'effectiveTime'" />
			              </xsl:call-template>
			          </xsl:for-each>
          
			         <xsl:for-each select="$procedure/toc:BodySite">
			          <xsl:call-template name="codeCD">
			              <xsl:with-param name="code" select="." as="node()" />
			              <xsl:with-param name="elementName" select="'targetSiteCode'" />
			          </xsl:call-template>
			         </xsl:for-each>
          
		          <xsl:for-each select="$procedure/toc:ProcedureProvider">
	                    <xsl:call-template name="procedureProvider">
	                        <xsl:with-param name="provider" select="." as="node()" />
	                    </xsl:call-template>
			      </xsl:for-each>
	    	  </procedure>
	  	</entry>
	  	</xsl:if>
      </xsl:if>
    </xsl:template>
    
    <xsl:template name="procedureType">
    	<xsl:param name="procedureType"/>
    	<xsl:param name ="procedureFreeTextType" />
    	
     		<xsl:for-each select="$procedureType">
             <xsl:variable name="var579_select_displayName" as="item()*" select="@displayName"/>
             <xsl:variable name="var580_select_codeSystem" as="item()*" select="@codeSystem"/>
             <xsl:variable name="var581_select_code" as="item()*" select="@code"/>
             <xsl:variable name="var582_select_nullFlavor" as="item()*" select="@nullFlavor"/>
             <xsl:variable name="var583_select_codeSystemName" as="item()*" select="@codeSystemName"/>
             <code>
                 <xsl:if test="fn:exists($var582_select_nullFlavor)">
                     <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var582_select_nullFlavor)"/>
                 </xsl:if>
                 <xsl:if test="fn:exists($var581_select_code)">
                     <xsl:attribute name="code" namespace="" select="fn:string($var581_select_code)"/>
                 </xsl:if>
                 <xsl:if test="fn:exists($var580_select_codeSystem)">
                     <xsl:attribute name="codeSystem" namespace="" select="fn:string($var580_select_codeSystem)"/>
                 </xsl:if>
                 <xsl:if test="fn:exists($var583_select_codeSystemName)">
                     <xsl:attribute name="codeSystemName" namespace="" select="fn:string($var583_select_codeSystemName)"/>
                 </xsl:if>
                 <xsl:if test="fn:exists($var579_select_displayName)">
                     <xsl:attribute name="displayName" namespace="" select="fn:string($var579_select_displayName)"/>
                 </xsl:if>
                 
                 <xsl:for-each select="$procedureFreeTextType">
                     <originalText>
                     	<reference>
                         	<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
                         </reference>
                     </originalText>
                 </xsl:for-each> 
                 
	         <xsl:for-each select="gcda:qualifier">
	             <xsl:call-template name="qualifier">
	                 <xsl:with-param name="qualifier" select="." as="node()" />
	             </xsl:call-template>
		         </xsl:for-each>
              </code>
          </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="procedureProvider">
    <xsl:param name="provider"/>
     <xsl:for-each select="$provider">
	       <performer>
	           <assignedEntity>
	             <xsl:for-each select="gcda:organizationID">
	               <xsl:call-template name="idII">
	                   <xsl:with-param name="idII" select="." as="node()" />
	               </xsl:call-template>
	             </xsl:for-each>
	             <xsl:for-each select="gcda:organizationAddress">
                      <xsl:call-template name="address">
                          <xsl:with-param name="address" select="." as="node()" />
                      </xsl:call-template>
                  </xsl:for-each>
                  <xsl:for-each select="gcda:organizationTelecom">
                      <xsl:call-template name="telecom">
                          <xsl:with-param name="telecom" select="." as="node()" />
                      </xsl:call-template>
                  </xsl:for-each>
                  <xsl:if test="fn:exists(gcda:organizationName)">
	                  <representedOrganization>
			              <xsl:for-each select="gcda:organizationName">
		                      <xsl:call-template name="organizationName">
		                          <xsl:with-param name="organizationName" select="." as="node()" />
		                      </xsl:call-template>
		                  </xsl:for-each>
		                  <telecom nullFlavor="UNK"/>
        				  <addr nullFlavor="UNK"/>
	                  </representedOrganization>
                  </xsl:if>
	          	  </assignedEntity>
	      	  </performer>
       	  </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>