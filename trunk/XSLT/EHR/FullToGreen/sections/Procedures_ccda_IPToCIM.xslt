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
	
	 <xsl:import href="../modules/Procedure_ccda_IPtoCIM.xslt"/>
       
    <xsl:template name="proceduresSectionCCDA">
        <xsl:param name="proceduresSection"/>
        <xsl:param name="srcMnemonic"/>
          <xsl:for-each select="$proceduresSection">
			<Procedures>
				<xsl:if test="fn:exists($proceduresSection/cda:text)">				
	              <xsl:for-each select="$proceduresSection/cda:text"> 
	               	   <Text> 
							<xsl:apply-templates select="node()"/>
		             	</Text>
	              </xsl:for-each>
              	</xsl:if>
              
              <xsl:if test="(($srcMnemonic and ($srcMnemonic='CCDA_TOC_DS_L3'))  or ($srcMnemonic and ($srcMnemonic='CCDA_TOC_CS_L3')) or ($srcMnemonic and ($srcMnemonic='CCDA_TOC_CR_L3')) ) ">
	          <!-- Procedure Activity Act -->
	          <xsl:if test="fn:exists($proceduresSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.12'])" >
	          	<xsl:for-each select="$proceduresSection/cda:entry/cda:act[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.12']" >
			          <xsl:variable name="procedureActModule" select="." as="node()"/>
			          <xsl:call-template name="procedureActivityAct">
			    	        <xsl:with-param name="procedureAct" select="$procedureActModule"/>
			          </xsl:call-template>
		          </xsl:for-each>
		      </xsl:if>
		      
		      
		       <!-- Procedure Activity Observation -->
		        <xsl:if test="fn:exists($proceduresSection/cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.13'])" >
	          		<xsl:for-each select="$proceduresSection/cda:entry/cda:observation[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.13']" >
		          	<xsl:variable name="procedureActivityObservation" select="." as="node()"/>
			          <xsl:call-template name="procedureActivityObservation">
			    	        <xsl:with-param name="procedureActivityObservation" select="$procedureActivityObservation"/>
			          </xsl:call-template>
		          </xsl:for-each>
		       </xsl:if>
		      
		       <!-- Procedure Activity Procedure -->
		        <xsl:if test="fn:exists($proceduresSection/cda:entry/cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.14'])" >
	          		<xsl:for-each select="$proceduresSection/cda:entry/cda:procedure[cda:templateId/@root='2.16.840.1.113883.10.20.22.4.14']" >
		          	<xsl:variable name="procedureActProcedureModule" select="." as="node()"/>
			          <xsl:call-template name="procedureActivityProcedure">
			    	        <xsl:with-param name="procedureActivityProcedure" select="$procedureActProcedureModule" />
			          </xsl:call-template>
		          </xsl:for-each>
		      </xsl:if>
	      </xsl:if>
		</Procedures>
	  </xsl:for-each>
    </xsl:template>        
</xsl:stylesheet>