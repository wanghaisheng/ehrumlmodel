<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cda="urn:hl7-org:v3"
    xmlns:gcda="urn:hl7-org:gcda" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:template name="tbf1_TS">
        <xsl:param name="input" select="()" />
        <xsl:for-each select="$input/@nullFlavor">
            <xsl:attribute name="nullFlavor" select="fn:string(.)" />
        </xsl:for-each>
        <xsl:for-each select="$input/@value">
            <xsl:attribute name="value" select="fn:string(.)" />
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="tbf2_INT">
        <xsl:param name="input" select="()" />
        <xsl:for-each select="$input/@nullFlavor">
            <xsl:attribute name="nullFlavor" select="fn:string(.)" />
        </xsl:for-each>
        <xsl:for-each select="$input/@value">
            <xsl:attribute name="value" select="fn:string(.)" />
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="tbf3_MO">
        <xsl:param name="input" select="()" />
        <xsl:for-each select="$input/@nullFlavor">
            <xsl:attribute name="nullFlavor" select="fn:string(.)" />
        </xsl:for-each>
        <xsl:for-each select="$input/@value">
            <xsl:attribute name="value" select="fn:string(.)" />
        </xsl:for-each>
        <xsl:for-each select="$input/@currency">
            <xsl:attribute name="currency" select="fn:string(.)" />
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>