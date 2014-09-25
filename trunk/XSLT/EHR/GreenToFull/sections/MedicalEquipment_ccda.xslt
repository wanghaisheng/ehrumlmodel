<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
    
    <xsl:template name="medicalEquipmentCCDA">
        <xsl:param name="medicalEquipment" />
		<xsl:param name="mnemonic" />
		<xsl:for-each select="$medicalEquipment">
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.22.2.23"/>
					<code code="46264-8" codeSystem="2.16.840.1.113883.6.1" displayName="Medical Equipment" codeSystemName="LOINC"/>
					<title>Medical Equipment</title>	                   
	                <text><xsl:apply-templates select="$medicalEquipment/toc:Text/node()"/></text>
	                <xsl:for-each select="toc:EquipmentDetails/toc:EquipmentItem">
	                <!--   <entry typeCode="DRIV"> -->
	                 <entry>
						<supply classCode="SPLY" moodCode="{toc:ItemType/text()}">
						  <templateId root="2.16.840.1.113883.10.20.22.4.50"/>
						  <xsl:for-each select="toc:ItemID">
						    <xsl:call-template name="idII">
							  <xsl:with-param name="idII" select="."/>
							</xsl:call-template>
						  </xsl:for-each>
						  <xsl:for-each select="toc:ItemStatus">
							<xsl:call-template name="codeCD">
							  <xsl:with-param name="elementName" select="'statusCode'"/>
							  <xsl:with-param name="code" select="." />
					        </xsl:call-template>
						  </xsl:for-each>
						  <xsl:for-each select="toc:ItemDateTime">
						    <effectiveTime xsi:type="IVL_TS">
						      <center value="{./@value}"/>
						    </effectiveTime>
						  </xsl:for-each>
						  <xsl:for-each select="toc:ItemQuantity">
						    <xsl:call-template name="qtyPQ">
						      <xsl:with-param name="elementName" select="'quantity'"/>
						      <xsl:with-param name="qtyPQ" select="."/>
						    </xsl:call-template>
						  </xsl:for-each>
						  <participant typeCode="PRD">
							  <participantRole classCode="MANU">
							      <templateId root="2.16.840.1.113883.10.20.22.4.37"/>
							      <xsl:for-each select="toc:ItemProductID">
						            <xsl:call-template name="idII">
							          <xsl:with-param name="idII" select="."/>
							        </xsl:call-template>
						          </xsl:for-each>
							      <xsl:for-each select="toc:ItemProductCode">
								      <playingDevice>
								        <xsl:call-template name="codeCD">
								          <xsl:with-param name="elementName" select="'code'"/>
								          <xsl:with-param name="code" select="." />
								        </xsl:call-template>
								      </playingDevice>
							      </xsl:for-each>
							      <xsl:for-each select="toc:ItemScopingEntityID">
							        <scopingEntity>
							          <xsl:call-template name="idII">
							            <xsl:with-param name="idII" select="."/>
							          </xsl:call-template>
							        </scopingEntity>
							      </xsl:for-each>
							  </participantRole>
						  </participant>
						</supply>
					</entry>
	                </xsl:for-each>
				</section>
			</component>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>