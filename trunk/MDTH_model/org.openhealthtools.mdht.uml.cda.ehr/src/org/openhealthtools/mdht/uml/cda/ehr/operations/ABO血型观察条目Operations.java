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

import org.openhealthtools.mdht.uml.cda.ehr.ABO血型观察条目;
import org.openhealthtools.mdht.uml.cda.ehr.EhrPackage;
import org.openhealthtools.mdht.uml.cda.ehr.EhrPlugin;

import org.openhealthtools.mdht.uml.cda.ehr.util.EhrValidator;

/**
 * <!-- begin-user-doc -->
 * A static utility class that provides operations related to '<em><b>AB O血型观察条目</b></em>' model objects.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following operations are supported:
 * <ul>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABO血型观察条目#validateABO血型观察条目ClassCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB O血型观察条目 Class Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABO血型观察条目#validateABO血型观察条目MoodCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB O血型观察条目 Mood Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABO血型观察条目#validateABO血型观察条目Text(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB O血型观察条目 Text</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABO血型观察条目#validate血型观察条目Code(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型观察条目 Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.ABO血型观察条目#validate血型观察条目Value(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型观察条目 Value</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class ABO血型观察条目Operations extends 血型观察条目Operations
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected ABO血型观察条目Operations() {
    super();
  }

  /**
   * The cached OCL expression body for the '{@link #validateABO血型观察条目ClassCode(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB O血型观察条目 Class Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABO血型观察条目ClassCode(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE_AB_O血型观察条目_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.classCode=vocab::ActClassObservation::OBS";

  /**
   * The cached OCL invariant for the '{@link #validateABO血型观察条目ClassCode(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB O血型观察条目 Class Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABO血型观察条目ClassCode(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE_AB_O血型观察条目_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.classCode=vocab::ActClassObservation::OBS
   * @param abO血型观察条目 The receiving '<em><b>AB O血型观察条目</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateABO血型观察条目ClassCode(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE_AB_O血型观察条目_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_O血型观察条目);
      try
      {
        VALIDATE_AB_O血型观察条目_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE_AB_O血型观察条目_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE_AB_O血型观察条目_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abO血型观察条目))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_O血型观察条目__AB_O血型观察条目_CLASS_CODE,
             EhrPlugin.INSTANCE.getString("ABO血型观察条目ClassCode"),
             new Object [] { abO血型观察条目 }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateABO血型观察条目MoodCode(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB O血型观察条目 Mood Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABO血型观察条目MoodCode(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE_AB_O血型观察条目_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.moodCode=vocab::x_ActMoodDocumentObservation::EVN";

  /**
   * The cached OCL invariant for the '{@link #validateABO血型观察条目MoodCode(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB O血型观察条目 Mood Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABO血型观察条目MoodCode(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE_AB_O血型观察条目_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.moodCode=vocab::x_ActMoodDocumentObservation::EVN
   * @param abO血型观察条目 The receiving '<em><b>AB O血型观察条目</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateABO血型观察条目MoodCode(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE_AB_O血型观察条目_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_O血型观察条目);
      try
      {
        VALIDATE_AB_O血型观察条目_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE_AB_O血型观察条目_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE_AB_O血型观察条目_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abO血型观察条目))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_O血型观察条目__AB_O血型观察条目_MOOD_CODE,
             EhrPlugin.INSTANCE.getString("ABO血型观察条目MoodCode"),
             new Object [] { abO血型观察条目 }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateABO血型观察条目Text(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB O血型观察条目 Text</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABO血型观察条目Text(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE_AB_O血型观察条目_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (self.text.getText() = 'ABO血型代码')";

  /**
   * The cached OCL invariant for the '{@link #validateABO血型观察条目Text(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate AB O血型观察条目 Text</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateABO血型观察条目Text(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE_AB_O血型观察条目_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (self.text.getText() = 'ABO血型代码')
   * @param abO血型观察条目 The receiving '<em><b>AB O血型观察条目</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateABO血型观察条目Text(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE_AB_O血型观察条目_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_O血型观察条目);
      try
      {
        VALIDATE_AB_O血型观察条目_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE_AB_O血型观察条目_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE_AB_O血型观察条目_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abO血型观察条目))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.WARNING,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_O血型观察条目__AB_O血型观察条目_TEXT,
             EhrPlugin.INSTANCE.getString("ABO血型观察条目Text"),
             new Object [] { abO血型观察条目 }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型观察条目Code(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型观察条目 Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型观察条目Code(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型观察条目_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CD) and "+
"let value : datatypes::CD = self.code.oclAsType(datatypes::CD) in ("+
"value.code = 'HDSD00.01.013' and value.codeSystem = 'EHRDATASET_OID'))";

  /**
   * The cached OCL invariant for the '{@link #validate血型观察条目Code(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型观察条目 Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型观察条目Code(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE血型观察条目_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CD) and 
   * let value : datatypes::CD = self.code.oclAsType(datatypes::CD) in (
   * value.code = 'HDSD00.01.013' and value.codeSystem = 'EHRDATASET_OID'))
   * @param abO血型观察条目 The receiving '<em><b>AB O血型观察条目</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validate血型观察条目Code(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型观察条目_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_O血型观察条目);
      try
      {
        VALIDATE血型观察条目_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型观察条目_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型观察条目_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abO血型观察条目))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_O血型观察条目__VALIDATE血型观察条目_CODE,
             EhrPlugin.INSTANCE.getString("血型观察条目Code"),
             new Object [] { abO血型观察条目 }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型观察条目Value(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型观察条目 Value</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型观察条目Value(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型观察条目_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.value->isEmpty() or self.value->exists(element | element.isNullFlavorUndefined())) implies (self.value->size() = 1 and self.value->forAll(element | not element.oclIsUndefined() and element.oclIsKindOf(datatypes::CE) and "+
"let value : datatypes::CE = element.oclAsType(datatypes::CE) in "+
"value.codeSystem = 'EHRVALUESET_OID' and (value.code = '1' or value.code = '2' or value.code = '3')))";

  /**
   * The cached OCL invariant for the '{@link #validate血型观察条目Value(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型观察条目 Value</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型观察条目Value(ABO血型观察条目, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE血型观察条目_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.value->isEmpty() or self.value->exists(element | element.isNullFlavorUndefined())) implies (self.value->size() = 1 and self.value->forAll(element | not element.oclIsUndefined() and element.oclIsKindOf(datatypes::CE) and 
   * let value : datatypes::CE = element.oclAsType(datatypes::CE) in 
   * value.codeSystem = 'EHRVALUESET_OID' and (value.code = '1' or value.code = '2' or value.code = '3')))
   * @param abO血型观察条目 The receiving '<em><b>AB O血型观察条目</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validate血型观察条目Value(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型观察条目_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.AB_O血型观察条目);
      try
      {
        VALIDATE血型观察条目_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型观察条目_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型观察条目_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(abO血型观察条目))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.AB_O血型观察条目__VALIDATE血型观察条目_VALUE,
             EhrPlugin.INSTANCE.getString("血型观察条目Value"),
             new Object [] { abO血型观察条目 }));
      }
      return false;
    }
    return true;
  }

} // ABO血型观察条目Operations