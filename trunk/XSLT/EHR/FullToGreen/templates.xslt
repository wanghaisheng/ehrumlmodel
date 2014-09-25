<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri" xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

	<xsl:template match="cda:text//child::*">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="@* | node()"></xsl:apply-templates>
		</xsl:element>
	</xsl:template>

	<xsl:template match="cda:text//attribute::*">
		<xsl:attribute name="{local-name()}">
    		<xsl:value-of select="." />
    	</xsl:attribute>
	</xsl:template>

	<xsl:template name="qtyPQ">
		<xsl:param name="qtyPQ" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$qtyPQ/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$qtyPQ/@unit">
				<xsl:attribute name="unit" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$qtyPQ/@value">
				<xsl:attribute name="value" select="fn:string(.)" />
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="idII">
		<xsl:param name="idII" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$idII/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$idII/@root">
				<xsl:attribute name="root" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$idII/@extension">
				<xsl:attribute name="extension" select="fn:string(.)" />
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="codeCD">
		<xsl:param name="code" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$code/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$code/@code">
				<xsl:attribute name="code" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$code/@codeSystem">
				<xsl:attribute name="codeSystem" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$code/@codeSystemName">
				<xsl:attribute name="codeSystemName" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$code/@displayName">
				<xsl:attribute name="displayName" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:if test="fn:exists($code/cda:originalText)">
				<xsl:for-each select="$code/cda:originalText">
					<gcda:originalText>
						<xsl:value-of select="." />
						<xsl:for-each select="cda:reference">
							<gcda:reference>
								<xsl:attribute name="value" select="fn:string(@value)" />
							</gcda:reference>
						</xsl:for-each>
					</gcda:originalText>
				</xsl:for-each>
				<!-- <xsl:for-each select="$code/cda:originalText"> <gcda:originalText> 
					<xsl:sequence select="fn:string(.)"/> </gcda:originalText> </xsl:for-each> -->
			</xsl:if>
			<xsl:for-each select="cda:qualifier">
				<xsl:call-template name="qualifier">
					<xsl:with-param name="qualifier" select="." as="node()" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="qualifier">
		<xsl:param name="qualifier" />
		<xsl:for-each select="$qualifier">
			<gcda:qualifier>
				<gcda:name>
					<xsl:for-each select="cda:name/@nullFlavor">
						<xsl:attribute name="nullFlavor" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:name/@code">
						<xsl:attribute name="code" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:name/@codeSystem">
						<xsl:attribute name="codeSystem" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:name/@codeSystemName">
						<xsl:attribute name="codeSystemName" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:name/@displayName">
						<xsl:attribute name="displayName" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:name/cda:originalText">
						<gcda:originalText>
							<xsl:sequence select="fn:string(.)" />
						</gcda:originalText>
					</xsl:for-each>
					<xsl:for-each select="cda:name/cda:qualifier">
						<gcda:qualifier>
							<xsl:sequence select="()" />
						</gcda:qualifier>
					</xsl:for-each>
				</gcda:name>
				<gcda:value>
					<xsl:for-each select="cda:value/@nullFlavor">
						<xsl:attribute name="nullFlavor" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:value/@code">
						<xsl:attribute name="code" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:value/@codeSystem">
						<xsl:attribute name="codeSystem" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:value/@codeSystemName">
						<xsl:attribute name="codeSystemName" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:value/@displayName">
						<xsl:attribute name="displayName" select="fn:string(.)" />
					</xsl:for-each>
					<xsl:for-each select="cda:value/cda:originalText">
						<gcda:originalText>
							<xsl:sequence select="fn:string(.)" />
						</gcda:originalText>
					</xsl:for-each>
					<xsl:for-each select="cda:value/cda:qualifier">
						<gcda:qualifier>
							<xsl:sequence select="()" />
						</gcda:qualifier>
					</xsl:for-each>
				</gcda:value>
			</gcda:qualifier>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="codeCE">
		<xsl:param name="code" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$code/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$code/@code">
				<xsl:attribute name="code" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$code/@codeSystem">
				<xsl:attribute name="codeSystem" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$code/@codeSystemName">
				<xsl:attribute name="codeSystemName" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$code/@displayName">
				<xsl:attribute name="displayName" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$code/cda:originalText">
				<gcda:originalText>
					<xsl:value-of select="." />
					<xsl:for-each select="cda:reference">
						<gcda:reference>
							<xsl:attribute name="value" select="fn:string(@value)" />
						</gcda:reference>
					</xsl:for-each>
				</gcda:originalText>
			</xsl:for-each>
			<!-- <xsl:for-each select="$code/cda:originalText"> <gcda:originalText> 
				<xsl:sequence select="fn:string(.)"/> </gcda:originalText> </xsl:for-each> -->
		</xsl:element>
	</xsl:template>
	<xsl:template name="valueCD">
		<xsl:param name="value" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:attribute name="type"
				namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','CD')" />
			<xsl:for-each select="$value/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@code">
				<xsl:attribute name="code" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@codeSystem">
				<xsl:attribute name="codeSystem" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@codeSystemName">
				<xsl:attribute name="codeSystemName" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@displayName">
				<xsl:attribute name="displayName" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/cda:originalText">
				<gcda:originalText>
					<xsl:value-of select="." />
					<xsl:for-each select="cda:reference">
						<gcda:reference>
							<xsl:attribute name="value" select="fn:string(@value)" />
						</gcda:reference>
					</xsl:for-each>
				</gcda:originalText>
			</xsl:for-each>
			<xsl:for-each select="cda:qualifier">
				<xsl:call-template name="qualifier">
					<xsl:with-param name="qualifier" select="." as="node()" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="valueCE">
		<xsl:param name="value" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:attribute name="type"
				namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','CE')" />
			<xsl:for-each select="$value/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@code">
				<xsl:attribute name="code" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@codeSystem">
				<xsl:attribute name="codeSystem" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@codeSystemName">
				<xsl:attribute name="codeSystemName" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@displayName">
				<xsl:attribute name="displayName" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/cda:originalText">
				<gcda:originalText>
					<xsl:value-of select="." />
					<xsl:for-each select="cda:reference">
						<gcda:reference>
							<xsl:attribute name="value" select="fn:string(@value)" />
						</gcda:reference>
					</xsl:for-each>
				</gcda:originalText>
			</xsl:for-each>
			<!-- <xsl:for-each select="$value/cda:originalText"> <gcda:originalText> 
				<xsl:sequence select="fn:string(.)"/> </gcda:originalText> </xsl:for-each> -->
		</xsl:element>
	</xsl:template>
	<xsl:template name="valuePQ">
		<xsl:param name="value" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:attribute name="type"
				namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','PQ')" />
			<xsl:for-each select="$value/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@unit">
				<xsl:attribute name="unit" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@value">
				<xsl:attribute name="value" select="fn:string(.)" />
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="gcdaPQ">
		<xsl:param name="value" />
		<gcda:physicalQuantity>
			<xsl:for-each select="$value/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@unit">
				<xsl:attribute name="unit" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@value">
				<xsl:attribute name="value" select="fn:string(.)" />
			</xsl:for-each>
		</gcda:physicalQuantity>
	</xsl:template>
	<xsl:template name="gcdaMO">
		<xsl:param name="value" />
		<gcda:monetaryAmount>
			<xsl:for-each select="$value/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@currency">
				<xsl:attribute name="currency" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@value">
				<xsl:attribute name="value" select="fn:string(.)" />
			</xsl:for-each>
		</gcda:monetaryAmount>
	</xsl:template>
	<xsl:template name="intINT">
		<xsl:param name="intINT" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$intINT/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$intINT/@value">
				<xsl:attribute name="value" select="fn:string(.)" />
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="gcdaINT">
		<xsl:param name="value" />
		<gcda:integer>
			<xsl:for-each select="$value/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$value/@value">
				<xsl:attribute name="value" select="fn:string(.)" />
			</xsl:for-each>
		</gcda:integer>
	</xsl:template>
	<xsl:template name="tsTS">
		<xsl:param name="tsTS" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$tsTS/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$tsTS/@value">
				<xsl:attribute name="value" select="fn:string(.)" />
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="ivlTS">
		<xsl:param name="ivlTS" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$ivlTS/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$ivlTS/@value">
				<xsl:attribute name="value" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$ivlTS/@operator">
				<xsl:attribute name="operator" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$ivlTS/cda:low">
				<xsl:call-template name="tsTS">
					<xsl:with-param name="tsTS" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:low'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$ivlTS/cda:width">
				<xsl:call-template name="qtyPQ">
					<xsl:with-param name="qtyPQ" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:width'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$ivlTS/cda:high">
				<xsl:call-template name="tsTS">
					<xsl:with-param name="tsTS" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:high'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$ivlTS/cda:center">
				<xsl:call-template name="tsTS">
					<xsl:with-param name="tsTS" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:center'" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="personName">
		<xsl:param name="personName" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$personName/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$personName/@use">
				<xsl:attribute name="use" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:choose>
				<xsl:when
					test="fn:exists($personName/cda:delimiter) or fn:exists($personName/cda:prefix) or fn:exists($personName/cda:given) or fn:exists($personName/cda:family) or fn:exists($personName/cda:suffix)">
					<xsl:for-each select="$personName/cda:delimiter">
						<gcda:delimiter>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</gcda:delimiter>
					</xsl:for-each>
					<xsl:for-each select="$personName/cda:prefix">
						<gcda:prefix>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</gcda:prefix>
					</xsl:for-each>
					<xsl:for-each select="$personName/cda:given">
						<gcda:given>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</gcda:given>
					</xsl:for-each>
					<xsl:for-each select="$personName/cda:family">
						<gcda:family>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</gcda:family>
					</xsl:for-each>
					<xsl:for-each select="$personName/cda:suffix">
						<gcda:suffix>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</gcda:suffix>
					</xsl:for-each>
					<xsl:if test="fn:exists($personName/cda:validTime)">
						<xsl:call-template name="ivlTS">
							<xsl:with-param name="ivlTS" select="$personName/cda:validTime"
								as="node()" />
							<xsl:with-param name="elementName" select="'gcda:validTime'" />
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$personName and not($personName = '')">
						<xsl:value-of select="$personName" />
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template name="organizationName">
		<xsl:param name="organizationName" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$organizationName/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$organizationName/@use">
				<xsl:attribute name="use" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:choose>
				<xsl:when
					test="fn:exists($organizationName/cda:delimiter) or fn:exists($organizationName/cda:prefix) or fn:exists($organizationName/cda:suffix)">
					<xsl:for-each select="$organizationName/cda:delimiter">
						<gcda:delimiter>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</gcda:delimiter>
					</xsl:for-each>
					<xsl:for-each select="$organizationName/cda:prefix">
						<gcda:prefix>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</gcda:prefix>
					</xsl:for-each>
					<xsl:for-each select="$organizationName/cda:suffix">
						<gcda:suffix>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</gcda:suffix>
					</xsl:for-each>
					<xsl:if test="fn:exists($organizationName/cda:validTime)">
						<xsl:call-template name="ivlTS">
							<xsl:with-param name="ivlTS"
								select="$organizationName/cda:validTime" as="node()" />
							<xsl:with-param name="elementName" select="'gcda:validTime'" />
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$organizationName and not($organizationName = '')">
						<xsl:value-of select="$organizationName" />
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>
	<xsl:template name="telecom">
		<xsl:param name="telecom" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$telecom/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$telecom/@use">
				<xsl:attribute name="use" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$telecom/@value">
				<xsl:attribute name="value" select="fn:string(.)" />
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="address">
		<xsl:param name="address" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$address/@nullFlavor">
				<xsl:attribute name="nullFlavor" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$address/@use">
				<xsl:attribute name="use" select="fn:string(.)" />
			</xsl:for-each>
			<xsl:for-each select="$address/cda:state">
				<gcda:state>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</gcda:state>
			</xsl:for-each>
			<xsl:for-each select="$address/cda:city">
				<gcda:city>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</gcda:city>
			</xsl:for-each>
			<xsl:for-each select="$address/cda:postalCode">
				<gcda:postalCode>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</gcda:postalCode>
			</xsl:for-each>
			<xsl:for-each select="$address/cda:streetAddressLine">
				<gcda:streetAddressLine>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</gcda:streetAddressLine>
			</xsl:for-each>
			<xsl:for-each select="$address/cda:country">
				<gcda:country>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</gcda:country>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="organization">
		<xsl:param name="organization" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="cda:id">
				<xsl:call-template name="idII">
					<xsl:with-param name="idII" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:organizationID'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:addr">
				<xsl:call-template name="address">
					<xsl:with-param name="address" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:organizationAddress'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:telecom">
				<xsl:call-template name="telecom">
					<xsl:with-param name="telecom" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:organizationTelecom'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:name">
				<xsl:call-template name="organizationName">
					<xsl:with-param name="organizationName" select="."
						as="node()" />
					<xsl:with-param name="elementName" select="'gcda:organizationName'" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>

	<xsl:template name="assignedEntityPerformer">
		<xsl:param name="assignedEntityPerformer" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="cda:id">
				<xsl:call-template name="idII">
					<xsl:with-param name="idII" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:organizationID'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:addr">
				<xsl:call-template name="address">
					<xsl:with-param name="address" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:organizationAddress'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:telecom">
				<xsl:call-template name="telecom">
					<xsl:with-param name="telecom" select="." as="node()" />
					<xsl:with-param name="elementName" select="'gcda:organizationTelecom'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="cda:representedOrganization/cda:name">
				<xsl:call-template name="organizationName">
					<xsl:with-param name="organizationName" select="."
						as="node()" />
					<xsl:with-param name="elementName" select="'gcda:organizationName'" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<!-- This template maps the nonXMLBody text from the CDA to CIM -->
	<xsl:template name="mapNonXMLBodyTextToCIM">
		<xsl:param name="text" select="()" />
		<text>
			<xsl:choose>
				<xsl:when test="not(fn:exists($text/cda:reference))">
					<xsl:if test="fn:string-length($text/@representation)>0">
						<xsl:for-each select="$text">
							<xsl:attribute name="language" namespace=""
								select="@representation" />
						</xsl:for-each>
					</xsl:if>

					<xsl:if test="fn:string-length($text/@compression)>0">
						<xsl:for-each select="$text">
							<xsl:attribute name="compression" namespace=""
								select="@compression" />
						</xsl:for-each>
					</xsl:if>

					<xsl:if test="fn:string-length($text/@mediaType)>0">
						<xsl:for-each select="$text">
							<xsl:attribute name="mediaType" namespace=""
								select="@mediaType" />
						</xsl:for-each>
					</xsl:if>

					<xsl:for-each select="$text">
						<data>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</data>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="$text/node()" />
				</xsl:otherwise>
			</xsl:choose>
		</text>
	</xsl:template>

</xsl:stylesheet>