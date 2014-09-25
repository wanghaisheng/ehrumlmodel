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

import org.openhealthtools.mdht.uml.cda.ehr.血型章节Nar;

import org.openhealthtools.mdht.uml.cda.operations.SectionOperations;

/**
 * <!-- begin-user-doc -->
 * A static utility class that provides operations related to '<em><b>血型章节 Nar</b></em>' model objects.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following operations are supported:
 * <ul>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.血型章节Nar#validate血型章节NarTemplateId(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Template Id</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.血型章节Nar#validate血型章节NarCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.血型章节Nar#validate血型章节NarText(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Text</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.血型章节Nar#validate血型章节NarTitle(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Title</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class 血型章节NarOperations extends SectionOperations
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected 血型章节NarOperations() {
    super();
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型章节NarTemplateId(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Template Id</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NarTemplateId(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型章节_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.templateId->exists(id : datatypes::II | id.root = 'Section_template_Root_OID.1')";

  /**
   * The cached OCL invariant for the '{@link #validate血型章节NarTemplateId(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Template Id</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NarTemplateId(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE血型章节_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.templateId->exists(id : datatypes::II | id.root = 'Section_template_Root_OID.1')
   * @param 血型章节Nar The receiving '<em><b>血型章节 Nar</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validate血型章节NarTemplateId(血型章节Nar 血型章节Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型章节_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.血型章节_NAR);
      try
      {
        VALIDATE血型章节_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型章节_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型章节_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(血型章节Nar))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.血型章节_NAR__VALIDATE血型章节_NAR_TEMPLATE_ID,
             EhrPlugin.INSTANCE.getString("血型章节NarTemplateId"),
             new Object [] { 血型章节Nar }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型章节NarCode(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NarCode(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型章节_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CE) and "+
"let value : datatypes::CE = self.code.oclAsType(datatypes::CE) in ("+
"value.code = '882-1' and value.codeSystem = '2.16.840.1.113883.6.1'))";

  /**
   * The cached OCL invariant for the '{@link #validate血型章节NarCode(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NarCode(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static Constraint VALIDATE血型章节_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CE) and 
   * let value : datatypes::CE = self.code.oclAsType(datatypes::CE) in (
   * value.code = '882-1' and value.codeSystem = '2.16.840.1.113883.6.1'))
   * @param 血型章节Nar The receiving '<em><b>血型章节 Nar</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  public static  boolean validate血型章节NarCode(血型章节Nar 血型章节Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型章节_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.血型章节_NAR);
      try
      {
        VALIDATE血型章节_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型章节_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型章节_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(血型章节Nar))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.血型章节_NAR__VALIDATE血型章节_NAR_CODE,
             EhrPlugin.INSTANCE.getString("血型章节NarCode"),
             new Object [] { 血型章节Nar }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型章节NarText(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Text</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NarText(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型章节_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "not self.text.oclIsUndefined()";

  /**
   * The cached OCL invariant for the '{@link #validate血型章节NarText(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Text</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NarText(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static Constraint VALIDATE血型章节_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * not self.text.oclIsUndefined()
   * @param 血型章节Nar The receiving '<em><b>血型章节 Nar</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  public static  boolean validate血型章节NarText(血型章节Nar 血型章节Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型章节_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.血型章节_NAR);
      try
      {
        VALIDATE血型章节_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型章节_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型章节_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(血型章节Nar))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.血型章节_NAR__VALIDATE血型章节_NAR_TEXT,
             EhrPlugin.INSTANCE.getString("血型章节NarText"),
             new Object [] { 血型章节Nar }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型章节NarTitle(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Title</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NarTitle(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型章节_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.title.oclIsUndefined() or self.title.isNullFlavorUndefined()) implies (not self.title.oclIsUndefined() and self.title.getText() = '血型')";

  /**
   * The cached OCL invariant for the '{@link #validate血型章节NarTitle(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nar Title</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NarTitle(血型章节Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE血型章节_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.title.oclIsUndefined() or self.title.isNullFlavorUndefined()) implies (not self.title.oclIsUndefined() and self.title.getText() = '血型')
   * @param 血型章节Nar The receiving '<em><b>血型章节 Nar</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validate血型章节NarTitle(血型章节Nar 血型章节Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型章节_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.血型章节_NAR);
      try
      {
        VALIDATE血型章节_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型章节_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型章节_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(血型章节Nar))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.血型章节_NAR__VALIDATE血型章节_NAR_TITLE,
             EhrPlugin.INSTANCE.getString("血型章节NarTitle"),
             new Object [] { 血型章节Nar }));
      }
      return false;
    }
    return true;
  }

} // 血型章节NarOperations