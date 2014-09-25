<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!DOCTYPE schema [
<!ENTITY ent-section_template_Root_OID SYSTEM 'section_template_Root_OID.ent'>
]>
<schema xmlns="http://www.ascc.net/xml/schematron" xmlns:cda="urn:hl7-org:v3">
<!-- 
To use iso schematron instead of schematron 1.5, 
change the xmlns attribute from
"http://www.ascc.net/xml/schematron" 
to 
"http://purl.oclc.org/dsdl/schematron"
-->

<title>个人基本信息数据集 v1.0 Templates Root</title>
<ns prefix="cda" uri="urn:hl7-org:v3"/>

<phase id='errors'>
	<active pattern='p-section_template_Root_OID-errors'/>
</phase>

<phase id='warning'>
	<active pattern='p-section_template_Root_OID-warning'/>
</phase>

<phase id='manual'>
	<active pattern='p-section_template_Root_OID-manual'/>
</phase>




&ent-section_template_Root_OID;
  
</schema>
