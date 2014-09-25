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
  
    <xsl:template name="procedureActivityAct">
        <xsl:param name="procedureAct"/>
        <xsl:for-each select="$procedureAct">     
		<xsl:variable name="var1028_code" as="node()?" select="cda:code" />
		<xsl:variable name="var_moodCode" as="item()*" select="@moodCode" />
		
			<Procedure>
            <xsl:for-each select="cda:id">
                <xsl:call-template name="idII">
                    <xsl:with-param name="idII" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'ProcedureID'" />
                </xsl:call-template>
            </xsl:for-each>
            
            <!--  Procedure Class -->
				<ProcedureClass>
					<xsl:sequence select="'ACT'" />
				</ProcedureClass>

           <!--  TODO: Fix the CIM structure, as it is causing the template usage to produce messed up output 
            <xsl:for-each select="cda:code">
                <xsl:call-template name="codeCD">
                    <xsl:with-param name="code" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'procedureType'" />
                </xsl:call-template>
            </xsl:for-each>
            -->
            
           <!--  Procedure Type -->
            <xsl:for-each select="cda:code">
		            <xsl:call-template name="procedureType">
		                <xsl:with-param name="code" select="." as="node()" />
		                <xsl:with-param name="elementName" select="'ProcedureType'" />
		            </xsl:call-template>
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
			
			<!-- Procedure Provider/ Performer -->
			<xsl:for-each select="cda:performer/cda:assignedEntity">
				<xsl:call-template name="assignedEntityPerformer">
				    <xsl:with-param name="assignedEntityPerformer" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'ProcedurePerformer'" />
				</xsl:call-template>
			</xsl:for-each>
	
			
				<!-- ServiceType -->
				<ServiceType>
						<xsl:sequence select="fn:string($var_moodCode)"/>
			     </ServiceType>
				
				<!-- ProcedureStatus -->
				<xsl:if test="fn:exists(cda:statusCode)" >
					<ProcedureStatus>
		                <xsl:attribute name="code" select="cda:statusCode/@code"/>
		            </ProcedureStatus>
	            </xsl:if>
				
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
    
      <!--  Procedure Activity Observation -->
    <xsl:template name="procedureActivityObservation">
        <xsl:param name="procedureActivityObservation"/>
        <xsl:for-each select="$procedureActivityObservation">     
		<xsl:variable name="var1028_code" as="node()?" select="cda:code" />
		<xsl:variable name="var_moodCode" as="item()*" select="@moodCode" />
		
			<Procedure>
            <xsl:for-each select="cda:id">
                <xsl:call-template name="idII">
                    <xsl:with-param name="idII" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'ProcedureID'" />
                </xsl:call-template>
            </xsl:for-each>
            
            <!--  Procedure Class -->
				<ProcedureClass>
					<xsl:sequence select="'OBS'" />
				</ProcedureClass>

			<!--  Procedure Type -->
            <xsl:for-each select="cda:code">
		            <xsl:call-template name="procedureType">
		                <xsl:with-param name="code" select="." as="node()" />
		                <xsl:with-param name="elementName" select="'ProcedureType'" />
		            </xsl:call-template>
            </xsl:for-each>
            
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
                    <xsl:with-param name="elementName" select="'ProcedureBodyType'" />
                </xsl:call-template>
			</xsl:for-each>
			
			<!-- Procedure Provider/ Performer -->
			<xsl:for-each select="cda:performer/cda:assignedEntity">
				<xsl:call-template name="assignedEntityPerformer">
				    <xsl:with-param name="assignedEntityPerformer" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'ProcedureProvider'" />
				</xsl:call-template>
			</xsl:for-each>
			
				<!-- ServiceType -->
				<ServiceType>
						<xsl:sequence select="fn:string($var_moodCode)"/>
			     </ServiceType>
			     
			     <!-- ProcedureValue -->
			    <!--  <xsl:for-each select="cda:value">
				     <xsl:call-template name="valueCD">
	       					 <xsl:with-param name="value" select ="."/>
	        				<xsl:with-param name="elementName" select="'ProcedureValue'" />
	        		</xsl:call-template>
        		</xsl:for-each>
				 -->
				<!-- ProcedureStatus -->
				<xsl:if test="fn:exists(cda:statusCode)" >
					<ProcedureStatus>
		                <xsl:attribute name="code" select="cda:statusCode/@code"/>
		            </ProcedureStatus>
	            </xsl:if>
				
                <xsl:for-each select="cda:text"> 
                    <Text> 
                    <xsl:sequence select="(./@node(), ./node())"/>
                </Text> 
                </xsl:for-each>
    		</Procedure>
		</xsl:for-each>
    </xsl:template>
    
    <!--  Procedure Activity Procedure -->
    <xsl:template name="procedureActivityProcedure">
        <xsl:param name="procedureActivityProcedure"/>
        <xsl:for-each select="$procedureActivityProcedure">     
		<xsl:variable name="var1028_code" as="node()?" select="cda:code" />
		<xsl:variable name="var_moodCode" as="item()*" select="@moodCode" />
		
			<Procedure>
            <xsl:for-each select="cda:id">
                <xsl:call-template name="idII">
                    <xsl:with-param name="idII" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'ProcedureID'" />
                </xsl:call-template>
            </xsl:for-each>
            
            <!--  Procedure Class -->
				<ProcedureClass>
					<xsl:sequence select="'PROC'" />
				</ProcedureClass>

			<!--  Procedure Type -->
            <xsl:for-each select="cda:code">
		            <xsl:call-template name="procedureType">
		                <xsl:with-param name="code" select="." as="node()" />
		                <xsl:with-param name="elementName" select="'ProcedureType'" />
		            </xsl:call-template>
            </xsl:for-each>
	            
            
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
			
			<!-- Procedure Provider/ Performer -->
			<xsl:for-each select="cda:performer/cda:assignedEntity">
				<xsl:call-template name="assignedEntityPerformer">
				    <xsl:with-param name="assignedEntityPerformer" select="." as="node()" />
                    <xsl:with-param name="elementName" select="'ProcedureProvider'" />
				</xsl:call-template>
			</xsl:for-each>
	
			
				<!-- ServiceType -->
				<ServiceType>
						<xsl:sequence select="fn:string($var_moodCode)"/>
			     </ServiceType>
				
				<xsl:for-each select="./cda:value[@xsi:type='CD']">
				  <ProcedureValue code="{./@code}"/>
				</xsl:for-each>
				
				<!-- ProcedureStatus -->
				<xsl:if test="fn:exists(cda:statusCode)" >
					<ProcedureStatus>
		                <xsl:attribute name="code" select="cda:statusCode/@code"/>
		            </ProcedureStatus>
	            </xsl:if>
				
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
    
<xsl:template name="procedureType">
	<xsl:param name="code"/>
	<xsl:param name="elementName"/>
	<xsl:element name="{$elementName}">
		<xsl:for-each select=".">
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
	               </xsl:for-each>
	            </xsl:element>
</xsl:template>         
</xsl:stylesheet>