<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:import href="../maps.xslt"/>
    <xsl:template name="procedure">
        <xsl:param name="procedure"/>
        <xsl:param name="whereFrom"/>
        
        <xsl:variable name="moodCode">
	        <xsl:choose>
	            <xsl:when test="$whereFrom and ($whereFrom = 'poc')">
	                <xsl:value-of select="'INT'"/>
	            </xsl:when>
	            <xsl:otherwise>
	                <xsl:value-of select="'EVN'"/>
	            </xsl:otherwise> 
	        </xsl:choose>
        </xsl:variable>
        
        <entry>
            <procedure classCode="PROC">
                <xsl:attribute name="moodCode" namespace="" select="$moodCode"/>
            	<templateId root="2.16.840.1.113883.3.88.11.83.17"/>
                <templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.19"/>
                
                <xsl:choose>
	                <xsl:when test="$moodCode = 'EVN'">
	                    <templateId root="2.16.840.1.113883.10.20.1.29"/>
	                </xsl:when>
	                <xsl:otherwise>
	                    <templateId root="2.16.840.1.113883.10.20.1.25"/>
	                </xsl:otherwise>
	            </xsl:choose>

                <xsl:for-each select="$procedure/toc:ProcedureID">
	                <xsl:call-template name="idII">
	                    <xsl:with-param name="idII" select="." as="node()" />
	                </xsl:call-template>
                </xsl:for-each>
                <xsl:for-each select="$procedure/toc:ProcedureType">
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
                        <xsl:for-each select="$procedure/toc:ProcedureFreeTextType">
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
                <statusCode code="completed"/>
                <xsl:for-each select="$procedure/toc:Text">
	                <text>
		                <!-- <xsl:for-each select="node()[./self::text()]">
		                       <xsl:sequence select="fn:string(.)"/>
		                </xsl:for-each> -->
		                <xsl:apply-templates select="@* | child::*"/>
					</text>
				</xsl:for-each>
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
                    <performer>
                        <assignedEntity>
	                        <xsl:for-each select="gcda:organizationID">
		                        <xsl:call-template name="idII">
		                            <xsl:with-param name="idII" select="." as="node()" />
		                        </xsl:call-template>
	                        </xsl:for-each>
                            <representedOrganization>
                                <xsl:for-each select="gcda:organizationName">
                                    <xsl:call-template name="organizationName">
                                        <xsl:with-param name="organizationName" select="." as="node()" />
                                    </xsl:call-template>
                                </xsl:for-each>
                                <xsl:for-each select="gcda:organizationTelecom">
                                    <xsl:call-template name="telecom">
                                        <xsl:with-param name="telecom" select="." as="node()" />
                                    </xsl:call-template>
                                </xsl:for-each>
                                <xsl:for-each select="gcda:organizationAddress">
                                    <xsl:call-template name="address">
                                        <xsl:with-param name="address" select="." as="node()" />
                                    </xsl:call-template>
                                </xsl:for-each>
                            </representedOrganization>
                        </assignedEntity>
                    </performer>
                </xsl:for-each>
            </procedure>
        </entry>
    </xsl:template>
</xsl:stylesheet>