<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps.xslt"/>
	<xsl:template name="condition">
		<xsl:param name="condition" />
		<xsl:param name="idNum" />
		<entry>
	        <act>
	            <xsl:attribute name="classCode" select="'ACT'"/>
	            <xsl:attribute name="moodCode" select="'EVN'"/>
                <xsl:for-each select="$condition/@nullFlavor">
                    <xsl:attribute name="nullFlavor" namespace="" select="fn:string(.)"/>
                </xsl:for-each>
                <xsl:for-each select="$condition/@negationInd">
                    <xsl:attribute name="negationInd" namespace="" select="xs:string(xs:boolean(fn:string(.)))"/>
                </xsl:for-each>
	            <templateId root="2.16.840.1.113883.3.88.11.83.7"/>
	            <templateId root="2.16.840.1.113883.10.20.1.27"/>
	            <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.5.1" />
	            <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.5.2" />
	            <id root="2.16.840.1.113883.3.1275" extension="12345"/>
	            <code>
	                <xsl:attribute name="nullFlavor" select="'NA'"/>
	            </code>
	           <statusCode>
	           <xsl:if test="fn:exists(toc:ConcernStatus/@code)">
			              <xsl:attribute name="code" namespace="" select="toc:ConcernStatus/@code"/>
			              </xsl:if>
		       </statusCode>
		       <xsl:for-each select="toc:ConcernDuration">
					                    <xsl:call-template name="ivlTS">
					                        <xsl:with-param name="ivlTS" select="." as="node()" />
					                        <xsl:with-param name="elementName" select="'effectiveTime'" />
					                    </xsl:call-template>
				</xsl:for-each>
	            <xsl:for-each select="$condition/toc:TreatingProvider">
	                <performer>
	                    <assignedEntity>
	                        <xsl:for-each select="toc:TreatingProviderID">
			                    <xsl:call-template name="idII">
			                        <xsl:with-param name="idII" select="." as="node()" />
			                    </xsl:call-template>
			                </xsl:for-each>
	                    </assignedEntity>
	                </performer>
	            </xsl:for-each>
	           <!--  <xsl:for-each select="$condition/toc:problemType"> -->
	                <entryRelationship>
	                    <xsl:for-each select="@nullFlavor">
	                        <xsl:attribute name="nullFlavor" select="fn:string(.)"/>
	                    </xsl:for-each>
	                    <xsl:attribute name="typeCode" select="'SUBJ'"/>
	                    <!--  sequenceNumber -->
	                    <xsl:if test="fn:exists(toc:DiagnosisPriority)">  
	                    <sequenceNumber>
	                        <xsl:for-each select="$condition/toc:DiagnosisPriority">
	                            <xsl:attribute name="value" select="xs:string(xs:integer(fn:string(.)))"/>
	                        </xsl:for-each>
	                    </sequenceNumber>
	                    </xsl:if>
	                    <observation>
	                        <xsl:attribute name="classCode" select="'OBS'"/>
	                        <xsl:attribute name="moodCode" select="'EVN'"/>
	                        <xsl:attribute name="negationInd" select="'false'"/>
	                        <templateId root="2.16.840.1.113883.10.20.1.28"/>
	                        <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.5"/>
	                        <id root="2C748172-7CC2-4902-8AF0-23A105C4401B"/>
                  
                  <!--  Problem Type -->
                  <xsl:choose>
                  <xsl:when test="fn:exists($condition/toc:ProblemType/@code)">
        
	                        <xsl:for-each select="$condition/toc:ProblemType">
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
                            <text>
<!--                                 <reference> -->
<!--                                     <xsl:attribute name="value" select="concat('cond_', $idNum)" /> -->
<!--  	                            </reference> -->
	                            <xsl:for-each select="$condition/toc:ProblemName">
	                                <xsl:sequence select="fn:string(.)"/>
	                            </xsl:for-each>
	                        </text>
	                        
	                        <statusCode code="completed"/>
	                        <!--  Problem Date -->
	                        <xsl:if test="fn:exists($condition/toc:ProblemDate)"> 
	                        <xsl:for-each select="$condition/toc:ProblemDate">
			                    <xsl:call-template name="ivlTS">
			                        <xsl:with-param name="ivlTS" select="." as="node()" />
			                        <xsl:with-param name="elementName" select="'effectiveTime'" />
			                    </xsl:call-template>
	                        </xsl:for-each>
	                        </xsl:if>
	                        
	                        <!--  Problem Code -->
	                        <xsl:if test="fn:exists($condition/toc:ProblemCode)">  
		                        <xsl:for-each select="$condition/toc:ProblemCode">
				                    <xsl:call-template name="valueCD">
				                        <xsl:with-param name="value" select="." as="node()" />
				                    </xsl:call-template>
				                </xsl:for-each>  
			                </xsl:if>
			                    
			                <!-- Health Status -->
			                <xsl:if test="fn:exists(toc:HealthStatus)">  
	            				<entryRelationship typeCode="REFR" inversionInd="false">
	                                    <observation classCode="OBS" moodCode="EVN">
	                                        <templateId root="2.16.840.1.113883.10.20.1.51"/>
	                                          <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.1.2"/>
	                                        <code code="11323-3" displayName="Health Status" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
								 <text/>
								<statusCode code="completed"/>
	                                        <xsl:for-each select="toc:HealthStatus">
				                    <xsl:call-template name="valueCD">
				                        <xsl:with-param name="value" select="." as="node()" />
				                    </xsl:call-template>
	                                        </xsl:for-each>
	                                    </observation>
	                                </entryRelationship>
	                           </xsl:if>
	                           
                               <!--  Clinical Status -->
                               <xsl:if test="fn:exists(toc:ClinicalStatus)">  
                                  <entryRelationship typeCode="REFR">
                                   <observation classCode="OBS" moodCode="EVN">
                                       <templateId root="2.16.840.1.113883.10.20.1.57"/>                                          
                                       <code code="33999-4" displayName="Status" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                                       <statusCode code="completed"/>
                                       <xsl:for-each select="toc:ClinicalStatus">
		                    <xsl:call-template name="valueCE">
		                        <xsl:with-param name="value" select="." as="node()" />
		                    </xsl:call-template>
                                       </xsl:for-each>
                                   </observation>
                               </entryRelationship>
                               </xsl:if>
	                    </observation>
	                </entryRelationship>
	           <!--  </xsl:for-each> -->
	           
	           <!--  Age at Onset -->
	           <xsl:if test="fn:exists($condition/toc:AgeAtOnset)"> 
	            <xsl:for-each select="$condition/toc:AgeAtOnset">
	                <entryRelationship>
	                    <xsl:attribute name="typeCode" select="'SUBJ'"/>
	                    <xsl:attribute name="inversionInd" select="xs:string(xs:boolean('true'))"/>
	                    <observation>
	                        <xsl:attribute name="classCode" select="'OBS'"/>
	                        <xsl:attribute name="moodCode" select="'EVN'"/>
	                        <templateId>
	                            <xsl:attribute name="root" select="'2.16.840.1.113883.10.20.1.38'"/>
	                        </templateId>
	                       
	                        <code>
	                            <xsl:attribute name="code" select="'397659008'"/>
	                            <xsl:attribute name="displayName" select="'Age'"/>
	                            <xsl:attribute name="codeSystem" select="'2.16.840.1.113883.6.96'"/>
	                            <xsl:attribute name="codeSystemName" select="'SNOMED CT'"/>
	                        </code>
                                 <statusCode code="completed"/>
                               <value>
	                            <xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','INT')"/>
	                            <xsl:attribute name="value" select="."/>
	                        </value>
	                    </observation>
	                </entryRelationship>
	            </xsl:for-each>
	            </xsl:if>
	            <!--  Cause of Death -->
	            <xsl:if test="fn:exists($condition/toc:CauseOfDeath)"> 
	            <xsl:for-each select="$condition/toc:CauseOfDeath">
	                <entryRelationship>
	                    <xsl:attribute name="typeCode" select="'CAUS'"/>
	                    <observation>
	                        <xsl:attribute name="classCode" select="'OBS'"/>
	                        <xsl:attribute name="moodCode" select="'EVN'"/>
	                        <templateId root="2.16.840.1.113883.10.20.1.42"/>
							<templateId root="2.16.840.1.113883.10.20.1.22"/>	                        
	                        <id root="2.16.840.1.113883.3.1275"/>
	                        <code>
	                            <xsl:attribute name="code" select="'419620001'"/>
	                            <xsl:attribute name="displayName" select="'death'"/>
	                            <xsl:attribute name="codeSystem" select="'2.16.840.1.113883.6.96'"/>
	                            <xsl:attribute name="codeSystemName" select="'SNOMED CT'"/>
	                        </code>
	                        <statusCode code="completed"/>
			                <xsl:for-each select="$condition/toc:CauseOfDeath/toc:TimeOfDeath">
			                    <xsl:call-template name="tsTS">
			                        <xsl:with-param name="tsTS" select="." as="node()" />
			                        <xsl:with-param name="elementName" select="'effectiveTime'" />
			                    </xsl:call-template>
			                </xsl:for-each>
	                        <value>
	                            <xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','CD')"/>
	                            <xsl:attribute name="code" select="'419099009'"/>
	                            <xsl:attribute name="codeSystem" select="'2.16.840.1.113883.6.96'"/>
	                            <xsl:attribute name="displayName" select="'Dead'"/>
	                        </value>
                                <!-- NOTE check the appropriate typeCode -->
	                        <entryRelationship typeCode="CAUS">
	                            <observation>
	                                <xsl:attribute name="classCode" select="'OBS'"/>
	                                <xsl:attribute name="moodCode" select="'EVN'"/>
	                                <templateId>
	                                    <xsl:attribute name="root" select="'2.16.840.1.113883.10.20.1.38'"/>
	                                </templateId>
	                                
	                                <code>
	                                    <xsl:attribute name="code" select="'397659008'"/>
	                                    <xsl:attribute name="codeSystem" select="'2.16.840.1.113883.6.96'"/>
	                                    <xsl:attribute name="displayName" select="'Age'"/>
	                                </code>
	                                <statusCode code="completed"/>
                                        <xsl:for-each select="$condition/toc:CauseOfDeath/toc:AgeAtDeath">
	                                    <value>
	                                        <xsl:attribute name="type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','INT')"/>
	                                        <xsl:attribute name="value" select="."/>
	                                    </value>
	                                </xsl:for-each>
	                            </observation>
	                        </entryRelationship>
	                    </observation>
	                </entryRelationship>
                </xsl:for-each>
                </xsl:if>
                
                <!--  Problem status -->
	            <xsl:for-each select="$condition/toc:ProblemStatus">
<!-- 	                <xsl:variable name="var3_resultof_mapProblemStatus" as="node()?"> -->
	                    <xsl:call-template name="mapProblemStatus">
                            <xsl:with-param name="problemStatus" select="(self::node())"></xsl:with-param>
<!-- 	                        <xsl:with-param name="problemStatus" as="node()"> -->
<!-- 	                            <toc:problemStatus xsl:exclude-result-prefixes="toc"> -->
<!-- 	                                <xsl:sequence select="(./@node(), ./node())"/> -->
<!-- 	                            </toc:problemStatus> -->
<!-- 	                        </xsl:with-param> -->
	                    </xsl:call-template>
	            </xsl:for-each>
                <xsl:for-each select="$condition/toc:RealmCode">
                    <realmCode>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </realmCode>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:TypeId">
                    <typeId>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </typeId>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:Text">
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
                            <xsl:if test="self::reference">
                                <reference>
                                    <xsl:sequence select="(./@node(), ./node())"/>
                                </reference>
                            </xsl:if>
                            <xsl:if test="self::thumbnail">
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
                                        <xsl:if test="self::reference">
                                            <reference>
                                                <xsl:sequence select="(./@node(), ./node())"/>
                                            </reference>
                                        </xsl:if>
                                        <xsl:if test="self::thumbnail">
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
                <xsl:for-each select="$condition/toc:EffectiveTime">
                    <effectiveTime>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </effectiveTime>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:StatusCode">
                    <statusCode>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </statusCode>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:PriorityCode">
                    <priorityCode>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </priorityCode>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:LanguageCode">
                    <languageCode>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </languageCode>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:Subject">
                    <subject>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </subject>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:Specimen">
                    <specimen>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </specimen>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:Author">
                    <author>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </author>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:Informant">
                    <informant>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </informant>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:Participant">
                    <participant>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </participant>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:Reference">
                    <reference>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </reference>
                </xsl:for-each>
                <xsl:for-each select="$condition/toc:Precondition">
                    <precondition>
                        <xsl:sequence select="(./@node(), ./node())"/>
                    </precondition>
                </xsl:for-each>
	        </act>
		</entry>
	</xsl:template>
</xsl:stylesheet>