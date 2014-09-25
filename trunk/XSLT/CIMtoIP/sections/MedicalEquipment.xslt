<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

   <xsl:import href="../maps.xslt"/>
 	<xsl:template name="medicalEquipment">
        <xsl:param name="medicalEquipment"/>         
	 		 <xsl:for-each select="toc:ToCSummary/toc:Body/toc:MedicalEquipment">
				<component>
				<section>				
					<templateId root="2.16.840.1.113883.3.88.11.83.128"/>
					<templateId root="2.16.840.1.113883.10.20.1.7"/>
					<templateId root="1.3.6.1.4.1.19376.1.5.3.1.1.5.3.5"/>
					<code code="46264-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="History of medical device use"/>
					<title>equipment</title>
					
					<xsl:if test="fn:exists(toc:Text)">	
	                    <text>
	                        <xsl:apply-templates select="toc:Text/node()" />
	                    </text>
	                    <!--Currently we are reading from the section level only -->
	                      <!-- <xsl:for-each select="toc:EquipmentDetails/toc:Text">
                            <xsl:for-each select="node()[./self::text()]">
                                <xsl:sequence select="fn:string(.)"/>
                            </xsl:for-each>
                        </xsl:for-each> -->
                    </xsl:if>
                    
				</section>
			</component>
		</xsl:for-each>	        
    </xsl:template>    
</xsl:stylesheet>
