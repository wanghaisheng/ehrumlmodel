/**
 * <copyright>
 * </copyright>
 *
 * $Id$
 */
package org.openhealthtools.mdht.uml.cda.ehr;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>RH血型观察条目</b></em>'.
 * <!-- end-user-doc -->
 *
 *
 * @see org.openhealthtools.mdht.uml.cda.ehr.EhrPackage#getRH血型观察条目()
 * @model annotation="http://www.openhealthtools.org/mdht/uml/cda/annotation statusCode.code='completed' value.codeSystemName='\u536b\u751f\u90e8\u536b\u751f\u4fe1\u606f\u6570\u636e\u5143\u503c\u57df\u4ee3\u7801' code.codeSystem='EHRDATASET_OID' code.displayName='Rh\u8840\u578b\u4ee3\u7801' constraints.validation.error='RH\u8840\u578b\u89c2\u5bdf\u6761\u76eeClassCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeCode RH\u8840\u578b\u89c2\u5bdf\u6761\u76eeMoodCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeValue' code.codeSystemName='\u57ce\u4e61\u5c45\u6c11\u5065\u5eb7\u6863\u6848\u57fa\u672c\u6570\u636e\u96c6' text.mixed='Rh\u8840\u578b\u4ee3\u7801' constraints.validation.warning='RH\u8840\u578b\u89c2\u5bdf\u6761\u76eeText' classCode='OBS' code.code='HDSD00.01.014' moodCode='EVN' value.codeSystem='EHRVALUESET_OID'"
 * @generated
 */
public interface RH血型观察条目 extends 血型观察条目
{
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
  boolean validateRH血型观察条目ClassCode(DiagnosticChain diagnostics, Map<Object, Object> context);

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
  boolean validateRH血型观察条目MoodCode(DiagnosticChain diagnostics, Map<Object, Object> context);

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (self.text.getText() = 'Rh血型代码')
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @model annotation="http://www.eclipse.org/uml2/1.1.0/GenModel body='(self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (self.text.getText() = \'Rh\u8840\u578b\u4ee3\u7801\')'"
   * @generated
   */
  boolean validateRH血型观察条目Text(DiagnosticChain diagnostics, Map<Object, Object> context);

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public RH血型观察条目 init();
} // RH血型观察条目
