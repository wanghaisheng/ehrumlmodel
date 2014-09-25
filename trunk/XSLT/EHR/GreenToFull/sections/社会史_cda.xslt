<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:toc="http://www.sipilotdevelopment.org/tocri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gcda="urn:hl7-org:gcda"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns="urn:hl7-org:v3" exclude-result-prefixes="xs fn gcda toc">

    <xsl:import href="../maps_ccda.xslt"/>
	<xsl:variable name='voc' select="document('../voc.xml')"/>
    
	<xsl:template name="社会史_CDA">
		<xsl:param name="社会史_居民基础信息" />
		<xsl:for-each select="$社会史_居民基础信息" >
			<component>
				<section>
					<templateId root="Section_template_Root_OID.2"/>
					<code>
						<xsl:attribute name="code" namespace="" select="'29762-2'"/>
						<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
						 <xsl:attribute name="displayName" namespace="" select="'社会史'"/>
						<xsl:attribute name="codeSystemName" namespace="" select="'LOINC'"/>
					</code>
					<title>
						<xsl:sequence select="'社会史'"/>
					</title>
					<text>
						<list>
							<item>常住地址户籍标志:<xsl:value-of select="$社会史_居民基础信息/居民社会经济学信息/常住地址户籍标志"/>
							</item>
							<item>工作单位名称:<xsl:value-of select="$社会史_居民基础信息/居民社会经济学信息/工作单位名称"/>
							</item>
							<item>学历代码:<xsl:value-of select="$社会史_居民基础信息/居民人口学信息/学历代码"/>
							</item>
							<item>职业类别代码:<xsl:value-of select="$社会史_居民基础信息/居民社会经济学信息/职业类别代码"/>
							</item>
							<item>家庭厨房排风设施标识:<xsl:value-of select="$社会史_居民基础信息/家庭基本设施情况/家庭厨房排风设施标识"/>
							</item>	
							<item>家庭厨房排风设施类别代码:<xsl:value-of select="$社会史_居民基础信息/家庭基本设施情况/家庭厨房排风设施类别代码"/>
							</item>		
							<item>家庭燃料类型类别代码:<xsl:value-of select="$社会史_居民基础信息/家庭基本设施情况/家庭燃料类型类别代码"/>
							</item>		
							<item>家庭饮水类别代码:<xsl:value-of select="$社会史_居民基础信息/家庭基本设施情况/家庭饮水类别代码"/>
							</item>		
							<item>家庭厕所类别代码:<xsl:value-of select="$社会史_居民基础信息/家庭基本设施情况/家庭厕所类别代码"/>
							</item>		
							<item>家庭禽畜栏类别:<xsl:value-of select="$社会史_居民基础信息/家庭基本设施情况/家庭禽畜栏类别"/>
							</item>									
						</list> 
					</text>
					<xsl:for-each select="$社会史_居民基础信息/居民社会经济学信息/常住地址户籍标志">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.011'" />
									<xsl:attribute name="displayName" select="'常住地址户籍标志'" />    							
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'BL'" />
									<xsl:attribute name="value" select="$社会史_居民基础信息/居民社会经济学信息/常住地址户籍标志" />			
								</value>
							</observation>
						</entry>
					</xsl:for-each>		
					<xsl:for-each select="$社会史_居民基础信息/居民社会经济学信息/工作单位名称">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.007'" />
									<xsl:attribute name="displayName" select="'工作单位名称'" />    							
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'ED'" />
									<xsl:attribute name="value" select="$社会史_居民基础信息/居民社会经济学信息/工作单位名称" />													
								</value>
							</observation>
						</entry>
					</xsl:for-each>		
					<xsl:for-each select="$社会史_居民基础信息/居民人口学信息/学历代码">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.015'" />
									<xsl:attribute name="displayName" select="'学历代码'" />    							
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'CD'" />
									<xsl:attribute name="code" select="$社会史_居民基础信息/居民人口学信息/学历代码" />
									<xsl:attribute name="codeSystem" select="'GB/T 4658-2006 学历代码'" />
									<xsl:attribute name="codeSystemName" select="'学历代码'" />	
									<xsl:variable name='education_code'	select="$社会史_居民基础信息/居民人口学信息/学历代码"/>			
									<!--能找到education_code-->									
									<xsl:variable name='mappededucation_codesystem'  select="$voc//systems/system[@codeSystemName='GB/T 4658-2006学历代码']"/>	
									<!--能找到mappededucation_codesystem-->											
									<xsl:variable name='mappededucation_code_value'  select="$voc//systems/system[@codeSystemName='GB/T 4658-2006学历代码']/code[@value=$education_code]"/>	
									<!--找不到mappededucation_code-->		
									<xsl:variable name='displayName_value'  select="$mappededucation_code_value[@displayName]"/>	
									<xsl:choose>
										<xsl:when test='$mappededucation_code_value'>
											<xsl:attribute name="displayName" select="$displayName_value" />
										</xsl:when>				
									</xsl:choose>													
								</value>
							</observation>
						</entry>		
					</xsl:for-each>				
					<xsl:for-each select="$社会史_居民基础信息/居民社会经济学信息/职业类别代码">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.016'" />
									<xsl:attribute name="displayName" select="'职业类别代码'" />    							
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'CD'" />
									<xsl:attribute name="code" select="$社会史_居民基础信息/居民社会经济学信息/职业类别代码" />
									<xsl:attribute name="codeSystem" select="'GB/T 6565-2009 职业分类与代码'" />
									<xsl:attribute name="codeSystemName" select="'职业类别代码'" />	
									<xsl:variable name='occupation_code'	select="$社会史_居民基础信息/居民社会经济学信息/职业类别代码"/>			
									<!--能找到education_code-->									
									<xsl:variable name='occupation_code_codesystem'  select="$voc//systems/system[@codeSystemName='GB/T 6565-2009 职业分类与代码']"/>	
									<!--能找到mappededucation_codesystem-->											
									<xsl:variable name='occupation_code_value'  select="$occupation_code_codesystem/code[@value=$occupation_code]"/>	
									<!--找不到mappededucation_code-->		
									<xsl:variable name='displayName_value'  select="$occupation_code_value[@displayName]"/>	
									<xsl:choose>
										<xsl:when test='$occupation_code_value'>
											<xsl:attribute name="displayName" select="$occupation_code_value" />
										</xsl:when>				
									</xsl:choose>													
								</value>
							</observation>
						</entry>		
					</xsl:for-each>		
					<xsl:for-each select="$社会史_居民基础信息/家庭基本设施情况/家庭厨房排风设施标识">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.037'" />
									<xsl:attribute name="displayName" select="'家庭厨房排风设施标识'" />    							
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'BL'" />
									<xsl:attribute name="value" select="$社会史_居民基础信息/家庭基本设施情况/家庭厨房排风设施标识" />			
								</value>
							</observation>
						</entry>
					</xsl:for-each>								
					<xsl:for-each select="$社会史_居民基础信息/家庭基本设施情况/家庭厨房排风设施类别代码">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.038'" />
									<xsl:attribute name="displayName" select="'家庭厨房排风设施类别代码'" />    							
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'CD'" />
									<xsl:attribute name="code" select="$社会史_居民基础信息/家庭基本设施情况/家庭厨房排风设施类别代码" />
									<xsl:attribute name="codeSystem" select="'CV03.00.302'" />
									<xsl:attribute name="codeSystemName" select="'健康危险因素 厨房排风设施类别代码表'" />	
									<xsl:variable name='kitchen_code'	select="$社会史_居民基础信息/家庭基本设施情况/家庭厨房排风设施类别代码"/>			
									<!--能找到education_code-->									
									<xsl:variable name='kitchen_code_codesystem'  select="$voc//systems/system[@codeSystemName='厨房排风设施类别代码表']"/>	
									<!--能找到mappededucation_codesystem-->											
									<xsl:variable name='kitchen_code_value'  select="$kitchen_code_codesystem/code[@value=$kitchen_code]"/>	
									<!--找不到mappededucation_code-->		
									<xsl:variable name='displayName_value'  select="$kitchen_code_value[@displayName]"/>	
									<xsl:choose>
										<xsl:when test='$kitchen_code_value'>
											<xsl:attribute name="displayName" select="$kitchen_code_value" />
										</xsl:when>				
									</xsl:choose>													
								</value>
							</observation>
						</entry>		
					</xsl:for-each>				
					<xsl:for-each select="$社会史_居民基础信息/家庭基本设施情况/家庭燃料类型类别代码">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.039'" />
									<xsl:attribute name="displayName" select="'家庭燃料类型类别代码'" />    							
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'CD'" />
									<xsl:attribute name="code" select="$社会史_居民基础信息/家庭基本设施情况/家庭燃料类型类别代码" />
									<xsl:attribute name="codeSystem" select="'CV03.00.303'" />
									<xsl:attribute name="codeSystemName" select="'健康危险因素 燃料类型类别代码表'" />	
									<xsl:variable name='fuel_code'	select="$社会史_居民基础信息/家庭基本设施情况/家庭燃料类型类别代码"/>			
									<!--能找到education_code-->									
									<xsl:variable name='fuel_code_codesystem'  select="$voc//systems/system[@codeSystemName='燃料类型类别代码表']"/>	
									<!--能找到mappededucation_codesystem-->											
									<xsl:variable name='fuel_code_value'  select="$fuel_code_codesystem/code[@value=$fuel_code]"/>	
									<!--找不到mappededucation_code-->		
									<xsl:variable name='displayName_value'  select="$fuel_code_value[@displayName]"/>	
									<xsl:choose>
										<xsl:when test='$fuel_code_value'>
											<xsl:attribute name="displayName" select="$fuel_code_value" />
										</xsl:when>				
									</xsl:choose>													
								</value>
							</observation>
						</entry>		
					</xsl:for-each>																	
					<xsl:for-each select="$社会史_居民基础信息/家庭基本设施情况/家庭饮水类别代码">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.040'" />
									<xsl:attribute name="displayName" select="'家庭饮水类别代码'" />    							
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'CD'" />
									<xsl:attribute name="code" select="$社会史_居民基础信息/家庭基本设施情况/家庭饮水类别代码" />
									<xsl:attribute name="codeSystem" select="'CV03.00.115'" />
									<xsl:attribute name="codeSystemName" select="'健康危险因素 饮水类别代码表'" />	
									<xsl:variable name='drinking_code'	select="$社会史_居民基础信息/家庭基本设施情况/家庭饮水类别代码"/>			
									<!--能找到education_code-->									
									<xsl:variable name='drinking_code_codesystem'  select="$voc//systems/system[@codeSystemName='饮水类别代码表']"/>	
									<!--能找到mappededucation_codesystem-->											
									<xsl:variable name='drinking_code_value'  select="$drinking_code_codesystem/code[@value=$drinking_code]"/>	
									<!--找不到mappededucation_code-->		
									<xsl:variable name='displayName_value'  select="$drinking_code_value[@displayName]"/>	
									<xsl:choose>
										<xsl:when test='$drinking_code_value'>
											<xsl:attribute name="displayName" select="$drinking_code_value" />
										</xsl:when>				
									</xsl:choose>													
								</value>
							</observation>
						</entry>		
					</xsl:for-each>	
				<xsl:for-each select="$社会史_居民基础信息/家庭基本设施情况/家庭厕所类别代码">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.041'" />
									<xsl:attribute name="displayName" select="'家庭厕所类别代码'" />    							
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />   							
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'CD'" />
									<xsl:attribute name="code" select="$社会史_居民基础信息/家庭基本设施情况/家庭厕所类别代码" />
									<xsl:attribute name="codeSystem" select="'CV03.00.115'" />
									<xsl:attribute name="codeSystemName" select="'健康危险因素 厕所类别代码表'" />	
									<xsl:variable name='toilet_code'	select="$社会史_居民基础信息/家庭基本设施情况/家庭厕所类别代码"/>			
									<!--能找到education_code-->									
									<xsl:variable name='toilet_code_codesystem'  select="$voc//systems/system[@codeSystemName='厕所类别代码表']"/>	
									<!--能找到mappededucation_codesystem-->											
									<xsl:variable name='toilet_code_value'  select="$toilet_code_codesystem/code[@value=$toilet_code]"/>	
									<!--找不到mappededucation_code-->		
									<xsl:variable name='displayName_value'  select="$toilet_code_value[@displayName]"/>	
									<xsl:choose>
										<xsl:when test='$toilet_code_value'>
											<xsl:attribute name="displayName" select="$toilet_code_value" />
										</xsl:when>				
									</xsl:choose>													
								</value>
							</observation>
						</entry>		
					</xsl:for-each>		
				<xsl:for-each select="$社会史_居民基础信息/家庭基本设施情况/家庭禽畜栏类别">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<templateId root="Entry_template_Root_OID.2" />
								<code>
									<xsl:attribute name="code" select="'HDSD00.01.042'" />
									<xsl:attribute name="displayName" select="'家庭禽畜栏类别'" />    					
									<xsl:attribute name="codeSystemName" select="'城乡居民健康档案基本数据集'" />				
									<xsl:attribute name="codeSystem" select="'EHRDATASET_OID'" /> 
								</code>
								<statusCode code="completed" />
								<value>
									<xsl:attribute name="xsi:type"
										namespace="http://www.w3.org/2001/XMLSchema-instance" select="'CD'" />
									<xsl:attribute name="code" select="$社会史_居民基础信息/家庭基本设施情况/家庭禽畜栏类别" />
									<xsl:attribute name="codeSystem" select="'xxxxxx'" />
									<xsl:attribute name="codeSystemName" select="'禽畜养殖场所的类别代码'" />	
									<xsl:variable name='animals_code'	select="$社会史_居民基础信息/家庭基本设施情况/家庭禽畜栏类别"/>			
									<!--能找到education_code-->									
									<xsl:variable name='animals_code_codesystem'  select="$voc//systems/system[@codeSystemName='禽畜养殖场所的类别代码']"/>	
									<!--能找到mappededucation_codesystem-->											
									<xsl:variable name='animals_code_value'  select="$animals_code_codesystem/code[@value=$animals_code]"/>	
									<!--找不到mappededucation_code-->		
									<xsl:variable name='displayName_value'  select="$animals_code_value[@displayName]"/>	
									<xsl:choose>
										<xsl:when test='$animals_code_value'>
											<xsl:attribute name="displayName" select="$animals_code_value" />
										</xsl:when>				
									</xsl:choose>												
								</value>
							</observation>
						</entry>		
					</xsl:for-each>											
				</section>
			</component>
		</xsl:for-each>					
	</xsl:template>
</xsl:stylesheet>