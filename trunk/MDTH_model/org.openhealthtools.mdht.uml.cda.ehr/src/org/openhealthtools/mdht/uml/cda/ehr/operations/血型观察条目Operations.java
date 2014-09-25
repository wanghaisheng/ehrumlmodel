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

import org.openhealthtools.mdht.uml.cda.ehr.util.EhrValidator;

import org.openhealthtools.mdht.uml.cda.ehr.Ѫ�͹۲���Ŀ;

import org.openhealthtools.mdht.uml.cda.operations.ClinicalStatementOperations;

/**
 * <!-- begin-user-doc -->
 * A static utility class that provides operations related to '<em><b>Ѫ�͹۲���Ŀ</b></em>' model objects.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following operations are supported:
 * <ul>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ�͹۲���Ŀ#validateѪ�͹۲���ĿTemplateId(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Template Id</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ�͹۲���Ŀ#validateѪ�͹۲���ĿClassCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Class Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ�͹۲���Ŀ#validateѪ�͹۲���ĿCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ�͹۲���Ŀ#validateѪ�͹۲���ĿMoodCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Mood Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ�͹۲���Ŀ#validateѪ�͹۲���ĿText(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Text</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ�͹۲���Ŀ#validateѪ�͹۲���ĿValue(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Value</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class Ѫ�͹۲���ĿOperations extends ClinicalStatementOperations
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected Ѫ�͹۲���ĿOperations() {
    super();
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿTemplateId(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Template Id</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿTemplateId(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.templateId->exists(id : datatypes::II | id.root = 'Entry_template_Root_OID.1')";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿTemplateId(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Template Id</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿTemplateId(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ�͹۲���Ŀ_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.templateId->exists(id : datatypes::II | id.root = 'Entry_template_Root_OID.1')
   * @param Ѫ�͹۲���Ŀ The receiving '<em><b>Ѫ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿTemplateId(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_TEMPLATE_ID,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿTemplateId"),
             new Object [] { Ѫ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿClassCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Class Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿClassCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.classCode=vocab::ActClassObservation::OBS";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿClassCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Class Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿClassCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.classCode=vocab::ActClassObservation::OBS
   * @param Ѫ�͹۲���Ŀ The receiving '<em><b>Ѫ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿClassCode(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_CLASS_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_CLASS_CODE,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿClassCode"),
             new Object [] { Ѫ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CD) and "+
"let value : datatypes::CD = self.code.oclAsType(datatypes::CD) in ("+
"value.codeSystem = 'EHRDATASET_OID'))";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
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
   * value.codeSystem = 'EHRDATASET_OID'))
   * @param Ѫ�͹۲���Ŀ The receiving '<em><b>Ѫ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿCode(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_CODE,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿCode"),
             new Object [] { Ѫ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿMoodCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Mood Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿMoodCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.moodCode=vocab::x_ActMoodDocumentObservation::EVN";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿMoodCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Mood Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿMoodCode(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.moodCode=vocab::x_ActMoodDocumentObservation::EVN
   * @param Ѫ�͹۲���Ŀ The receiving '<em><b>Ѫ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿMoodCode(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_MOOD_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_MOOD_CODE,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿMoodCode"),
             new Object [] { Ѫ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿText(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Text</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿText(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (not self.text.oclIsUndefined())";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿText(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Text</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿText(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.text.oclIsUndefined() or self.text.isNullFlavorUndefined()) implies (not self.text.oclIsUndefined())
   * @param Ѫ�͹۲���Ŀ The receiving '<em><b>Ѫ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿText(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.WARNING,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_TEXT,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿText"),
             new Object [] { Ѫ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ�͹۲���ĿValue(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Value</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿValue(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.value->isEmpty() or self.value->exists(element | element.isNullFlavorUndefined())) implies (self.value->size() = 1 and self.value->forAll(element | not element.oclIsUndefined() and element.oclIsKindOf(datatypes::CE) and "+
"let value : datatypes::CE = element.oclAsType(datatypes::CE) in "+
"value.codeSystem = 'EHRVALUESET_OID'))";

  /**
   * The cached OCL invariant for the '{@link #validateѪ�͹۲���ĿValue(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ�͹۲���Ŀ Value</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ�͹۲���ĿValue(Ѫ�͹۲���Ŀ, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
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
   * value.codeSystem = 'EHRVALUESET_OID'))
   * @param Ѫ�͹۲���Ŀ The receiving '<em><b>Ѫ�͹۲���Ŀ</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ�͹۲���ĿValue(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ�͹۲���Ŀ);
      try
      {
        VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ�͹۲���Ŀ_VALUE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ�͹۲���Ŀ))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_VALUE,
             EhrPlugin.INSTANCE.getString("Ѫ�͹۲���ĿValue"),
             new Object [] { Ѫ�͹۲���Ŀ }));
      }
      return false;
    }
    return true;
  }

} // Ѫ�͹۲���ĿOperations