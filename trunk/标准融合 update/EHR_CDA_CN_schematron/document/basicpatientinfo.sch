<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!DOCTYPE schema [
<!ENTITY ent-section_template_Root_OID SYSTEM 'EHRtemplates/section_template_Root_OID.ent'>
<!ENTITY ent-section_template_Root_OID.1 SYSTEM 'EHRtemplates/section_template_Root_OID.1.ent'>
<!ENTITY ent-section_template_Root_OID.1.1 SYSTEM 'EHRtemplates/section_template_Root_OID.1.1.ent'>
<!ENTITY ent-section_template_Root_OID.2 SYSTEM 'EHRtemplates/section_template_Root_OID.2.ent'>
<!ENTITY ent-section_template_Root_OID.2.1 SYSTEM 'EHRtemplates/section_template_Root_OID.2.1.ent'>
<!ENTITY ent-section_template_Root_OID.3 SYSTEM 'EHRtemplates/section_template_Root_OID.3.ent'>
<!ENTITY ent-section_template_Root_OID.3.1 SYSTEM 'EHRtemplates/section_template_Root_OID.3.1.ent'>
<!ENTITY ent-section_template_Root_OID.4 SYSTEM 'EHRtemplates/section_template_Root_OID.4.ent'>
<!ENTITY ent-section_template_Root_OID.4.1 SYSTEM 'EHRtemplates/section_template_Root_OID.4.1.ent'>
<!ENTITY ent-section_template_Root_OID.5 SYSTEM 'EHRtemplates/section_template_Root_OID.5.ent'>
<!ENTITY ent-section_template_Root_OID.5.1 SYSTEM 'EHRtemplates/section_template_Root_OID.5.1.ent'>
<!ENTITY ent-section_template_Root_OID.6 SYSTEM 'EHRtemplates/section_template_Root_OID.6.ent'>
<!ENTITY ent-section_template_Root_OID.6.1 SYSTEM 'EHRtemplates/section_template_Root_OID.6.1.ent'>
<!ENTITY ent-section_template_Root_OID.7 SYSTEM 'EHRtemplates/section_template_Root_OID.7.ent'>
<!ENTITY ent-section_template_Root_OID.7.1 SYSTEM 'EHRtemplates/section_template_Root_OID.7.1.ent'>
<!ENTITY ent-section_template_Root_OID.8 SYSTEM 'EHRtemplates/section_template_Root_OID.8.ent'>
<!ENTITY ent-section_template_Root_OID.8.1 SYSTEM 'EHRtemplates/section_template_Root_OID.8.1.ent'>
<!ENTITY ent-section_template_Root_OID.9 SYSTEM 'EHRtemplates/section_template_Root_OID.9.ent'>
<!ENTITY ent-section_template_Root_OID.9.1 SYSTEM 'EHRtemplates/section_template_Root_OID.9.1.ent'>
<!ENTITY ent-section_template_Root_OID.10 SYSTEM 'EHRtemplates/section_template_Root_OID.10.ent'>
<!ENTITY ent-section_template_Root_OID.10.1 SYSTEM 'EHRtemplates/section_template_Root_OID.10.1.ent'>
]>
<schema xmlns="http://www.ascc.net/xml/schematron" xmlns:cda="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<!-- 
To use iso schematron instead of schematron 1.5, 
change the xmlns attribute from
"http://www.ascc.net/xml/schematron" 
to 
"http://purl.oclc.org/dsdl/schematron"
-->

<title>Schematron schema for validating conformance to CCD documents</title>
<ns prefix="cda" uri="urn:hl7-org:v3"/>
<ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

<phase id='errors'>
	<active pattern='p-section_template_Root_OID-errors'/>	
	<active pattern='p-section_template_Root_OID.1-errors'/>	
	<active pattern='p-section_template_Root_OID.1.1-errors'/>	
	<active pattern='p-section_template_Root_OID.2-errors'/>		
</phase>

<phase id='warning'>

</phase>

<phase id='manual'>
	
</phase>




<!-- 个人基本信息数据集: Section_template_Root_OID -->
&ent-section_template_Root_OID;
<!--  血型章节 NAR section: Section_template_Root_OID.1 -->
&ent-section_template_Root_OID.1;
<!--  血型章节NOM section: Section_template_Root_OID.1.1 -->
&ent-section_template_Root_OID.1.1;
<!--  社会史章节NAR section: Section_template_Root_OID.2 -->
&ent-section_template_Root_OID.2;
<!--  社会史章节NOM section: Section_template_Root_OID.2.1 -->
&ent-section_template_Root_OID.2.1;
<!--  财务与卫生费用章节NAR section: Section_template_Root_OID.3 -->
&ent-section_template_Root_OID.3;
<!--  财务与卫生费用章节NOM section: Section_template_Root_OID.3.1 -->
&ent-section_template_Root_OID.3.1;
&ent-section_template_Root_OID.4;
&ent-section_template_Root_OID.4.1;
&ent-section_template_Root_OID.5;
&ent-section_template_Root_OID.5.1;
&ent-section_template_Root_OID.6;
&ent-section_template_Root_OID.6.1;
&ent-section_template_Root_OID.7;
&ent-section_template_Root_OID.7.1;
&ent-section_template_Root_OID.8;
&ent-section_template_Root_OID.8.1;
&ent-section_template_Root_OID.9;
&ent-section_template_Root_OID.9.1;
&ent-section_template_Root_OID.10;
&ent-section_template_Root_OID.10.1;
</schema>
