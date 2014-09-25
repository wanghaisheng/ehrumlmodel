<xsl:stylesheet version="2.0"
	xmlns="http://www.sipilotdevelopment.org/tocri"
	xmlns:cda="urn:hl7-org:v3"
	xmlns:gcda="urn:hl7-org:gcda"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" 
	exclude-result-prefixes="xs fn"
	xsi:schemaLocation="http://www.sipilotdevelopment.org/tocri toc-cim.xsd">

    <xsl:import href="../templates.xslt"/>    
       
    <xsl:template name="medicalEquipmentCCDA">
        <xsl:param name="medicalEquipmentSection"/>
        <xsl:param name="srcMnemonic"/>
			<MedicalEquipment>				
	           <Text> 
					<xsl:apply-templates select="$medicalEquipmentSection/cda:text/node()"/>
	           </Text> 
			<xsl:if test="$medicalEquipmentSection/cda:entry">
			  <EquipmentDetails>
			  <xsl:for-each select="$medicalEquipmentSection/cda:entry/cda:supply">
			    <EquipmentItem>
			      <xsl:for-each select="cda:id">
			        <xsl:call-template name="idII">
			          <xsl:with-param name="elementName" select="'ItemID'"/>
			          <xsl:with-param name="idII" select="."/>
			        </xsl:call-template> 
			      </xsl:for-each>
			      <ItemType><xsl:value-of select="./@moodCode"/></ItemType>
			      <xsl:for-each select="cda:statusCode">
			        <xsl:call-template name="codeCD">
			          <xsl:with-param name="elementName" select="'ItemStatus'"/>
			          <xsl:with-param name="code" select="."/>
			        </xsl:call-template>
			      </xsl:for-each>
			      <xsl:for-each select="cda:effectiveTime/cda:center">
			        <ItemDateTime value="{./@value}"/>
			      </xsl:for-each>
			      <xsl:for-each select="cda:quantity">
			        <xsl:call-template name="qtyPQ">
			          <xsl:with-param name="elementName" select="'ItemQuantity'"/>
			          <xsl:with-param name="qtyPQ" select="."/>
			        </xsl:call-template>
			      </xsl:for-each>
			      <xsl:for-each select="cda:participant/cda:participantRole/cda:id">
			        <xsl:call-template name="idII">
			          <xsl:with-param name="elementName" select="'ItemProductID'"/>
			          <xsl:with-param name="idII" select="."/>
			        </xsl:call-template> 
			      </xsl:for-each>
			      <xsl:for-each select="cda:participant/cda:participantRole/cda:playingDevice/cda:code">
			        <xsl:call-template name="codeCD">
			          <xsl:with-param name="elementName" select="'ItemProductCode'"/>
			          <xsl:with-param name="code" select="."/>
			        </xsl:call-template>
			      </xsl:for-each>
			      <xsl:for-each select="cda:participant/cda:participantRole/cda:scopingEntity/cda:id">
			        <xsl:call-template name="idII">
			          <xsl:with-param name="elementName" select="'ItemScopingEntityID'"/>
			          <xsl:with-param name="idII" select="."/>
			        </xsl:call-template> 
			      </xsl:for-each>
			    </EquipmentItem>
			  </xsl:for-each>
			  </EquipmentDetails>
			</xsl:if>
		</MedicalEquipment>
    </xsl:template>        
</xsl:stylesheet>