<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

	<xsl:template match="toc:Text//child::*">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="@* | node()"></xsl:apply-templates>
		</xsl:element>
	</xsl:template>

	<xsl:template match="toc:Text//attribute::*">
		<xsl:attribute name="{local-name()}">
    		<xsl:value-of select="." />
    	</xsl:attribute>
	</xsl:template>

	<xsl:template match="toc:text//child::*">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="@* | node()"></xsl:apply-templates>
		</xsl:element>
	</xsl:template>

	<xsl:template match="toc:text//attribute::*">
		<xsl:attribute name="{local-name()}">
    		<xsl:value-of select="." />
    	</xsl:attribute>
	</xsl:template>

	<xsl:template match="@*">
		<xsl:copy />
	</xsl:template>

	<!-- <xsl:import href="../common/functions.xslt"/> -->
	<xsl:template name="copyText">
		<xsl:param name="text" />
		<xsl:copy-of select="$text" />
	</xsl:template>
	<xsl:template name="qtyPQ">
		<xsl:param name="qtyPQ" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:if test="$qtyPQ/@nullFlavor and not($qtyPQ/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$qtyPQ/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$qtyPQ/@unit and not($qtyPQ/@unit = '')">
				<xsl:attribute name="unit" select="$qtyPQ/@unit" />
			</xsl:if>
			<xsl:if test="$qtyPQ/@value and not($qtyPQ/@value = '')">
				<xsl:attribute name="value" select="$qtyPQ/@value" />
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template name="idII">
		<xsl:param name="idII" />
		<xsl:param name="elementName" select="'id'" />
		<xsl:element name="{$elementName}">
			<xsl:if test="$idII/@nullFlavor and not($idII/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$idII/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$idII/@root and not($idII/@root = '')">
				<xsl:attribute name="root" select="$idII/@root" />
			</xsl:if>
			<xsl:if test="$idII/@extension and not($idII/@extension = '')">
				<xsl:attribute name="extension" select="$idII/@extension" />
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template name="codeCD">
		<xsl:param name="code" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:if test="$code/@nullFlavor and not($code/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$code/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$code/@code and not($code/@code = '')">
				<xsl:attribute name="code" select="$code/@code" />
			</xsl:if>
			<xsl:if test="$code/@codeSystem and not($code/@codeSystem = '')">
				<xsl:attribute name="codeSystem" select="$code/@codeSystem" />
			</xsl:if>
			<xsl:if test="$code/@codeSystemName and not($code/@codeSystemName = '')">
				<xsl:attribute name="codeSystemName" select="$code/@codeSystemName" />
			</xsl:if>
			<xsl:if test="$code/@displayName and not($code/@displayName = '')">
				<xsl:attribute name="displayName" select="$code/@displayName" />
			</xsl:if>
			<xsl:for-each select="$code/gcda:originalText">
				<originalText>
					<xsl:value-of select="." />
					<xsl:if test="gcda:reference">
						<reference>
							<xsl:attribute name="value" select="gcda:reference/@value" />
						</reference>
					</xsl:if>
				</originalText>
			</xsl:for-each>
		<!--	<xsl:if
				test="$code/gcda:originalText and not($code/gcda:originalText = '')"> -->
				<!-- This is commented as the <gcda:originalText> is already being generated 
					<originalText> -->
			<!--	<xsl:sequence select="$code/gcda:originalText" />-->
				<!-- </originalText> -->
		<!--	</xsl:if> -->
			<xsl:for-each select="gcda:qualifier">
				<xsl:call-template name="qualifier">
					<xsl:with-param name="qualifier" select="." as="node()" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="qualifier">
		<xsl:param name="qualifier" />
		<xsl:for-each select="$qualifier">
			<qualifier>
				<name>
					<xsl:if test="gcda:name/@nullFlavor and not(gcda:name/@nullFlavor = '')">
						<xsl:attribute name="nullFlavor" select="gcda:name/@nullFlavor" />
					</xsl:if>
					<xsl:if test="gcda:name/@code and not(gcda:name/@code = '')">
						<xsl:attribute name="code" select="gcda:name/@code" />
					</xsl:if>
					<xsl:if test="gcda:name/@codeSystem and not(gcda:name/@codeSystem = '')">
						<xsl:attribute name="codeSystem" select="gcda:name/@codeSystem" />
					</xsl:if>
					<xsl:if
						test="gcda:name/@codeSystemName and not(gcda:name/@codeSystemName = '')">
						<xsl:attribute name="codeSystemName" select="gcda:name/@codeSystemName" />
					</xsl:if>
					<xsl:if
						test="gcda:name/@displayName and not(gcda:name/@displayName = '')">
						<xsl:attribute name="displayName" select="gcda:name/@displayName" />
					</xsl:if>
					<xsl:for-each select="gcda:name/gcda:originalText">
						<originalText>
							<xsl:sequence select="fn:string(.)" />
						</originalText>
					</xsl:for-each>
					<xsl:for-each select="gcda:name/gcda:qualifier">
						<qualifier>
							<xsl:sequence select="()" />
						</qualifier>
					</xsl:for-each>
				</name>
				<value>
					<xsl:if
						test="gcda:value/@nullFlavor and not(gcda:value/@nullFlavor = '')">
						<xsl:attribute name="nullFlavor" select="gcda:value/@nullFlavor" />
					</xsl:if>
					<xsl:if test="gcda:value/@code and not(gcda:value/@code = '')">
						<xsl:attribute name="code" select="gcda:value/@code" />
					</xsl:if>
					<xsl:if
						test="gcda:value/@codeSystem and not(gcda:value/@codeSystem = '')">
						<xsl:attribute name="codeSystem" select="gcda:value/@codeSystem" />
					</xsl:if>
					<xsl:if
						test="gcda:value/@codeSystemName and not(gcda:value/@codeSystemName = '')">
						<xsl:attribute name="codeSystemName" select="gcda:value/@codeSystemName" />
					</xsl:if>
					<xsl:if
						test="gcda:value/@displayName and not(gcda:value/@displayName = '')">
						<xsl:attribute name="displayName" select="gcda:value/@displayName" />
					</xsl:if>
					<xsl:for-each select="gcda:value/gcda:originalText">
						<originalText>
							<xsl:sequence select="fn:string(.)" />
						</originalText>
					</xsl:for-each>
					<xsl:for-each select="gcda:value/gcda:qualifier">
						<qualifier>
							<xsl:sequence select="()" />
						</qualifier>
					</xsl:for-each>
				</value>
			</qualifier>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="codeCE">
		<xsl:param name="code" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:if test="$code/@nullFlavor and not($code/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$code/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$code/@code and not($code/@code = '')">
				<xsl:attribute name="code" select="$code/@code" />
			</xsl:if>
			<xsl:if test="$code/@codeSystem and not($code/@codeSystem = '')">
				<xsl:attribute name="codeSystem" select="$code/@codeSystem" />
			</xsl:if>
			<xsl:if test="$code/@codeSystemName and not($code/@codeSystemName = '')">
				<xsl:attribute name="codeSystemName" select="$code/@codeSystemName" />
			</xsl:if>
			<xsl:if test="$code/@displayName and not($code/@displayName = '')">
				<xsl:attribute name="displayName" select="$code/@displayName" />
			</xsl:if>
			<xsl:for-each select="$code/gcda:originalText">
				<originalText>
					<xsl:value-of select="." />
					<xsl:if test="gcda:reference">
						<reference>
							<xsl:attribute name="value" select="gcda:reference/@value" />
						</reference>
					</xsl:if>
				</originalText>
			</xsl:for-each>
			<!-- <xsl:for-each select="$code/gcda:originalText"> <originalText> <xsl:sequence 
				select="fn:string(.)"/> </originalText> </xsl:for-each> -->
		</xsl:element>
	</xsl:template>
	<xsl:template name="valueCD">
		<xsl:param name="value" />
		<value>
			<xsl:attribute name="type"
				namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','CD')" />
			<xsl:if test="$value/@nullFlavor and not($value/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$value/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$value/@code and not($value/@code = '')">
				<xsl:attribute name="code" select="$value/@code" />
			</xsl:if>
			<xsl:if test="$value/@codeSystem and not($value/@codeSystem = '')">
				<xsl:attribute name="codeSystem" select="$value/@codeSystem" />
			</xsl:if>
			<xsl:if test="$value/@codeSystemName and not($value/@codeSystemName = '')">
				<xsl:attribute name="codeSystemName" select="$value/@codeSystemName" />
			</xsl:if>
			<xsl:if test="$value/@displayName and not($value/@displayName = '')">
				<xsl:attribute name="displayName" select="$value/@displayName" />
			</xsl:if>
			<xsl:for-each select="$value/gcda:originalText">
				<originalText>
					<xsl:value-of select="." />
					<xsl:if test="gcda:reference">
						<reference>
							<xsl:attribute name="value" select="gcda:reference/@value" />
							<!-- <xsl:sequence select="fn:string(.)"/> -->
						</reference>
					</xsl:if>
				</originalText>
			</xsl:for-each>
			<xsl:for-each select="gcda:qualifier">
				<xsl:call-template name="qualifier">
					<xsl:with-param name="qualifier" select="." as="node()" />
				</xsl:call-template>
			</xsl:for-each>
		</value>
	</xsl:template>
	<xsl:template name="valueCE">
		<xsl:param name="value" />
		<value>
			<xsl:attribute name="type"
				namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','CE')" />
			<xsl:if test="$value/@nullFlavor and not($value/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$value/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$value/@code and not($value/@code = '')">
				<xsl:attribute name="code" select="$value/@code" />
			</xsl:if>
			<xsl:if test="$value/@codeSystem and not($value/@codeSystem = '')">
				<xsl:attribute name="codeSystem" select="$value/@codeSystem" />
			</xsl:if>
			<xsl:if test="$value/@codeSystemName and not($value/@codeSystemName = '')">
				<xsl:attribute name="codeSystemName" select="$value/@codeSystemName" />
			</xsl:if>
			<xsl:if test="$value/@displayName and not($value/@displayName = '')">
				<xsl:attribute name="displayName" select="$value/@displayName" />
			</xsl:if>
			<xsl:for-each select="$value/gcda:originalText">
				<originalText>
					<xsl:value-of select="." />
					<xsl:if test="gcda:reference">
						<reference>
							<xsl:attribute name="value" select="gcda:reference/@value" />
							<!-- <xsl:sequence select="fn:string(.)"/> -->
						</reference>
					</xsl:if>
				</originalText>
			</xsl:for-each>
		</value>
	</xsl:template>
	<xsl:template name="valuePQ">
		<xsl:param name="value" />
		<value>
			<xsl:attribute name="type"
				namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','PQ')" />
			<xsl:if test="$value/@nullFlavor and not($value/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$value/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$value/@unit and not($value/@unit = '')">
				<xsl:attribute name="unit" select="$value/@unit" />
			</xsl:if>
			<xsl:if test="$value/@value and not($value/@value = '')">
				<xsl:attribute name="value" select="$value/@value" />
			</xsl:if>
		</value>
	</xsl:template>
	<xsl:template name="intINT">
		<xsl:param name="intINT" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:if test="$intINT/@nullFlavor and not($intINT/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$intINT/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$intINT/@value and not($intINT/@value = '')">
				<xsl:attribute name="value" select="$intINT/@value" />
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template name="valueINT">
		<xsl:param name="value" />
		<value>
			<xsl:attribute name="type"
				namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','INT')" />
			<xsl:if test="$value/@nullFlavor and not($value/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$value/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$value/@value and not($value/@value = '')">
				<xsl:attribute name="value" select="$value/@value" />
			</xsl:if>
		</value>
	</xsl:template>
	<xsl:template name="moMO">
		<xsl:param name="moMO" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:if test="$moMO/@nullFlavor and not($moMO/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$moMO/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$moMO/@value and not($moMO/@value = '')">
				<xsl:attribute name="value" select="$moMO/@value" />
			</xsl:if>
			<xsl:if test="$moMO/@currency and not($moMO/@currency = '')">
				<xsl:attribute name="currency" select="$moMO/@currency" />
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template name="valueMO">
		<xsl:param name="value" />
		<value>
			<xsl:attribute name="type"
				namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','MO')" />
			<xsl:if test="$value/@nullFlavor and not($value/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$value/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$value/@value and not($value/@value = '')">
				<xsl:attribute name="value" select="$value/@value" />
			</xsl:if>
			<xsl:if test="$value/@currency and not($value/@currency = '')">
				<xsl:attribute name="currency" select="$value/@currency" />
			</xsl:if>
		</value>
	</xsl:template>
	<xsl:template name="tsTS">
		<xsl:param name="tsTS" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:if test="$tsTS/@nullFlavor and not($tsTS/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$tsTS/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$tsTS/@value and not($tsTS/@value = '')">
				<xsl:attribute name="value" select="$tsTS/@value" />
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template name="sxcmTS">
		<xsl:param name="sxcmTS" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:if test="$sxcmTS/@nullFlavor and not($sxcmTS/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$sxcmTS/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$sxcmTS/@value and not($sxcmTS/@value = '')">
				<xsl:attribute name="value" select="$sxcmTS/@value" />
			</xsl:if>
			<xsl:if test="$sxcmTS/@operator and not($sxcmTS/@operator = '')">
				<xsl:attribute name="operator" select="$sxcmTS/@operator" />
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<xsl:template name="ivlTS">
		<xsl:param name="ivlTS" />
		<xsl:param name="elementName" />
		<xsl:param name="timeType" select="'blank'" />
		<xsl:element name="{$elementName}">
			<xsl:if test="not($timeType = 'blank')">
				<xsl:attribute name="type"
					namespace="http://www.w3.org/2001/XMLSchema-instance" select="fn:QName('urn:hl7-org:v3','IVL_TS')" />
			</xsl:if>
			<xsl:if test="$ivlTS/@nullFlavor and not($ivlTS/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="fn:string($ivlTS/@nullFlavor)" />
			</xsl:if>
			<xsl:if test="$ivlTS/@value and not($ivlTS/@value = '')">
				<xsl:attribute name="value" select="$ivlTS/@value" />
			</xsl:if>
			<xsl:if test="$ivlTS/@operator and not($ivlTS/@operator = '')">
				<xsl:attribute name="operator" select="$ivlTS/@operator" />
			</xsl:if>
			<xsl:for-each select="$ivlTS/gcda:low">
				<xsl:call-template name="tsTS">
					<xsl:with-param name="tsTS" select="." as="node()" />
					<xsl:with-param name="elementName" select="'low'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$ivlTS/gcda:width">
				<xsl:call-template name="qtyPQ">
					<xsl:with-param name="qtyPQ" select="." as="node()" />
					<xsl:with-param name="elementName" select="'width'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$ivlTS/gcda:high">
				<xsl:call-template name="tsTS">
					<xsl:with-param name="tsTS" select="." as="node()" />
					<xsl:with-param name="elementName" select="'high'" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$ivlTS/gcda:center">
				<xsl:call-template name="tsTS">
					<xsl:with-param name="tsTS" select="." as="node()" />
					<xsl:with-param name="elementName" select="'center'" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="personName">
		<xsl:param name="personName" />
		<name>
			<xsl:if
				test="$personName/@nullFlavor and not($personName/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$personName/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$personName/@use and not($personName/@use = '')">
				<xsl:attribute name="use" select="$personName/@use" />
			</xsl:if>
			<xsl:choose>
				<xsl:when
					test="fn:exists($personName/gcda:delimiter) or fn:exists($personName/gcda:prefix) or fn:exists($personName/gcda:given) or fn:exists($personName/gcda:family) or fn:exists($personName/gcda:suffix)">
					<xsl:for-each select="$personName/gcda:delimiter">
						<delimiter>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</delimiter>
					</xsl:for-each>
					<xsl:for-each select="$personName/gcda:prefix">
						<prefix>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</prefix>
					</xsl:for-each>
					<xsl:for-each select="$personName/gcda:given">
						<given>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</given>
					</xsl:for-each>
					<xsl:for-each select="$personName/gcda:family">
						<family>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</family>
					</xsl:for-each>
					<xsl:for-each select="$personName/gcda:suffix">
						<suffix>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</suffix>
					</xsl:for-each>
					<xsl:if test="fn:exists($personName/gcda:validTime)">
						<xsl:call-template name="ivlTS">
							<xsl:with-param name="ivlTS" select="$personName/gcda:validTime"
								as="node()" />
							<xsl:with-param name="elementName" select="'validTime'" />
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$personName and not($personName = '')">
						<xsl:value-of select="$personName" />
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</name>
	</xsl:template>
	<xsl:template name="organizationName">
		<xsl:param name="organizationName" />
		<name>
			<xsl:if
				test="$organizationName/@nullFlavor and not($organizationName/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$organizationName/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$organizationName/@use and not($organizationName/@use = '')">
				<xsl:attribute name="use" select="$organizationName/@use" />
			</xsl:if>
			<xsl:choose>
				<xsl:when
					test="fn:exists($organizationName/gcda:prefix) or fn:exists($organizationName/gcda:prefix) or fn:exists($organizationName/gcda:suffix)">
					<xsl:for-each select="$organizationName/gcda:delimiter">
						<delimiter>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</delimiter>
					</xsl:for-each>
					<xsl:for-each select="$organizationName/gcda:prefix">
						<prefix>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</prefix>
					</xsl:for-each>
					<xsl:for-each select="$organizationName/gcda:suffix">
						<suffix>
							<xsl:if test="@qualifier and not(@qualifier = '')">
								<xsl:attribute name="qualifier" select="@qualifier" />
							</xsl:if>
							<xsl:for-each select="node()[./self::text()]">
								<xsl:sequence select="fn:string(.)" />
							</xsl:for-each>
						</suffix>
					</xsl:for-each>
					<xsl:if test="fn:exists($organizationName/gcda:validTime)">
						<xsl:call-template name="ivlTS">
							<xsl:with-param name="ivlTS"
								select="$organizationName/gcda:validTime" as="node()" />
							<xsl:with-param name="elementName" select="'validTime'" />
						</xsl:call-template>
					</xsl:if>
				</xsl:when>
				<xsl:otherwise>
					<xsl:if test="$organizationName and not($organizationName = '')">
						<xsl:value-of select="$organizationName" />
					</xsl:if>
				</xsl:otherwise>
			</xsl:choose>
		</name>
	</xsl:template>
	<xsl:template name="telecom">
		<xsl:param name="telecom" />
		<telecom>
			<!-- <xsl:apply-templates select="@*"/> -->
			<xsl:if test="$telecom/@nullFlavor and not($telecom/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$telecom/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$telecom/@use and not($telecom/@use = '')">
				<xsl:attribute name="use" select="$telecom/@use" />
			</xsl:if>
			<xsl:if test="$telecom/@value and not($telecom/@value = '')">
				<xsl:attribute name="value" select="$telecom/@value" />
			</xsl:if>
			<xsl:for-each select="$telecom/gcda:useablePeriod">
				<xsl:call-template name="sxcmTS">
					<xsl:with-param name="sxcmTS" select="." as="node()" />
					<xsl:with-param name="elementName" select="'useablePeriod'" />
				</xsl:call-template>
			</xsl:for-each>
		</telecom>
	</xsl:template>
	<xsl:template name="address">
		<xsl:param name="address" />
		<addr>
			<xsl:if test="$address/@nullFlavor and not($address/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$address/@nullFlavor" />
			</xsl:if>
			<xsl:if test="$address/@use and not($address/@use = '')">
				<xsl:attribute name="use" select="$address/@use" />
			</xsl:if>
			<xsl:for-each select="$address/gcda:streetAddressLine">
				<streetAddressLine>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</streetAddressLine>
			</xsl:for-each>
			<xsl:for-each select="$address/gcda:city">
				<city>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</city>
			</xsl:for-each>
			<xsl:for-each select="$address/gcda:state">
				<state>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</state>
			</xsl:for-each>
			<xsl:for-each select="$address/gcda:postalCode">
				<postalCode>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</postalCode>
			</xsl:for-each>
			<xsl:for-each select="$address/gcda:country">
				<country>
					<xsl:for-each select="node()[./self::text()]">
						<xsl:sequence select="fn:string(.)" />
					</xsl:for-each>
				</country>
			</xsl:for-each>
			<xsl:for-each select="$address/gcda:validTime">
				<xsl:call-template name="sxcmTS">
					<xsl:with-param name="sxcmTS" select="." as="node()" />
					<xsl:with-param name="elementName" select="'validTime'" />
				</xsl:call-template>
			</xsl:for-each>
		</addr>
	</xsl:template>
	<xsl:template name="organization">
		<xsl:param name="organization" />
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<xsl:for-each select="$organization/gcda:organizationID">
				<xsl:call-template name="idII">
					<xsl:with-param name="idII" select="." as="node()" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$organization/gcda:organizationName">
				<xsl:call-template name="organizationName">
					<xsl:with-param name="organizationName" select="."
						as="node()" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$organization/gcda:organizationTelecom">
				<xsl:call-template name="telecom">
					<xsl:with-param name="telecom" select="." as="node()" />
				</xsl:call-template>
			</xsl:for-each>
			<xsl:for-each select="$organization/gcda:organizationAddress">
				<xsl:call-template name="address">
					<xsl:with-param name="address" select="." as="node()" />
				</xsl:call-template>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	<xsl:template name="mapProblemStatus">
		<xsl:param name="problemStatus" select="()" />
		<entryRelationship>
			<xsl:attribute name="typeCode" select="'REFR'" />
			<observation>
				<xsl:attribute name="classCode" select="'OBS'" />
				<xsl:attribute name="moodCode" select="'EVN'" />
				<templateId root="2.16.840.1.113883.10.20.1.50" />
				<templateId root="2.16.840.1.113883.10.20.1.51" />
				<templateId root="2.16.840.1.113883.10.20.1.57" />
				<templateId root="1.3.6.1.4.1.19376.1.5.3.1.4.1.1" />
				<code>
					<xsl:attribute name="code" select="'33999-4'" />
					<xsl:attribute name="codeSystem" select="'2.16.840.1.113883.6.1'" />
					<xsl:attribute name="displayName" select="'Status'" />
					<xsl:attribute name="codeSystemName" select="'LOINC'" />
				</code>
				<statusCode code="completed" />
				<xsl:call-template name="valueCE">
					<xsl:with-param name="value" select="$problemStatus"
						as="node()" />
				</xsl:call-template>
			</observation>
		</entryRelationship>
	</xsl:template>
	<xsl:template name="mapAdvanceDirectiveStatus">
		<xsl:param name="status" select="()" />
		<POCD_MT000040.EntryRelationship>
			<xsl:if test="$status/@nullFlavor and not($status/@nullFlavor = '')">
				<xsl:attribute name="nullFlavor" select="$status/@nullFlavor" />
			</xsl:if>
			<xsl:attribute name="typeCode" select="'REFR'" />
			<observation classCode="OBS" moodCode="EVN">
				<templateId root="2.16.840.1.113883.10.20.1.37" />
				<code>
					<xsl:attribute name="code" select="'33999-4'" />
					<xsl:attribute name="codeSystem" select="'2.16.840.1.113883.6.1'" />
					<xsl:attribute name="displayName" select="'Current and Verified'" />
				</code>
				<statusCode>
					<xsl:attribute name="code" select="'completed'" />
				</statusCode>
				<xsl:call-template name="valueCD">
					<xsl:with-param name="value" select="$status" as="node()" />
				</xsl:call-template>
			</observation>
		</POCD_MT000040.EntryRelationship>
	</xsl:template>
	<xsl:template name="mapMedicationInformation">
		<xsl:param name="medicationInformation" select="()" />
		<!-- This is addded because the medication information for Procedure has 
			different template ID from immunization -->
		<xsl:param name="medicationInformationTemplateId" />

		<manufacturedProduct>
			<xsl:attribute name="classCode" namespace="" select="'MANU'" />
			<!-- <templateId root="2.16.840.1.113883.10.20.22.4.23"/> -->
			<templateId>
				<xsl:attribute name="root" select="$medicationInformationTemplateId" />
			</templateId>
			<manufacturedMaterial>
				<xsl:for-each select="$medicationInformation/toc:CodedProductName">
					<!-- <xsl:attribute name="classCode" namespace="" select="'MMAT'" /> 
						<xsl:attribute name="determinerCode" namespace="" select="'KIND'" /> -->
					<code>
						<xsl:if test="@nullFlavor and not(@nullFlavor = '')">
							<xsl:attribute name="nullFlavor" select="@nullFlavor" />
						</xsl:if>
						<xsl:if test="@code and not(@code = '')">
							<xsl:attribute name="code" select="@code" />
						</xsl:if>
						<xsl:if test="@codeSystem and not(@codeSystem = '')">
							<xsl:attribute name="codeSystem" select="@codeSystem" />
						</xsl:if>
						<xsl:if test="@codeSystemName and not(@codeSystemName = '')">
							<xsl:attribute name="codeSystemName" select="@codeSystemName" />
						</xsl:if>
						<xsl:if test="@displayName and not(@displayName = '')">
							<xsl:attribute name="displayName" select="@displayName" />
						</xsl:if>

						<xsl:if test="$medicationInformation/toc:FreeTextProductName">
							<xsl:variable name="var_freeTextProductName"
								select="$medicationInformation/toc:FreeTextProductName" />
							<originalText>
								<xsl:choose>
									<xsl:when test="fn:starts-with($var_freeTextProductName, '#')">
										<reference>
											<xsl:attribute name="value"
												select="fn:string($var_freeTextProductName)" />
										</reference>
									</xsl:when>
									<xsl:otherwise>
										<xsl:sequence select="fn:string($var_freeTextProductName)" />
									</xsl:otherwise>
								</xsl:choose>
							</originalText>
						</xsl:if>

						<xsl:for-each select="toc:qualifier">
							<xsl:call-template name="qualifier">
								<xsl:with-param name="qualifier" select="." as="node()" />
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="$medicationInformation/toc:CodedBrandName">
							<translation>
								<xsl:if test="@nullFlavor and not(@nullFlavor = '')">
									<xsl:attribute name="nullFlavor" select="@nullFlavor" />
								</xsl:if>
								<xsl:if test="@code and not(@code = '')">
									<xsl:attribute name="code" select="@code" />
								</xsl:if>
								<xsl:if test="@codeSystem and not(@codeSystem = '')">
									<xsl:attribute name="codeSystem" select="@codeSystem" />
								</xsl:if>
								<xsl:if test="@codeSystemName and not(@codeSystemName = '')">
									<xsl:attribute name="codeSystemName" select="@codeSystemName" />
								</xsl:if>
								<xsl:if test="@displayName and not(@displayName = '')">
									<xsl:attribute name="displayName" select="@displayName" />
								</xsl:if>
								<xsl:for-each select="$medicationInformation/toc:FreeTextBrandName">
									<originalText>
										<xsl:sequence select="fn:string(.)" />
									</originalText>
								</xsl:for-each>
								<xsl:for-each select="toc:qualifier">
									<xsl:call-template name="qualifier">
										<xsl:with-param name="qualifier" select="."
											as="node()" />
									</xsl:call-template>
								</xsl:for-each>
							</translation>
						</xsl:for-each>
					</code>
					<!-- <name><xsl:value-of select="$medicationInformation/toc:FreeTextBrandName"/></name> -->
				</xsl:for-each>
				<!-- <lotNumberText><xsl:value-of select="$medicationInformation/toc:freeTextProductName"/></lotNumberText> -->
			</manufacturedMaterial>
			<xsl:for-each select="$medicationInformation/toc:DrugManufacturer">
				<manufacturerOrganization>
					<xsl:for-each select="gcda:organizationID">
						<xsl:call-template name="idII">
							<xsl:with-param name="idII" select="." as="node()" />
						</xsl:call-template>
					</xsl:for-each>
					<xsl:for-each select="gcda:organizationName">
						<xsl:call-template name="organizationName">
							<xsl:with-param name="organizationName" select="."
								as="node()" />
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
				</manufacturerOrganization>
			</xsl:for-each>
		</manufacturedProduct>
	</xsl:template>

	<!-- This maps the nonXMLBody Text for Level 1 -->
	<xsl:template name="mapNonXMLBodyText">
		<xsl:param name="text" select="()" />
		<text>
			<xsl:choose>
				<xsl:when test="not(fn:exists($text/toc:reference))">
					<xsl:for-each select="$text">
						<xsl:attribute name="representation" namespace=""
							select="@language" />
						<xsl:attribute name="compression" namespace=""
							select="@compression" />
						<xsl:attribute name="mediaType" namespace=""
							select="@mediaType" />
						<xsl:for-each select="toc:data">
							<xsl:sequence select="fn:string(.)" />
						</xsl:for-each>
					</xsl:for-each>
				</xsl:when>

				<xsl:otherwise>
					<xsl:for-each select="$text">
						<xsl:apply-templates select="node()" />
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</text>
	</xsl:template>
	<xsl:template name="身份证件号码">
		<xsl:param name="身份证件号码" />
		<xsl:param name="身份证件类别代码" />		
		<xsl:param name="elementName" />
		<xsl:element name="{$elementName}">
			<!--
				01	居民身份证
				02	居民户口簿
				03	护照
				04	军官证
				05	驾驶证
				06	港澳居民来往内地通行证
				07	台湾居民来往内地通行证
				99	其他法定有效证件
				
			-->			
			<xsl:choose>
				<xsl:when test="$身份证件类别代码">		
					<xsl:if test="$身份证件类别代码 = '01'">
						<xsl:attribute name="root" select="'居民身份证签发机构OID'" />				
					</xsl:if>			
					<xsl:if test="$身份证件类别代码 = '02'">
						<xsl:attribute name="root" select="'居民户口簿签发机构OID'" />				
					</xsl:if>		
					<xsl:if test="$身份证件类别代码 = '03'">
						<xsl:attribute name="root" select="'护照签发机构OID'" />				
					</xsl:if>						
				</xsl:when>
			</xsl:choose>
			<xsl:for-each select="$身份证件号码">
				<xsl:attribute name="extension" select="fn:string(.)" />
			</xsl:for-each>
		</xsl:element>
	</xsl:template>		
</xsl:stylesheet>