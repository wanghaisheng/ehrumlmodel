<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda" 
    xmlns:sdtc="urn:hl7-org:sdtc" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../constants.xslt"/>
    <xsl:import href="../maps.xslt"/>
    <xsl:import href="../../common/functions.xslt"/>  
     <xsl:template name="headerInformation">
     	<xsl:param name="header"/>
        <xsl:param name="ToCSummary" />
        <xsl:param name="code" />
        <xsl:param name="displayName" />
        <xsl:param name="title" />
        <xsl:param name="templateID" />
        <realmCode>
            <xsl:attribute name="code" namespace="" select="'US'"/>
        </realmCode>
         <typeId>
            <xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.1.3'"/>
            <xsl:attribute name="extension" namespace="" select="'POCD_HD000040'"/>
        </typeId>
         <templateId>
        	<xsl:attribute name="root" namespace="" select="$templateID"/>
        </templateId>
        
            
            <xsl:for-each select="$header/toc:SummaryID"> 
                <id>
                    <xsl:attribute name="root" select="@root"/>
                    <xsl:attribute name="extension" select="@extension"/>
                </id>
            </xsl:for-each>             
          
       <code>
            <xsl:attribute name="code" namespace="" select="$code"/>
            <xsl:attribute name="codeSystem" namespace="" select="$var1"/>
            <xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
            <xsl:attribute name="displayName" namespace="" select="$displayName"/>
        </code>
        <title>
            <xsl:sequence select="$title"/>
        </title>                
       <templateId root="1.3.6.1.4.1.19376.1.5.3.1.1.1"/>
       <templateId root="2.16.840.1.113883.10.20.1"/>
       <templateId root="2.16.840.1.113883.10.20.2"/>
       <templateId root="2.16.840.1.113883.10.20.3"/>
       <templateId root="2.16.840.1.113883.10.20.20"/>
       
       <!--  Level 3 Conformance ID's - when added MDHT does not recognizes them -->
       <!--  <templateId root="2.16.840.1.113883.10.20.30"/> -->
       <!--  <templateId root="2.16.840.1.113883.10.20.16.2"/>
             <templateId root="2.16.840.1.113883.3.88.11.48.2"/> -->
                
        <xsl:if test="($header/toc:DocumentTimeStamp)">
	        <xsl:call-template name="tsTS">
	            <xsl:with-param name="tsTS" select="$header/toc:DocumentTimeStamp" as="node()" />
	            <xsl:with-param name="elementName" select="'effectiveTime'" />
	        </xsl:call-template>
	    </xsl:if>
        <xsl:if test="($header/toc:ConfidentialityStatus)">
	        <xsl:call-template name="codeCE">
	            <xsl:with-param name="code" select="$header/toc:ConfidentialityStatus" as="node()" />
	            <xsl:with-param name="elementName" select="'confidentialityCode'" />
	        </xsl:call-template>
	    </xsl:if>
        <xsl:if test="($header/toc:LanguageCode)">
	        <xsl:call-template name="codeCE">
	            <xsl:with-param name="code" select="$header/toc:LanguageCode" as="node()" />
	            <xsl:with-param name="elementName" select="'languageCode'" />
	        </xsl:call-template>
	    </xsl:if>
       <recordTarget>
            <patientRole>
                <xsl:for-each select="$header/toc:PersonInformation/toc:PersonID">
	                <xsl:call-template name="idII">
	                    <xsl:with-param name="idII" select="." as="node()" />
	                </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$header/toc:PersonInformation/toc:PersonAddress">
                    <xsl:call-template name="address">
                        <xsl:with-param name="address" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$header/toc:PersonInformation/toc:PersonContact">
                    <xsl:call-template name="telecom">
                        <xsl:with-param name="telecom" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
                <patient>
                    <xsl:for-each select="$header/toc:PersonInformation/toc:PersonalInformation/toc:PersonName">
                        <xsl:call-template name="personName">
                            <xsl:with-param name="personName" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$header/toc:PersonInformation/toc:PersonalInformation/toc:Gender">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'administrativeGenderCode'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$header/toc:PersonInformation/toc:PersonalInformation">
                        <xsl:variable name="var25_select_nullFlavor" as="item()*" select="toc:PersonDateOfBirth/@nullFlavor"/>
                        <xsl:variable name="var26_select_value" as="item()*" select="toc:PersonDateOfBirth/@value"/>
                        <birthTime>
                            <xsl:if test="fn:exists($var25_select_nullFlavor)">
                                <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var25_select_nullFlavor)"/>
                            </xsl:if>
                            <xsl:if test="fn:exists($var26_select_value)">
                                <xsl:attribute name="value" namespace="" select="fn:string($var26_select_value)"/>
                            </xsl:if>
                        </birthTime>
                    </xsl:for-each>
                    <xsl:for-each select="$header/toc:PersonInformation/toc:PersonalInformation/toc:MaritalStatus">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'maritalStatusCode'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$header/toc:PersonInformation/toc:PersonalInformation/toc:ReligiousAffiliation">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'religiousAffiliationCode'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$header/toc:PersonInformation/toc:PersonalInformation/toc:Race">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'raceCode'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$header/toc:PersonInformation/toc:PersonalInformation/toc:Ethnicity">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'ethnicGroupCode'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="$header/toc:PersonInformation/toc:PersonalInformation/toc:BirthPlace">
                        <xsl:variable name="var48_select_nullFlavor" as="item()*" select="@nullFlavor"/>
                        <birthplace>
                            <xsl:attribute name="classCode" namespace="" select="'BIRTHPL'"/>
                            <xsl:if test="fn:exists($var48_select_nullFlavor)">
                                <xsl:attribute name="nullFlavor" namespace="" select="fn:string($var48_select_nullFlavor)"/>
                            </xsl:if>
                            <place>
                                <xsl:for-each select="gcda:placeName">
                                    <xsl:call-template name="personName">
                                        <xsl:with-param name="personName" select="." as="node()" />
                                    </xsl:call-template>
                                </xsl:for-each>
                                <xsl:for-each select="gcda:placeAddress">
                                    <xsl:call-template name="address">
                                        <xsl:with-param name="address" select="." as="node()" />
                                    </xsl:call-template>
                                </xsl:for-each>
                            </place>
                        </birthplace>
                    </xsl:for-each>
                </patient>
            </patientRole>
        </recordTarget>
        <xsl:for-each select="$header/toc:AuthorInformation">
            <author>
                <xsl:attribute name="typeCode" namespace="" select="'AUT'"/>
                <xsl:for-each select="toc:AuthorTime">
                    <xsl:call-template name="tsTS">
                        <xsl:with-param name="tsTS" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'time'" />
                    </xsl:call-template>
                </xsl:for-each>
                <assignedAuthor>
                    <xsl:attribute name="classCode" namespace="" select="'ASSIGNED'"/>
                    <xsl:for-each select="toc:AuthorID">
	                    <xsl:call-template name="idII">
	                        <xsl:with-param name="idII" select="." as="node()" />
	                    </xsl:call-template>
                    </xsl:for-each>
	                <xsl:for-each select="toc:AuthorCode">
	                    <xsl:call-template name="codeCE">
	                        <xsl:with-param name="code" select="." as="node()" />
	                        <xsl:with-param name="elementName" select="'code'" />
	                    </xsl:call-template>
	                </xsl:for-each>
                    <xsl:for-each select="toc:AuthorAddress">
                        <xsl:call-template name="address">
                            <xsl:with-param name="address" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:AuthorContact">
                        <xsl:call-template name="telecom">
                            <xsl:with-param name="telecom" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <assignedPerson>
                        <xsl:for-each select="toc:AuthorName">
                            <xsl:call-template name="personName">
                                <xsl:with-param name="personName" select="." as="node()" />
                            </xsl:call-template>
                        </xsl:for-each>
                    </assignedPerson>
                    <xsl:for-each select="toc:AuthorOrganization">
	                    <xsl:call-template name="organization">
	                        <xsl:with-param name="organization" select="." as="node()" />
	                        <xsl:with-param name="elementName" select="'representedOrganization'"/>
	                    </xsl:call-template>
                    </xsl:for-each>
                </assignedAuthor>
            </author>           
        </xsl:for-each>
        <xsl:for-each select="$header/toc:InformantInformation">
            <informant>
                <!-- <xsl:attribute name="typeCode" namespace="" select="'INF'"/> -->
                <xsl:for-each select="toc:AssignedInformant">
                    <assignedEntity>
                        <!-- <xsl:attribute name="typeCode" namespace="" select="'ASSIGNED'"/> -->
                        <xsl:for-each select="gcda:id">
	                        <xsl:call-template name="idII">
	                            <xsl:with-param name="idII" select="." as="node()" />
	                        </xsl:call-template>
                        </xsl:for-each>
		                <xsl:for-each select="gcda:code">
		                    <xsl:call-template name="codeCE">
		                        <xsl:with-param name="code" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'code'" />
		                    </xsl:call-template>
		                </xsl:for-each>
                        <xsl:for-each select="gcda:address">
                            <xsl:call-template name="address">
                                <xsl:with-param name="address" select="." as="node()" />
                            </xsl:call-template>
                        </xsl:for-each>
                        <xsl:for-each select="gcda:contact">
                            <xsl:call-template name="telecom">
                                <xsl:with-param name="telecom" select="." as="node()" />
                            </xsl:call-template>
                        </xsl:for-each>
                        <assignedPerson>
                            <xsl:for-each select="gcda:name">
                                <xsl:call-template name="personName">
                                    <xsl:with-param name="personName" select="." as="node()" />
                                </xsl:call-template>
                            </xsl:for-each>
                        </assignedPerson>
                        <xsl:for-each select="gcda:representedOrganization">
	                        <xsl:call-template name="organization">
	                            <xsl:with-param name="organization" select="." as="node()" />
	                            <xsl:with-param name="elementName" select="'representedOrganization'"/>
	                        </xsl:call-template>
                        </xsl:for-each>
                    </assignedEntity>
                </xsl:for-each>
                <xsl:for-each select="toc:RelatedInformant">
                    <relatedEntity>
                        <xsl:attribute name="classCode" namespace="" select="gcda:classCode"/>
                        <relatedPerson>
                            <xsl:for-each select="gcda:address">
                                <xsl:call-template name="address">
                                    <xsl:with-param name="address" select="." as="node()" />
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:for-each select="gcda:contact">
                                <xsl:call-template name="telecom">
                                    <xsl:with-param name="telecom" select="." as="node()" />
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:for-each select="gcda:name">
                                <xsl:call-template name="personName">
                                    <xsl:with-param name="personName" select="." as="node()" />
                                </xsl:call-template>
                            </xsl:for-each>
                        </relatedPerson>
                    </relatedEntity>
                </xsl:for-each>
            </informant>
        </xsl:for-each>
        <xsl:for-each select="$header/toc:CustodianInformation">
            <custodian>
                <assignedCustodian>
	                <xsl:call-template name="organization">
	                    <xsl:with-param name="organization" select="." as="node()" />
	                    <xsl:with-param name="elementName" select="'representedCustodianOrganization'"/>
	                </xsl:call-template>
                </assignedCustodian>
            </custodian>
        </xsl:for-each>
       	<xsl:for-each select="$header">
			<documentationOf>
				<serviceEvent>
                    <xsl:for-each select="toc:ServiceEvent/toc:EncounterID">
                        <xsl:call-template name="idII">
                            <xsl:with-param name="idII" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:ServiceEvent/toc:EncounterDate">
                        <xsl:call-template name="ivlTS">
                            <xsl:with-param name="ivlTS" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'effectiveTime'" />
                        </xsl:call-template>
                    </xsl:for-each>
				    <xsl:for-each select="toc:Provider">
					<performer typeCode="PRF">
                        <templateId root="2.16.840.1.113883.3.88.11.83.4"/>
                        <templateId root="1.3.6.1.4.1.19376.1.5.3.1.2.3"/>
						<xsl:for-each select="toc:DateRange">
							<xsl:call-template name="ivlTS">
								<xsl:with-param name="ivlTS" select="." as="node()" />
								<xsl:with-param name="elementName" select="'time'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="toc:ProviderRoleCoded">
							<xsl:call-template name="codeCD">
								<xsl:with-param name="code" select="." as="node()" />
								<xsl:with-param name="elementName" select="'functionCode'" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="toc:ProviderEntity">
							<assignedEntity>
								<xsl:for-each select="gcda:nationalProviderID">
									<xsl:call-template name="idII">
										<xsl:with-param name="idII" select="." as="node()" />
									</xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="gcda:providerType">
									<xsl:call-template name="codeCD">
										<xsl:with-param name="code" select="." as="node()" />
										<xsl:with-param name="elementName" select="'code'" />
									</xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="gcda:providerAddress">
									<xsl:call-template name="address">
										<xsl:with-param name="address" select="." as="node()" />
									</xsl:call-template>
								</xsl:for-each>
								<xsl:for-each select="gcda:providerTelecom">
									<xsl:call-template name="telecom">
										<xsl:with-param name="telecom" select="." as="node()" />
									</xsl:call-template>
								</xsl:for-each>
								<xsl:if test="fn:exists(gcda:providerName)">
									<assignedPerson>
										<xsl:for-each select="gcda:providerName">
											<xsl:call-template name="personName">
												<xsl:with-param name="personName" select="."
													as="node()" />
											</xsl:call-template>
										</xsl:for-each>
									</assignedPerson>
								</xsl:if>
								<xsl:if test="fn:exists(gcda:providerOrganizationName)">
									<representedOrganization>
										<xsl:for-each select="gcda:providerOrganizationName">
											<xsl:call-template name="organizationName">
												<xsl:with-param name="organizationName"
													select="." as="node()" />
											</xsl:call-template>
										</xsl:for-each>
									</representedOrganization>
								</xsl:if>
								<xsl:if test="toc:ProvidersPatientID">
									<sdtc:patient>
										<sdtc:id>
											<xsl:if test="fn:exists(@root)">
												<xsl:attribute name="root" select="@root"></xsl:attribute>
											</xsl:if>
											<xsl:if test="fn:exists(@extension)">
												<xsl:attribute name="extension" select="@extension"></xsl:attribute>
											</xsl:if>
										</sdtc:id>
									</sdtc:patient>
								</xsl:if>
							</assignedEntity>
						</xsl:for-each>
					</performer>
					</xsl:for-each>
                </serviceEvent>
            </documentationOf>          
        </xsl:for-each>                
    </xsl:template>
</xsl:stylesheet>