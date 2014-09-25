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

import org.openhealthtools.mdht.uml.cda.ehr.EhrPackage;
import org.openhealthtools.mdht.uml.cda.ehr.EhrPlugin;
import org.openhealthtools.mdht.uml.cda.ehr.RHѪ�͹۲���Ŀ;

import org.openhealthtools.mdht.uml.cda.ehr.util.EhrValidator;

/**
 * <!-- begin-user-doc -->
 * A static utility class that provides operations related to '<em><b>RHѪ�͹۲���Ŀ</b></em>' model objects.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following operations are supported:
 * <ul>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.RHѪ�͹۲���Ŀ#validateRHѪ�͹۲���ĿClassCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate RHѪ�͹۲���Ŀ Class Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.RHѪ�͹۲���Ŀ#validateRHѪ�͹۲���ĿMoodCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate RHѪ�͹۲���Ŀ Mood Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.RHѪ�͹۲���Ŀ#validateRHѪ�͹۲���ĿText(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate RHѪ�͹۲���Ŀ Text</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.RHѪ�͹۲���Ŀ#validateѪ�͹۲���ĿCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.RHѪ�͹۲���Ŀ#validateѪ�͹۲���ĿValue(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Value</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class RHѪ�͹۲���ĿOperations extends Ѫ�͹۲���ĿOperations
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected RHѪ�͹۲���ĿOperations() {
    super();
  }

  /**
   * The cached OCL expression body for the '{@link #validateRHѪ�͹۲���ĿClassCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate RHѪ�͹۲���Ŀ Class Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateRHѪ�͹۲���ĿClassCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE_RHѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.classCode=vocab::ActClassObservation::OBS";

  /**
   * The cached OCL invariant for the '{@link #validateRHѪ�͹۲���ĿClassCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate RHѪ�͹۲���Ŀ Class Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateRHѪ�͹۲���ĿClassCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE_RHѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.classCode=vocab::ActClassObservation::OBS
   * @param rHѪ�͹۲���Ŀ The receiving '<em><b>RHѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateRHѪ�͹۲���ĿClassCode(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE_RHѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.RHѪ�͹۲���Ŀ);
      try
      {
        VALIDATE_RHѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE_RHѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE_RHѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(rHѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.RHѪ�͹۲���Ŀ__RHѪ�͹۲���Ŀ_CLASS_CODE,
             EhrPlugin.INSTANCE.getString("RHѪ�͹۲���ĿClassCode"),
             new Object [] { rHѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateRHѪ�͹۲���ĿMoodCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate RHѪ�͹۲���Ŀ Mood Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateRHѪ�͹۲���ĿMoodCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE_RHѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.moodCode=vocab::x_ActMoodDocumentObservation::EVN";

  /**
   * The cached OCL invariant for the '{@link #validateRHѪ�͹۲���ĿMoodCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate RHѪ�͹۲���Ŀ Mood Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateRHѪ�͹۲���ĿMoodCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE_RHѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.moodCode=vocab::x_ActMoodDocumentObservation::EVN
   * @param rHѪ�͹۲���Ŀ The receiving '<em><b>RHѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateRHѪ�͹۲���ĿMoodCode(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE_RHѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.RHѪ�͹۲���Ŀ);
      try
      {
        VALIDATE_RHѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE_RHѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE_RHѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(rHѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.RHѪ�͹۲���Ŀ__RHѪ�͹۲���Ŀ_MOOD_CODE,
             EhrPlugin.INSTANCE.getString("RHѪ�͹۲���ĿMoodCode"),
             new Object [] { rHѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateRHѪ�͹۲���ĿText(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate RHѪ�͹۲���Ŀ Text</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateRHѪ�͹۲���ĿText(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE_RHѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (self.text.getText() = 'RhѪ�ʹ���')";

  /**
   * The cached OCL invariant for the '{@link #validateRHѪ�͹۲���ĿText(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate RHѪ�͹۲���Ŀ Text</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateRHѪ�͹۲���ĿText(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE_RHѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (self.text.getText() = 'RhѪ�ʹ���')
   * @param rHѪ�͹۲���Ŀ The receiving '<em><b>RHѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateRHѪ�͹۲���ĿText(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE_RHѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.RHѪ�͹۲���Ŀ);
      try
      {
        VALIDATE_RHѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE_RHѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE_RHѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(rHѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.WARNING,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.RHѪ�͹۲���Ŀ__RHѪ�͹۲���Ŀ_TEXT,
             EhrPlugin.INSTANCE.getString("RHѪ�͹۲���ĿText"),
             new Object [] { rHѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CD) and "+
"let value : datatypes::CD = self.code.oclAsType(datatypes::CD) in ("+
"value.code = 'HDSD00.01.014' and value.codeSystem = 'EHRDATASET_OID'))";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿCode(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
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
   * value.code = 'HDSD00.01.014' and value.codeSystem = 'EHRDATASET_OID'))
   * @param rHѪ�͹۲���Ŀ The receiving '<em><b>RHѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿCode(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.RHѪ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(rHѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.RHѪ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_CODE,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿCode"),
             new Object [] { rHѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿValue(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Value</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿValue(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.value->isEmpty() or self.value->exists(element | element.isNullFlavorUndefined())) implies (self.value->size() = 1 and self.value->forAll(element | not element.oclIsUndefined() and element.oclIsKindOf(datatypes::CE) and "+
"let value : datatypes::CE = element.oclAsType(datatypes::CE) in "+
"value.codeSystem = 'EHRVALUESET_OID' and (value.code = '1' or value.code = '2')))";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿValue(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Value</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿValue(RHѪ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
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
   * value.codeSystem = 'EHRVALUESET_OID' and (value.code = '1' or value.code = '2')))
   * @param rHѪ�͹۲���Ŀ The receiving '<em><b>RHѪ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿValue(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.RHѪ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(rHѪ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.RHѪ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_VALUE,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿValue"),
             new Object [] { rHѪ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

} // RHѪ�͹۲���ĿOperations