/**
 * <copyright>
 * </copyright>
 *
 * $Id$
 */
package org.openhealthtools.mdht.uml.cda.ehr;

import java.util.Map;
import org.eclipse.emf.common.util.DiagnosticChain;
import org.openhealthtools.mdht.uml.cda.Observation;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Ѫ�͹۲���Ŀ</b></em>'.
 * <!-- end-user-doc -->
 *
 *
 * @see org.openhealthtools.mdht.uml.cda.ehr.EhrPackage#getѪ�͹۲���Ŀ()
 * @model annotation="http://www.openhealthtools.org/mdht/uml/cda/annotation statusCode.code='completed' value.codeSystemName='\u536b\u751f\u90e8\u536b\u751f\u4fe1\u606f\u6570\u636e\u5143\u503c\u57df\u4ee3\u7801' code.codeSystem='EHRDATASET_OID' templateId.root='Entry_template_Root_OID.1' constraints.validation.error='\u8840\u578b\u89c2\u5bdf\u6761\u76eeTemplateId \u8840\u578b\u89c2\u5bdf\u6761\u76eeClassCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeMoodCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeValue' code.codeSystemName='\u57ce\u4e61\u5c45\u6c11\u5065\u5eb7\u6863\u6848\u57fa\u672c\u6570\u636e\u96c6' classCode='OBS' constraints.validation.warning='\u8840\u578b\u89c2\u5bdf\u6761\u76eeText' moodCode='EVN' value.codeSystem='EHRVALUESET_OID'"
 * @generated
 */
public interface Ѫ�͹۲���Ŀ extends Observation
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.templateId->exists(id : datatypes::II | id.root = 'Entry_template_Root_OID.1')
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @model annotation="http://www.eclipse.org/uml2/1.1.0/GenModel body='self.templateId->exists(id : datatypes::II | id.root = \'Entry_template_Root_OID.1\')'"
   * @generated
   */
  boolean validateѪ�͹۲���ĿTemplateId(DiagnosticChain diagnostics, Map<Object, Object> context);

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.classCode=vocab::ActClassObservation::OBS
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @model annotation="http://www.eclipse.org/uml2/1.1.0/GenModel body='self.classCode=vocab::ActClassObservation::OBS'"
   * @generated
   */
  boolean validateѪ�͹۲���ĿClassCode(DiagnosticChain diagnostics, Map<Object, Object> context);

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CD) and 
   * let value : datatypes::CD = self.code.oclAsType(datatypes::CD) in (
   * value.codeSystem = 'EHRDATASET_OID'))
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @model annotation="http://www.eclipse.org/uml2/1.1.0/GenModel body='(self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CD) and \r\nlet value : datatypes::CD = self.code.oclAsType(datatypes::CD) in (\r\nvalue.codeSystem = \'EHRDATASET_OID\'))'"
   * @generated
   */
  boolean validateѪ�͹۲���ĿCode(DiagnosticChain diagnostics, Map<Object, Object> context);

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.moodCode=vocab::x_ActMoodDocumentObservation::EVN
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @model annotation="http://www.eclipse.org/uml2/1.1.0/GenModel body='self.moodCode=vocab::x_ActMoodDocumentObservation::EVN'"
   * @generated
   */
  boolean validateѪ�͹۲���ĿMoodCode(DiagnosticChain diagnostics, Map<Object, Object> context);

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (not self.text.oclIsUndefined())
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @model annotation="http://www.eclipse.org/uml2/1.1.0/GenModel body='(self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (not self.text.oclIsUndefined())'"
   * @generated
   */
  boolean validateѪ�͹۲���ĿText(DiagnosticChain diagnostics, Map<Object, Object> context);

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.value->isEmpty() or self.value->exists(element | element.isNullFlavorUndefined())) implies (self.value->size() = 1 and self.value->forAll(element | not element.oclIsUndefined() and element.oclIsKindOf(datatypes::CE) and 
   * let value : datatypes::CE = element.oclAsType(datatypes::CE) in 
   * value.codeSystem = 'EHRVALUESET_OID'))
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @model annotation="http://www.eclipse.org/uml2/1.1.0/GenModel body='(self.value->isEmpty() or self.value->exists(element | element.isNullFlavorUndefined())) implies (self.value->size() = 1 and self.value->forAll(element | not element.oclIsUndefined() and element.oclIsKindOf(datatypes::CE) and \r\nlet value : datatypes::CE = element.oclAsType(datatypes::CE) in \r\nvalue.codeSystem = \'EHRVALUESET_OID\'))'"
   * @generated
   */
  boolean validateѪ�͹۲���ĿValue(DiagnosticChain diagnostics, Map<Object, Object> context);

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Ѫ�͹۲���Ŀ init();
} // Ѫ�͹۲���Ŀ
