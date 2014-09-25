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

import org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nar;

import org.openhealthtools.mdht.uml.cda.operations.SectionOperations;

/**
 * <!-- begin-user-doc -->
 * A static utility class that provides operations related to '<em><b>Ѫ���½� Nar</b></em>' model objects.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following operations are supported:
 * <ul>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nar#validateѪ���½�NarTemplateId(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Template Id</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nar#validateѪ���½�NarCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nar#validateѪ���½�NarText(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Text</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nar#validateѪ���½�NarTitle(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Title</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class Ѫ���½�NarOperations extends SectionOperations
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected Ѫ���½�NarOperations() {
    super();
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ���½�NarTemplateId(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Template Id</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NarTemplateId(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ���½�_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.templateId->exists(id : datatypes::II | id.root = 'Section_template_Root_OID.1')";

  /**
   * The cached OCL invariant for the '{@link #validateѪ���½�NarTemplateId(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Template Id</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NarTemplateId(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ���½�_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.templateId->exists(id : datatypes::II | id.root = 'Section_template_Root_OID.1')
   * @param Ѫ���½�Nar The receiving '<em><b>Ѫ���½� Nar</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ���½�NarTemplateId(Ѫ���½�Nar Ѫ���½�Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ���½�_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ���½�_NAR);
      try
      {
        VALIDATEѪ���½�_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ���½�_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ���½�_NAR_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ���½�Nar))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ���½�_NAR__VALIDATEѪ���½�_NAR_TEMPLATE_ID,
             EhrPlugin.INSTANCE.getString("Ѫ���½�NarTemplateId"),
             new Object [] { Ѫ���½�Nar }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ���½�NarCode(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NarCode(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ���½�_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CE) and "+
"let value : datatypes::CE = self.code.oclAsType(datatypes::CE) in ("+
"value.code = '882-1' and value.codeSystem = '2.16.840.1.113883.6.1'))";

  /**
   * The cached OCL invariant for the '{@link #validateѪ���½�NarCode(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NarCode(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static Constraint VALIDATEѪ���½�_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CE) and 
   * let value : datatypes::CE = self.code.oclAsType(datatypes::CE) in (
   * value.code = '882-1' and value.codeSystem = '2.16.840.1.113883.6.1'))
   * @param Ѫ���½�Nar The receiving '<em><b>Ѫ���½� Nar</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  public static  boolean validateѪ���½�NarCode(Ѫ���½�Nar Ѫ���½�Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ���½�_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ���½�_NAR);
      try
      {
        VALIDATEѪ���½�_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ���½�_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ���½�_NAR_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ���½�Nar))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ���½�_NAR__VALIDATEѪ���½�_NAR_CODE,
             EhrPlugin.INSTANCE.getString("Ѫ���½�NarCode"),
             new Object [] { Ѫ���½�Nar }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ���½�NarText(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Text</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NarText(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ���½�_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "not self.text.oclIsUndefined()";

  /**
   * The cached OCL invariant for the '{@link #validateѪ���½�NarText(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Text</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NarText(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static Constraint VALIDATEѪ���½�_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * not self.text.oclIsUndefined()
   * @param Ѫ���½�Nar The receiving '<em><b>Ѫ���½� Nar</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  public static  boolean validateѪ���½�NarText(Ѫ���½�Nar Ѫ���½�Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ���½�_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ���½�_NAR);
      try
      {
        VALIDATEѪ���½�_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ���½�_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ���½�_NAR_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ���½�Nar))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ���½�_NAR__VALIDATEѪ���½�_NAR_TEXT,
             EhrPlugin.INSTANCE.getString("Ѫ���½�NarText"),
             new Object [] { Ѫ���½�Nar }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ���½�NarTitle(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Title</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NarTitle(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ���½�_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.title.oclIsUndefined() or self.title.isNullFlavorUndefined()) implies (not self.title.oclIsUndefined() and self.title.getText() = 'Ѫ��')";

  /**
   * The cached OCL invariant for the '{@link #validateѪ���½�NarTitle(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nar Title</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NarTitle(Ѫ���½�Nar, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ���½�_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.title.oclIsUndefined() or self.title.isNullFlavorUndefined()) implies (not self.title.oclIsUndefined() and self.title.getText() = 'Ѫ��')
   * @param Ѫ���½�Nar The receiving '<em><b>Ѫ���½� Nar</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ���½�NarTitle(Ѫ���½�Nar Ѫ���½�Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ���½�_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ���½�_NAR);
      try
      {
        VALIDATEѪ���½�_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ���½�_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ���½�_NAR_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ���½�Nar))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ���½�_NAR__VALIDATEѪ���½�_NAR_TITLE,
             EhrPlugin.INSTANCE.getString("Ѫ���½�NarTitle"),
             new Object [] { Ѫ���½�Nar }));
      }
      return false;
    }
    return true;
  }

} // Ѫ���½�NarOperations