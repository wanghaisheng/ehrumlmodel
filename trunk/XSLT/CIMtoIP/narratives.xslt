<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../common/functions.xslt"/>
    <xsl:template name="conditionsNarrative">
        <xsl:param name="conditions" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Condition'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Effective Date'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$conditions/toc:condition">
                        <xsl:variable name="condIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr id="cond_{$condIDnum}">
                            <xsl:for-each select="toc:problemName">
                                <td>
                                    <xsl:for-each select="node()[./self::text()]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:problemDate/gcda:low/@value">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="insuranceProvidersNarrative">
        <xsl:param name="insuranceProviders" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Provider Name'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Coverage Type'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$insuranceProviders/toc:insuranceProvider">
                        <xsl:variable name="insIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr id="ins_{$insIDnum}">
                            <xsl:for-each select="toc:payer/toc:organizationName">
                                <td>
                                    <xsl:for-each select="node()[./self::text()]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:healthInsuranceType/@displayName">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="proceduresNarrative">
        <xsl:param name="procedures" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Procedure'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Date'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$procedures/toc:procedure">
                        <xsl:variable name="procIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr id="proc_{$procIDnum}">
                            <xsl:for-each select="toc:procedureFreeTextType">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:procedureDateTime/@value">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="advanceDirectivesNarrative">
        <xsl:param name="advanceDirectives" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Directive'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Description'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$advanceDirectives/toc:advanceDirective">
                        <xsl:variable name="advdIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr id="advd_{$advdIDnum}">
                            <xsl:for-each select="toc:type/@displayName">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:value/@displayName">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="vitalSignsNarrative">
        <xsl:param name="vitalSigns" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Date'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Test'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Result'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$vitalSigns/toc:vitalSign">
                        <xsl:variable name="vitalIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr id="vital_{$vitalIDnum}">
                            <xsl:for-each select="toc:resultDateTime/@value">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:resultType/@displayName">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:resultValue/toc:physicalQuantity">
                                <xsl:variable name="var2" as="node()" select="."/>
                                <xsl:for-each select="@value">
                                    <xsl:variable name="var1" as="node()" select="."/>
                                    <xsl:for-each select="$var2/@unit">
                                        <td>
                                            <xsl:sequence select="fn:concat(fn:concat(fn:string($var1), ' '), fn:string(.))"/>
                                        </td>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="allergiesNarrative">
        <xsl:param name="allergies" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Substance'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Reaction'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$allergies/toc:allergy">
                        <xsl:variable name="allgIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr>
                            <xsl:for-each select="toc:product/@displayName">
                                <td id="allp_{$allgIDnum}">
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:reaction/@displayName">
                                <td id="allr_{$allgIDnum}">
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="immunizationsNarrative">
        <xsl:param name="immunizations" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Vaccine'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Date'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$immunizations/toc:immunization">
                        <xsl:variable name="immIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr id="imm_{$immIDnum}">
                            <xsl:for-each select="toc:medicationInformation/toc:freeTextProductName">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:administeredDate/@value">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="planOfCareNarrative">
        <xsl:param name="planOfCare" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Planned Activity'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Date'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$planOfCare/toc:plannedObservation">
                        <tr>
                            <xsl:for-each select="toc:planFreeText">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:plannedTime/@value">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="medicationsNarrative">
        <xsl:param name="medications" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Product'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Dose'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Form'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Period'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$medications/toc:medication">
                        <xsl:variable name="medIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr id="med_{$medIDnum}">
                            <xsl:for-each select="toc:medicationInformation/toc:freeTextProductName">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:dose">
                                <td>
                                    <xsl:sequence select="()"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:productForm">
                                <td>
                                    <xsl:sequence select="()"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:admissionTiming/gcda:period">
                                <xsl:variable name="var2" as="node()" select="."/>
                                <xsl:for-each select="@value">
                                    <xsl:variable name="var1" as="node()" select="."/>
                                    <xsl:for-each select="$var2/@unit">
                                        <td>
                                            <xsl:sequence select="fn:concat(fn:concat(fn:string($var1), ' '), fn:string(.))"/>
                                        </td>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="encountersNarrative">
        <xsl:param name="encounters" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Type'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Date'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$encounters/toc:encounter">
                        <xsl:variable name="encIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr id="enc_{$encIDnum}">
                            <xsl:for-each select="toc:encounterType/gcda:originalText">
                                <td>
                                    <xsl:for-each select="node()[./self::text()]">
                                        <xsl:sequence select="fn:string(.)"/>
                                    </xsl:for-each>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:encounterDateTime/@value">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
    <xsl:template name="resultsNarrative">
        <xsl:param name="results" select="()"/>
        <text xmlns="urn:hl7-org:v3">
            <table>
                <xsl:attribute name="width" namespace="" select="'100%'"/>
                <xsl:attribute name="border" namespace="" select="'1'"/>
                <thead>
                    <tr>
                        <th>
                            <xsl:sequence select="'Date'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Test'"/>
                        </th>
                        <th>
                            <xsl:sequence select="'Result'"/>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$results/toc:result">
                        <xsl:variable name="var4" as="node()" select="."/>
                        <xsl:variable name="resIDnum">
                            <xsl:number level="any"/>
                        </xsl:variable>
                        <tr id="res_{$resIDnum}">
                            <xsl:for-each select="toc:resultDateTime/@value">
                                <td>
                                    <xsl:sequence select="fn:string(.)"/>
                                </td>
                            </xsl:for-each>
                            <xsl:for-each select="toc:resultType/@displayName">
                                <xsl:variable name="var1" as="node()" select="."/>
                                <xsl:for-each select="$var4/toc:resultReferenceRange">
                                    <td>
                                        <xsl:sequence select="fn:concat(fn:concat(fn:concat(fn:string($var1), ' ('), fn:string(.)), ')')"/>
                                    </td>
                                </xsl:for-each>
                            </xsl:for-each>
                            <xsl:for-each select="toc:resultValue/toc:physicalQuantity">
                                <xsl:variable name="var3" as="node()" select="."/>
                                <xsl:for-each select="@value">
                                    <xsl:variable name="var2" as="node()" select="."/>
                                    <xsl:for-each select="$var3/@unit">
                                        <td>
                                            <xsl:sequence select="fn:concat(fn:concat(fn:string($var2), ' '), fn:string(.))"/>
                                        </td>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </text>
    </xsl:template>
</xsl:stylesheet>