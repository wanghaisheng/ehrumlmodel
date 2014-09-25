/**
 * <copyright>
 * </copyright>
 *
 * $Id$
 */
package org.openhealthtools.mdht.uml.cda.ehr.operations;

import java.util.Map;

import org.eclipse.emf.common.util.BasicDiagnostic;
import org.eclipse.emf.common.util.Diagnostic;
import org.eclipse.emf.common.util.DiagnosticChain;

import org.eclipse.ocl.ParserException;

import org.eclipse.ocl.ecore.Constraint;
import org.eclipse.ocl.ecore.OCL;

import org.openhealthtools.mdht.uml.cda.ehr.ABOѪ�͹۲���Ŀ;
import org.openhealthtools.mdht.uml.cda.ehr.EhrPackage;
import org.openhealthtools.mdht.uml.cda.ehr.EhrPlugin;

import org.openhealthtools.mdht.uml.cda.ehr.util.EhrValidator;

/**
 * <!-- begin-user-doc -->
 * A static utility class that provides operations related to '<em><b>AB OѪ�͹۲���Ŀ</b></em>' model objects.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following operations are supported:
 * <ul>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABOѪ�͹۲���Ŀ#validateABOѪ�͹۲���ĿClassCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB OѪ�͹۲���Ŀ Class Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABOѪ�͹۲���Ŀ#validateABOѪ�͹۲���ĿMoodCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB OѪ�͹۲���Ŀ Mood Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABOѪ�͹۲���Ŀ#validateABOѪ�͹۲���ĿText(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB OѪ�͹۲���Ŀ Text</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABOѪ�͹۲���Ŀ#validateѪ�͹۲���ĿCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABOѪ�͹۲���Ŀ#validateѪ�͹۲���ĿValue(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Value</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class ABOѪ�͹۲���ĿOperations extends Ѫ�͹۲���ĿOperations
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected ABOѪ�͹۲���ĿOperations() {
    super();
  }

  /**
   * The cached OCL expression body for the '{@link #validateABOѪ�͹۲���ĿClassCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB OѪ�͹۲���Ŀ Class Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABOѪ�͹۲���ĿClassCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE_AB_OѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.classCode=vocab::ActClassObservation::OBS";

  /**
   * The cached OCL invariant for the '{@link #validateABOѪ�͹۲���ĿClassCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB OѪ�͹۲���Ŀ Class Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABOѪ�͹۲���ĿClassCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE_AB_OѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.classCode=vocab::ActClassObservation::OBS
   * @param abOѪ�͹۲���Ŀ The receiving '<em><b>AB OѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateABOѪ�͹۲���ĿClassCode(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE_AB_OѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_OѪ�͹۲���Ŀ);
      try
      {
        VALIDATE_AB_OѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE_AB_OѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE_AB_OѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abOѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_OѪ�͹۲���Ŀ__AB_OѪ�͹۲���Ŀ_CLASS_CODE,
             EhrPlugin.INSTANCE.getString("ABOѪ�͹۲���ĿClassCode"),
             new Object [] { abOѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateABOѪ�͹۲���ĿMoodCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB OѪ�͹۲���Ŀ Mood Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABOѪ�͹۲���ĿMoodCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE_AB_OѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.moodCode=vocab::x_ActMoodDocumentObservation::EVN";

  /**
   * The cached OCL invariant for the '{@link #validateABOѪ�͹۲���ĿMoodCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB OѪ�͹۲���Ŀ Mood Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABOѪ�͹۲���ĿMoodCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE_AB_OѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.moodCode=vocab::x_ActMoodDocumentObservation::EVN
   * @param abOѪ�͹۲���Ŀ The receiving '<em><b>AB OѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateABOѪ�͹۲���ĿMoodCode(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE_AB_OѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_OѪ�͹۲���Ŀ);
      try
      {
        VALIDATE_AB_OѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE_AB_OѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE_AB_OѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abOѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_OѪ�͹۲���Ŀ__AB_OѪ�͹۲���Ŀ_MOOD_CODE,
             EhrPlugin.INSTANCE.getString("ABOѪ�͹۲���ĿMoodCode"),
             new Object [] { abOѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateABOѪ�͹۲���ĿText(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB OѪ�͹۲���Ŀ Text</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABOѪ�͹۲���ĿText(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE_AB_OѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (self.text.getText() = 'ABOѪ�ʹ���')";

  /**
   * The cached OCL invariant for the '{@link #validateABOѪ�͹۲���ĿText(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB OѪ�͹۲���Ŀ Text</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABOѪ�͹۲���ĿText(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE_AB_OѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (self.text.getText() = 'ABOѪ�ʹ���')
   * @param abOѪ�͹۲���Ŀ The receiving '<em><b>AB OѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateABOѪ�͹۲���ĿText(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE_AB_OѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_OѪ�͹۲���Ŀ);
      try
      {
        VALIDATE_AB_OѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE_AB_OѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE_AB_OѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abOѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.WARNING,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_OѪ�͹۲���Ŀ__AB_OѪ�͹۲���Ŀ_TEXT,
             EhrPlugin.INSTANCE.getString("ABOѪ�͹۲���ĿText"),
             new Object [] { abOѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CD) and "+
"let value : datatypes::CD = self.code.oclAsType(datatypes::CD) in ("+
"value.code = 'HDSD00.01.013' and value.codeSystem = 'EHRDATASET_OID'))";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿCode(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CD) and 
   * let value : datatypes::CD = self.code.oclAsType(datatypes::CD) in (
   * value.code = 'HDSD00.01.013' and value.codeSystem = 'EHRDATASET_OID'))
   * @param abOѪ�͹۲���Ŀ The receiving '<em><b>AB OѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿCode(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_OѪ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abOѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_OѪ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_CODE,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿCode"),
             new Object [] { abOѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿValue(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Value</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿValue(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.value->isEmpty() or self.value->exists(element | element.isNullFlavorUndefined())) implies (self.value->size() = 1 and self.value->forAll(element | not element.oclIsUndefined() and element.oclIsKindOf(datatypes::CE) and "+
"let value : datatypes::CE = element.oclAsType(datatypes::CE) in "+
"value.codeSystem = 'EHRVALUESET_OID' and (value.code = '1' or value.code = '2' or value.code = '3')))";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿValue(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Value</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿValue(ABOѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.value->isEmpty() or self.value->exists(element | element.isNullFlavorUndefined())) implies (self.value->size() = 1 and self.value->forAll(element | not element.oclIsUndefined() and element.oclIsKindOf(datatypes::CE) and 
   * let value : datatypes::CE = element.oclAsType(datatypes::CE) in 
   * value.codeSystem = 'EHRVALUESET_OID' and (value.code = '1' or value.code = '2' or value.code = '3')))
   * @param abOѪ�͹۲���Ŀ The receiving '<em><b>AB OѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿValue(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_OѪ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abOѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_OѪ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_VALUE,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿValue"),
             new Object [] { abOѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

} // ABOѪ�͹۲���ĿOperations