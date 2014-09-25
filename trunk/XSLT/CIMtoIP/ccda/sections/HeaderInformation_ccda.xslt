<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda" 
    xmlns:sdtc="urn:hl7-org:sdtc" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../constants_ccda.xslt"/>
    <xsl:import href="../maps_ccda.xslt"/>
    <xsl:import href="../../../common/functions.xslt"/>  
    <xsl:template name="headerInformationCCDA">
        <xsl:param name="header" />
        <xsl:param name="code" />
        <xsl:param name="displayName" />
        <xsl:param name="title" />
        <xsl:param name="mnemonic" />
        <xsl:param name="documentTemplateId" />
        <!--  CONF:5249 -->
        <realmCode>
            <xsl:attribute name="code" namespace="" select="'US'"/>
        </realmCode>
        <typeId>
            <xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.1.3'"/>
            <xsl:attribute name="extension" namespace="" select="'POCD_HD000040'"/>
        </typeId>
        
        <!-- indicates conformance with US Realm Clinical Document Header template -->
        <templateId root="2.16.840.1.113883.10.20.22.1.1"/>

		<!-- Clinical Document templateID ie., either Consultation Note or Discharge Summary -->
		<templateId>
			<xsl:attribute name="root" select="$documentTemplateId"/>
		</templateId>

        <xsl:for-each select="$header/toc:SummaryID"> 
	        <xsl:call-template name="idII">
	            <xsl:with-param name="idII" select="." as="node()" />
	        </xsl:call-template>
        </xsl:for-each>      
	    <code>
	        <xsl:attribute name="code" namespace="" select="$code"/>
	        <xsl:attribute name="codeSystem" namespace="" select="$LoincCodeSystem"/>
	        <xsl:attribute name="codeSystemName" namespace="" select="$LoincCodeSystemName"/>
	        <xsl:attribute name="displayName" namespace="" select="$displayName"/>
	    </code>
	    <title>
	        <xsl:value-of select="$title"/>
	    </title>

		<!--  Level 3 Conformance ID's - when added MDHT does not recognizes them -->
		<!--  <templateId root="2.16.840.1.113883.10.20.30"/> -->
		<!--  <templateId root="2.16.840.1.113883.10.20.16.2"/>
		      <templateId root="2.16.840.1.113883.3.88.11.48.2"/> -->

 		<xsl:for-each select="$header">                
	        <xsl:if test="toc:DocumentTimeStamp">
		        <xsl:call-template name="tsTS">
		            <xsl:with-param name="tsTS" select="toc:DocumentTimeStamp" as="node()" />
		            <xsl:with-param name="elementName" select="'effectiveTime'" />
		        </xsl:call-template>
		    </xsl:if>
	 
	        <xsl:if test="toc:ConfidentialityStatus">
		        <xsl:call-template name="codeCE">
		            <xsl:with-param name="code" select="toc:ConfidentialityStatus" as="node()" />
		            <xsl:with-param name="elementName" select="'confidentialityCode'" />
		        </xsl:call-template>
		    </xsl:if>
	   
	        <xsl:if test="(toc:LanguageCode)">
		        <xsl:call-template name="codeCE">
		            <xsl:with-param name="code" select="toc:LanguageCode" as="node()" />
		            <xsl:with-param name="elementName" select="'languageCode'" />
		        </xsl:call-template>
	    	</xsl:if>
	    	
            <xsl:if test="(toc:SetID)">
                <xsl:call-template name="idII">
                    <xsl:with-param name="idII" select="toc:SetID" as="node()" />
                    <xsl:with-param name="elementName" select="'setId'" />
                </xsl:call-template>
            </xsl:if>

            <xsl:if test="(toc:VersionNumber)">
                <versionNumber>
                    <xsl:attribute name="value" namespace="" select="toc:VersionNumber" />
                </versionNumber>
            </xsl:if>

		       <recordTarget>
		            <patientRole>
                        <xsl:for-each select="toc:PersonInformation">
		                <xsl:for-each select="toc:PersonID">
			                <xsl:call-template name="idII">
			                    <xsl:with-param name="idII" select="." as="node()" />
			                </xsl:call-template>
		                </xsl:for-each>
		                <xsl:for-each select="toc:PersonAddress">
		                    <xsl:call-template name="address">
		                        <xsl:with-param name="address" select="." as="node()" />
		                    </xsl:call-template>
		                </xsl:for-each>
		                <xsl:for-each select="toc:PersonContact">
		                    <xsl:call-template name="telecom">
		                        <xsl:with-param name="telecom" select="." as="node()" />
		                    </xsl:call-template>
		                </xsl:for-each>
		                <patient>
                            <xsl:for-each select="toc:PersonalInformation">
		                    <xsl:for-each select="toc:PersonName">
		                        <xsl:call-template name="personName">
		                            <xsl:with-param name="personName" select="." as="node()" />
		                        </xsl:call-template>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:Gender">
		                        <xsl:call-template name="codeCE">
		                            <xsl:with-param name="code" select="." as="node()" />
		                            <xsl:with-param name="elementName" select="'administrativeGenderCode'" />
		                        </xsl:call-template>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:PersonDateOfBirth">
		                        <birthTime>
	                                <xsl:attribute name="value" namespace="" select="fn:string(@value)"/>
		                        </birthTime>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:MaritalStatus">
		                        <xsl:call-template name="codeCE">
		                            <xsl:with-param name="code" select="." as="node()" />
		                            <xsl:with-param name="elementName" select="'maritalStatusCode'" />
		                        </xsl:call-template>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:ReligiousAffiliation">
		                        <xsl:call-template name="codeCE">
		                            <xsl:with-param name="code" select="." as="node()" />
		                            <xsl:with-param name="elementName" select="'religiousAffiliationCode'" />
		                        </xsl:call-template>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:Race">
		                        <xsl:call-template name="codeCE">
		                            <xsl:with-param name="code" select="." as="node()" />
		                            <xsl:with-param name="elementName" select="'raceCode'" />
		                        </xsl:call-template>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:Ethnicity">
		                        <xsl:call-template name="codeCE">
		                            <xsl:with-param name="code" select="." as="node()" />
		                            <xsl:with-param name="elementName" select="'ethnicGroupCode'" />
		                        </xsl:call-template>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:GuardianInformation">
		                        <guardian>
	                            <xsl:for-each select="toc:GuardianCode">
	                                <xsl:call-template name="codeCE">
	                                    <xsl:with-param name="code" select="." as="node()" />
	                                    <xsl:with-param name="elementName" select="'code'" />
	                                </xsl:call-template>
	                            </xsl:for-each>
	                            <xsl:for-each select="toc:GuardianAddress">
	                                <xsl:call-template name="address">
	                                    <xsl:with-param name="address" select="." as="node()" />
	                                </xsl:call-template>
	                            </xsl:for-each>
	                            <xsl:for-each select="toc:GuardianContact">
	                                <xsl:call-template name="telecom">
	                                    <xsl:with-param name="telecom" select="." as="node()" />
	                                </xsl:call-template>
	                            </xsl:for-each>
	                            <guardianPerson>
		                            <xsl:for-each select="toc:GuardianName">
		                                <xsl:call-template name="personName">
		                                    <xsl:with-param name="personName" select="." as="node()" />
		                                </xsl:call-template>
		                            </xsl:for-each>
	                            </guardianPerson>
	                            </guardian>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:BirthPlace">
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
		                    <xsl:for-each select="toc:LanguageCommunication">
		                        <languageCommunication>
	                            <xsl:for-each select="toc:LanguageCode">
	                                <xsl:call-template name="codeCE">
	                                    <xsl:with-param name="code" select="." as="node()" />
	                                    <xsl:with-param name="elementName" select="'languageCode'" />
	                                </xsl:call-template>
	                            </xsl:for-each>
                                <xsl:for-each select="toc:ModeCode">
                                    <xsl:call-template name="codeCE">
                                        <xsl:with-param name="code" select="." as="node()" />
                                        <xsl:with-param name="elementName" select="'modeCode'" />
                                    </xsl:call-template>
                                </xsl:for-each>
                                <xsl:for-each select="toc:ProficiencyLevelCode">
                                    <xsl:call-template name="codeCE">
                                        <xsl:with-param name="code" select="." as="node()" />
                                        <xsl:with-param name="elementName" select="'proficiencyLevelCode'" />
                                    </xsl:call-template>
                                </xsl:for-each>
				                <xsl:for-each select="toc:PreferredLanguage">
				                    <xsl:element name="preferenceInd" namespace="">
				                        <xsl:attribute name="value" namespace="" select="xs:string(xs:boolean(fn:string(.)))"/>
				                    </xsl:element>
				                </xsl:for-each>
                                </languageCommunication>
                            </xsl:for-each>
		                    </xsl:for-each>
		                </patient>
                        <xsl:if test="(toc:OrganizationID)">
                        <providerOrganization>
	                        <xsl:for-each select="toc:OrganizationID">
	                            <xsl:call-template name="idII">
	                                <xsl:with-param name="idII" select="." as="node()" />
	                            </xsl:call-template>
	                        </xsl:for-each>
		                    <xsl:for-each select="toc:OrganizationName">
		                        <xsl:call-template name="organizationName">
		                            <xsl:with-param name="organizationName" select="." as="node()" />
		                        </xsl:call-template>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:OrganizationAddress">
		                        <xsl:call-template name="address">
		                            <xsl:with-param name="address" select="." as="node()" />
		                        </xsl:call-template>
		                    </xsl:for-each>
		                    <xsl:for-each select="toc:OrganizationContact">
		                        <xsl:call-template name="telecom">
		                            <xsl:with-param name="telecom" select="." as="node()" />
		                        </xsl:call-template>
		                    </xsl:for-each>
                        </providerOrganization>
                        </xsl:if>
		                </xsl:for-each>
		            </patientRole>
		        </recordTarget>
        <xsl:for-each select="toc:AuthorInformation">
            <author>
                <xsl:for-each select="toc:AuthorTime">
                    <xsl:call-template name="tsTS">
                        <xsl:with-param name="tsTS" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'time'" />
                    </xsl:call-template>
                </xsl:for-each>
                <assignedAuthor>
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
                    <!--  Can be either authorName or assignedAuthoringDevice -->
                    <xsl:if test="fn:exists(toc:AuthorName)"> 
	                    <assignedPerson>
	                        <xsl:for-each select="toc:AuthorName">
	                            <xsl:call-template name="personName">
	                                <xsl:with-param name="personName" select="." as="node()" />
	                            </xsl:call-template>
	                        </xsl:for-each>
	                    </assignedPerson>
                    </xsl:if>
                    <xsl:for-each select="toc:AuthorOrganization">
	                    <xsl:call-template name="organization">
	                        <xsl:with-param name="organization" select="." as="node()" />
	                        <xsl:with-param name="elementName" select="'representedOrganization'"/>
	                    </xsl:call-template>
                    </xsl:for-each>
                    <xsl:if test="fn:exists(toc:DeviceManufacturerModelName) or fn:exists(toc:SoftwareName)">
	                    <assignedAuthoringDevice>
		                    <xsl:if test="fn:exists(toc:DeviceSoftwareName)">
				                  <softwareName>
				                    		<xsl:sequence select="toc:DeviceSoftwareName/node()"/>
				                  </softwareName>
			                  </xsl:if>
		                    <xsl:if test="fn:exists(toc:DeviceManufacturerModelName)">
			                    <manufacturerModelName>
			                    		<xsl:sequence select="toc:DeviceManufacturerModelName/node()"/>
			                    </manufacturerModelName>
			                  </xsl:if>
	                    </assignedAuthoringDevice>
                    </xsl:if>
                </assignedAuthor>
            </author>           
        </xsl:for-each>
        <xsl:for-each select="toc:DataEntererInformation">
            <dataEnterer>
                <assignedEntity>
                    <xsl:for-each select="toc:DataEntererID">
                        <xsl:call-template name="idII">
                            <xsl:with-param name="idII" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:DataEntererCode">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'code'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:DataEntererAddress">
                        <xsl:call-template name="address">
                            <xsl:with-param name="address" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:DataEntererContact">
                        <xsl:call-template name="telecom">
                            <xsl:with-param name="telecom" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <assignedPerson>
                        <xsl:for-each select="toc:DataEntererName">
                            <xsl:call-template name="personName">
                                <xsl:with-param name="personName" select="." as="node()" />
                            </xsl:call-template>
                        </xsl:for-each>
                    </assignedPerson>
                </assignedEntity>
            </dataEnterer>           
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
                        <relatedPerson>
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
        <xsl:for-each select="toc:CustodianInformation">
            <custodian>
                <assignedCustodian>
	                <xsl:call-template name="organization">
	                    <xsl:with-param name="organization" select="." as="node()" />
	                    <xsl:with-param name="elementName" select="'representedCustodianOrganization'"/>
	                </xsl:call-template>
                </assignedCustodian>
            </custodian>
        </xsl:for-each>
        <xsl:for-each select="toc:RecipientInformation">
            <informationRecipient>
                <intendedRecipient>
                    <xsl:for-each select="toc:RecipientName">
                    <informationRecipient>
                        <xsl:call-template name="personName">
                            <xsl:with-param name="personName" select="." as="node()" />
                        </xsl:call-template>
                    </informationRecipient>
                    </xsl:for-each>
                    <xsl:for-each select="toc:RecipientOrganizationName">
                    <receivedOrganization>
                        <xsl:call-template name="organizationName">
                            <xsl:with-param name="organizationName" select="." as="node()" />
                        </xsl:call-template>
                    </receivedOrganization>
                    </xsl:for-each>
                </intendedRecipient>
            </informationRecipient>           
        </xsl:for-each>
        <xsl:for-each select="toc:LegalAuthenticatorInformation">
            <legalAuthenticator>
                <xsl:for-each select="toc:AuthenticatorTime">
                    <xsl:call-template name="tsTS">
                        <xsl:with-param name="tsTS" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'time'" />
                    </xsl:call-template>
                </xsl:for-each>
                <signatureCode code="S"/>
                <assignedEntity>
                    <xsl:for-each select="toc:AuthenticatorID">
                        <xsl:call-template name="idII">
                            <xsl:with-param name="idII" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:AuthenticatorCode">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'code'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:AuthenticatorAddress">
                        <xsl:call-template name="address">
                            <xsl:with-param name="address" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:AuthenticatorContact">
                        <xsl:call-template name="telecom">
                            <xsl:with-param name="telecom" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <assignedPerson>
                        <xsl:for-each select="toc:AuthenticatorName">
                            <xsl:call-template name="personName">
                                <xsl:with-param name="personName" select="." as="node()" />
                            </xsl:call-template>
                        </xsl:for-each>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>           
        </xsl:for-each>
        <xsl:for-each select="toc:AuthenticatorInformation">
            <authenticator>
                <xsl:for-each select="toc:AuthenticatorTime">
                    <xsl:call-template name="tsTS">
                        <xsl:with-param name="tsTS" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'time'" />
                    </xsl:call-template>
                </xsl:for-each>
                <signatureCode code="S"/>
                <assignedEntity>
                    <xsl:for-each select="toc:AuthenticatorID">
                        <xsl:call-template name="idII">
                            <xsl:with-param name="idII" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:AuthenticatorCode">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'code'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:AuthenticatorAddress">
                        <xsl:call-template name="address">
                            <xsl:with-param name="address" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:AuthenticatorContact">
                        <xsl:call-template name="telecom">
                            <xsl:with-param name="telecom" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <assignedPerson>
                        <xsl:for-each select="toc:AuthenticatorName">
                            <xsl:call-template name="personName">
                                <xsl:with-param name="personName" select="." as="node()" />
                            </xsl:call-template>
                        </xsl:for-each>
                    </assignedPerson>
                </assignedEntity>
            </authenticator>           
        </xsl:for-each>
        <xsl:for-each select="toc:ParticipantInformation">
            <participant>
            <xsl:attribute name="typeCode" namespace="" select="toc:ParticipantType"/>
	        <xsl:if test="toc:ParticipantTime">
	            <xsl:call-template name="ivlTS">
	                <xsl:with-param name="ivlTS" select="toc:ParticipantTime" as="node()" />
	                <xsl:with-param name="elementName" select="'time'" />
	            </xsl:call-template>
	        </xsl:if>
	        <associatedEntity>
                <xsl:attribute name="classCode" namespace="" select="toc:ParticipantClassCode"/>
                <xsl:for-each select="toc:ParticipantCode">
                    <xsl:call-template name="codeCE">
                        <xsl:with-param name="code" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'code'" />
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="toc:ParticipantAddress">
                    <xsl:call-template name="address">
                        <xsl:with-param name="address" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="toc:ParticipantContact">
                    <xsl:call-template name="telecom">
                        <xsl:with-param name="telecom" select="." as="node()" />
                    </xsl:call-template>
                </xsl:for-each>
	            <xsl:if test="toc:ParticipantName">
	            <associatedPerson>
	                <xsl:for-each select="toc:ParticipantName">
	                    <xsl:call-template name="personName">
	                        <xsl:with-param name="personName" select="." as="node()" />
	                    </xsl:call-template>
	                </xsl:for-each>
	            </associatedPerson>
	            </xsl:if>
                <xsl:for-each select="toc:ParticipantOrganization">
                    <xsl:call-template name="organization">
                        <xsl:with-param name="organization" select="." as="node()" />
                        <xsl:with-param name="elementName" select="'scopingOrganization'"/>
                    </xsl:call-template>
                </xsl:for-each>
	        </associatedEntity>
	        </participant>
        </xsl:for-each>
        <xsl:if test="fn:exists(toc:ConsentInformation)"> 
            <authorization typeCode="AUTH">
            <xsl:for-each select="toc:ConsentInformation">
                <consent classCode="CONS" moodCode="EVN">
                    <xsl:for-each select="toc:ConsentID">
                        <xsl:call-template name="idII">
                            <xsl:with-param name="idII" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="toc:ConsentCode">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'code'" />
                        </xsl:call-template>
                    </xsl:for-each>
                    <statusCode code="completed"/>
                </consent>
            </xsl:for-each>
            </authorization>           
        </xsl:if>
        <xsl:for-each select="toc:ServiceEvent">
            <componentOf>
                <encompassingEncounter>
                    <xsl:for-each select="toc:EncounterID">
                        <xsl:call-template name="idII">
                            <xsl:with-param name="idII" select="." as="node()" />
                        </xsl:call-template>
                    </xsl:for-each>
		            <xsl:if test="toc:EncounterDate">
		                <xsl:call-template name="ivlTS">
		                    <xsl:with-param name="ivlTS" select="toc:EncounterDate" as="node()" />
		                    <xsl:with-param name="elementName" select="'effectiveTime'" />
		                </xsl:call-template>
		            </xsl:if>
                    <xsl:for-each select="toc:PatientDispositionCode">
                        <xsl:call-template name="codeCE">
                            <xsl:with-param name="code" select="." as="node()" />
                            <xsl:with-param name="elementName" select="'dischargeDispositionCode'" />
                        </xsl:call-template>
                    </xsl:for-each>
                </encompassingEncounter>
            </componentOf>
    	</xsl:for-each>
    	<!-- inFulfillmentOf -->
    	<xsl:if test="fn:exists(toc:FulfilledOrders)">
	    	<xsl:for-each select="toc:FulfilledOrders">
		    	<inFulfillmentOf>
					<order>
						<xsl:for-each select="toc:OrderId">
		                    <xsl:call-template name="idII">
		                        <xsl:with-param name="idII" select="." as="node()" />
		                    </xsl:call-template>
		                </xsl:for-each>
					</order>
				</inFulfillmentOf>
	      </xsl:for-each>
      	</xsl:if>
      
      </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>