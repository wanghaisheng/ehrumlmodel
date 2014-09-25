<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc"> 

    <xsl:import href="../constants.xslt"/>
    <xsl:import href="../maps.xslt"/>

    <xsl:template name="advanceDirectives">
        <xsl:param name="advanceDirectives" />
        <component>
            <section>
            <templateId root='2.16.840.1.113883.3.88.11.83.116' assigningAuthorityName='HITSP C83'/>
            <templateId root='1.3.6.1.4.1.19376.1.5.3.1.3.35' assigningAuthorityName="IHE PCC"/>
            <templateId root='1.3.6.1.4.1.19376.1.5.3.1.3.34' assigningAuthorityName="IHE PCC"/>
            <templateId root='2.16.840.1.113883.10.20.1.1' assigningAuthorityName='CCD'/>
            <code code="42348-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Advance directives"/>
            <title>
                <xsl:sequence select="'advance directives'"/>
            </title>
            <xsl:if test="fn:exists($advanceDirectives/toc:Text)">
	            <text>
	            	<xsl:apply-templates select="$advanceDirectives/toc:Text/node()"/>
	            </text>
            </xsl:if>
            <xsl:for-each select="$advanceDirectives/toc:AdvanceDirective">
                <xsl:variable name="var458_select_statusCode" as="item()*" select="toc:Status/@code"/>
                <xsl:variable name="var459_select_statusCodeSystem" as="item()*" select="toc:Status/@codeSystem"/>
                <xsl:variable name="var460_select_statusDisplayName" as="item()*" select="toc:Status/@displayName"/>
                
                <!--  <xsl:variable name="var540_resultof_mapAdvanceDirectiveStatus" as="node()?">
                    <xsl:call-template name="mapAdvanceDirectiveStatus">
                        <xsl:with-param name="status" as="node()">
                            <toc:status xsl:exclude-result-prefixes="toc">
                                <xsl:sequence select="(./toc:status/@node(), ./toc:status/node())"/>
                            </toc:status>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:variable> -->
                
                <entry>
                    <observation>
                        <xsl:attribute name="classCode" namespace="" select="'OBS'"/>
                        <xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
                        <templateId root="2.16.840.1.113883.10.20.1.17"/>
                        <templateId root="2.16.840.1.113883.3.88.11.83.12" assigningAuthorityName="HITSP"/>
                        <templateId root="2.16.840.1.113883.10.20.1.37"/>
                		<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.13"/>
                		<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.13.7"/>
                		<templateId root="2.16.840.1.113883.10.20.1.58"/>
                        <id nullFlavor="NI"/>
                        
                 <xsl:choose>
                  <xsl:when test="fn:exists(toc:Type/@code)">
                  <xsl:for-each select="toc:Type">
		                    <xsl:call-template name="codeCD">
		                        <xsl:with-param name="code" select="." as="node()" />
		                        <xsl:with-param name="elementName" select="'code'" />
		                    </xsl:call-template>
		                </xsl:for-each>
		                   </xsl:when>
		              <xsl:otherwise>
		                    <code nullFlavor="NA"/>
		                  </xsl:otherwise>
		         </xsl:choose>
		                
                   <statusCode>
                       <xsl:if test="fn:exists($var458_select_statusCode)">
                           <xsl:attribute name="code" namespace="" select="fn:string($var458_select_statusCode)"/>
                       </xsl:if>
                   </statusCode>            
                       
                <xsl:for-each select="toc:EffectiveDate">                                         
                       <xsl:call-template name="ivlTS">
                           <xsl:with-param name="ivlTS" select="." as="node()" />
                           <xsl:with-param name="elementName" select="'effectiveTime'" />
                       </xsl:call-template>                 
                   </xsl:for-each>           
                         
                   <xsl:for-each select="toc:Value">
                       <xsl:call-template name="valueCD">
                           <xsl:with-param name="value" select="." as="node()" />
                       </xsl:call-template>
                   </xsl:for-each>
                        <xsl:for-each select="toc:DocumentCustodian">
                        <participant>
                            <xsl:attribute name="typeCode" namespace="" select="'CST'"/>
                            <participantRole>
                                <xsl:attribute name="classCode" namespace="" select="'AGNT'"/>
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
	                                <playingEntity>
		                                <xsl:for-each select="gcda:organizationName">
		                                    <xsl:call-template name="organizationName">
		                                        <xsl:with-param name="organizationName" select="." as="node()" />
		                                    </xsl:call-template>
		                                </xsl:for-each>
	                                </playingEntity>
                                </xsl:if>
                            </participantRole>
                        </participant>
                        </xsl:for-each>
                            <entryRelationship>
                             <xsl:attribute name="typeCode" select="'REFR'"/>
            					<observation classCode="OBS" moodCode="EVN">
            					    <templateId root="2.16.840.1.113883.10.20.1.37"/>
                					<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.13"/>
                					<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.13.7"/>
                					<templateId root="2.16.840.1.113883.10.20.1.17"/>
                                                        <!-- added code element to confirm the structurally valid section -->
                                                        <code/>
                					<statusCode>
                    					<xsl:attribute name="code" select="'completed'"/>
                    					<!--  MDHT validation error #CONF-MDHT-DATATYPES-58, does not permit codeSystem at this place -->
                    					<!-- <xsl:attribute name="codeSystem" select="'2.16.840.1.113883.6.96'"/> -->
                					</statusCode>
                               <!-- <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/@nullFlavor">
                                    <xsl:attribute name="nullFlavor" namespace="" select="fn:string(.)"/>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/@typeCode">
                                    <xsl:attribute name="typeCode" namespace="" select="fn:string(.)"/>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/@inversionInd">
                                    <xsl:attribute name="inversionInd" namespace="" select="xs:string(xs:boolean(fn:string(.)))"/>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/@contextConductionInd">
                                    <xsl:attribute name="contextConductionInd" namespace="" select="xs:string(xs:boolean(fn:string(.)))"/>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/@negationInd">
                                    <xsl:attribute name="negationInd" namespace="" select="xs:string(xs:boolean(fn:string(.)))"/>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:realmCode">
                                    <realmCode>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </realmCode>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:typeId">
                                    <typeId>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </typeId>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:templateId">
                                    <templateId>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </templateId>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:sequenceNumber">
                                    <sequenceNumber>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </sequenceNumber>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:seperatableInd">
                                    <seperatableInd>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </seperatableInd>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:act">
                                    <act>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </act>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:encounter">
                                    <encounter>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </encounter>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:observation">
                                    <observation classCode="'OBS'" moodCode="'EVN'">
                						<templateId root="'2.16.840.1.113883.10.20.1.37'"/>
                                        <xsl:for-each select="@nullFlavor">
                                            <xsl:attribute name="nullFlavor" namespace="" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:for-each select="@classCode">
                                            <xsl:attribute name="classCode" namespace="" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:for-each select="@moodCode">
                                            <xsl:attribute name="moodCode" namespace="" select="fn:string(.)"/>
                                        </xsl:for-each>
                                        <xsl:for-each select="@negationInd">
                                            <xsl:attribute name="negationInd" namespace="" select="xs:string(xs:boolean(fn:string(.)))"/>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:realmCode">
                                            <realmCode>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </realmCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:typeId">
                                            <typeId>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </typeId>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:templateId">
                                            <templateId>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </templateId>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:id">
                                            <id>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </id>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:code">
                                            <code>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </code>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:derivationExpr">
                                            <derivationExpr>
                                                <xsl:for-each select="@nullFlavor">
                                                    <xsl:attribute name="nullFlavor" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@representation">
                                                    <xsl:attribute name="representation" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@mediaType">
                                                    <xsl:attribute name="mediaType" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@language">
                                                    <xsl:attribute name="language" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@compression">
                                                    <xsl:attribute name="compression" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@integrityCheck">
                                                    <xsl:attribute name="integrityCheck" namespace="" select="xs:string(xs:base64Binary(fn:string(.)))"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@integrityCheckAlgorithm">
                                                    <xsl:attribute name="integrityCheckAlgorithm" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="node()">
                                                    <xsl:if test="self::text()">
                                                        <xsl:sequence select="fn:string(.)"/>
                                                    </xsl:if>
                                                    <xsl:if test="self::toc:reference">
                                                        <reference>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </reference>
                                                    </xsl:if>
                                                    <xsl:if test="self::toc:thumbnail">
                                                        <thumbnail>
                                                            <xsl:for-each select="@nullFlavor">
                                                                <xsl:attribute name="nullFlavor" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@representation">
                                                                <xsl:attribute name="representation" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@mediaType">
                                                                <xsl:attribute name="mediaType" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@language">
                                                                <xsl:attribute name="language" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@compression">
                                                                <xsl:attribute name="compression" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@integrityCheck">
                                                                <xsl:attribute name="integrityCheck" namespace="" select="xs:string(xs:base64Binary(fn:string(.)))"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@integrityCheckAlgorithm">
                                                                <xsl:attribute name="integrityCheckAlgorithm" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="node()">
                                                                <xsl:if test="self::text()">
                                                                    <xsl:sequence select="fn:string(.)"/>
                                                                </xsl:if>
                                                                <xsl:if test="self::toc:reference">
                                                                    <reference>
                                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                                    </reference>
                                                                </xsl:if>
                                                                <xsl:if test="self::toc:thumbnail">
                                                                    <thumbnail>
                                                                        <xsl:for-each select="node()[./self::text()]">
                                                                            <xsl:sequence select="fn:string(.)"/>
                                                                        </xsl:for-each>
                                                                    </thumbnail>
                                                                </xsl:if>
                                                            </xsl:for-each>
                                                        </thumbnail>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </derivationExpr>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:text">
                                            <text>
                                                <xsl:for-each select="@nullFlavor">
                                                    <xsl:attribute name="nullFlavor" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@representation">
                                                    <xsl:attribute name="representation" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@mediaType">
                                                    <xsl:attribute name="mediaType" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@language">
                                                    <xsl:attribute name="language" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@compression">
                                                    <xsl:attribute name="compression" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@integrityCheck">
                                                    <xsl:attribute name="integrityCheck" namespace="" select="xs:string(xs:base64Binary(fn:string(.)))"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="@integrityCheckAlgorithm">
                                                    <xsl:attribute name="integrityCheckAlgorithm" namespace="" select="fn:string(.)"/>
                                                </xsl:for-each>
                                                <xsl:for-each select="node()">
                                                    <xsl:if test="self::text()">
                                                        <xsl:sequence select="fn:string(.)"/>
                                                    </xsl:if>
                                                    <xsl:if test="self::toc:reference">
                                                        <reference>
                                                            <xsl:sequence select="(./@node(), ./node())"/>
                                                        </reference>
                                                    </xsl:if>
                                                    <xsl:if test="self::toc:thumbnail">
                                                        <thumbnail>
                                                            <xsl:for-each select="@nullFlavor">
                                                                <xsl:attribute name="nullFlavor" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@representation">
                                                                <xsl:attribute name="representation" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@mediaType">
                                                                <xsl:attribute name="mediaType" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@language">
                                                                <xsl:attribute name="language" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@compression">
                                                                <xsl:attribute name="compression" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@integrityCheck">
                                                                <xsl:attribute name="integrityCheck" namespace="" select="xs:string(xs:base64Binary(fn:string(.)))"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="@integrityCheckAlgorithm">
                                                                <xsl:attribute name="integrityCheckAlgorithm" namespace="" select="fn:string(.)"/>
                                                            </xsl:for-each>
                                                            <xsl:for-each select="node()">
                                                                <xsl:if test="self::text()">
                                                                    <xsl:sequence select="fn:string(.)"/>
                                                                </xsl:if>
                                                                <xsl:if test="self::toc:reference">
                                                                    <reference>
                                                                        <xsl:sequence select="(./@node(), ./node())"/>
                                                                    </reference>
                                                                </xsl:if>
                                                                <xsl:if test="self::toc:thumbnail">
                                                                    <thumbnail>
                                                                        <xsl:for-each select="node()[./self::text()]">
                                                                            <xsl:sequence select="fn:string(.)"/>
                                                                        </xsl:for-each>
                                                                    </thumbnail>
                                                                </xsl:if>
                                                            </xsl:for-each>
                                                        </thumbnail>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </text>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:statusCode">
                                            <statusCode>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </statusCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:effectiveTime">
                                            <effectiveTime>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </effectiveTime>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:priorityCode">
                                            <priorityCode>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </priorityCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:repeatNumber">
                                            <repeatNumber>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </repeatNumber>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:languageCode">
                                            <languageCode>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </languageCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:interpretationCode">
                                            <interpretationCode>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </interpretationCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:methodCode">
                                            <methodCode>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </methodCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:targetSiteCode">
                                            <targetSiteCode>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </targetSiteCode>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:subject">
                                            <subject>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </subject>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:specimen">
                                            <specimen>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </specimen>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:performer">
                                            <performer>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </performer>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:author">
                                            <author>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </author>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:informant">
                                            <informant>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </informant>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:participant">
                                            <participant>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </participant>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:entryRelationship">
                                            <entryRelationship>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </entryRelationship>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:reference">
                                            <reference>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </reference>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:precondition">
                                            <precondition>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </precondition>
                                        </xsl:for-each>
                                        <xsl:for-each select="toc:referenceRange">
                                            <referenceRange>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </referenceRange>
                                        </xsl:for-each>
                                    </observation>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:observationMedia">
                                    <observationMedia>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </observationMedia>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:organizer">
                                    <organizer>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </organizer>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:procedure">
                                    <procedure>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </procedure>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:regionOfInterest">
                                    <regionOfInterest>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </regionOfInterest>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:substanceAdministration">
                                    <substanceAdministration>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </substanceAdministration>
                                </xsl:for-each>
                                <xsl:for-each select="$var540_resultof_mapAdvanceDirectiveStatus/toc:supply">
                                    <supply>
                                        <xsl:sequence select="(./@node(), ./node())"/>
                                    </supply>
                                </xsl:for-each> -->
                                </observation>
                            </entryRelationship>
                    </observation>
                </entry>
            </xsl:for-each>
            </section>
        </component>
    </xsl:template>
</xsl:stylesheet>