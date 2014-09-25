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

import org.openhealthtools.mdht.uml.cda.ehr.血型章节Nom;

import org.openhealthtools.mdht.uml.cda.operations.SectionOperations;

/**
 * <!-- begin-user-doc -->
 * A static utility class that provides operations related to '<em><b>血型章节 Nom</b></em>' model objects.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following operations are supported:
 * <ul>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.血型章节Nom#validate血型章节NomTemplateId(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Template Id</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.血型章节Nom#validate血型章节NomCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.血型章节Nom#validate血型章节NomText(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Text</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.血型章节Nom#validate血型章节NomTitle(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Title</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class 血型章节NomOperations extends SectionOperations
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected 血型章节NomOperations() {
    super();
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型章节NomTemplateId(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Template Id</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NomTemplateId(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型章节_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.templateId->exists(id : datatypes::II | id.root = 'Section_template_Root_OID.1.1')";

  /**
   * The cached OCL invariant for the '{@link #validate血型章节NomTemplateId(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Template Id</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NomTemplateId(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE血型章节_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.templateId->exists(id : datatypes::II | id.root = 'Section_template_Root_OID.1.1')
   * @param 血型章节Nom The receiving '<em><b>血型章节 Nom</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validate血型章节NomTemplateId(血型章节Nom 血型章节Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型章节_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.血型章节_NOM);
      try
      {
        VALIDATE血型章节_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型章节_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型章节_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(血型章节Nom))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.血型章节_NOM__VALIDATE血型章节_NOM_TEMPLATE_ID,
             EhrPlugin.INSTANCE.getString("血型章节NomTemplateId"),
             new Object [] { 血型章节Nom }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型章节NomCode(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NomCode(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型章节_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CE) and "+
"let value : datatypes::CE = self.code.oclAsType(datatypes::CE) in ("+
"value.code = '882-1' and value.codeSystem = '2.16.840.1.113883.6.1'))";

  /**
   * The cached OCL invariant for the '{@link #validate血型章节NomCode(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NomCode(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE血型章节_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;


  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CE) and 
   * let value : datatypes::CE = self.code.oclAsType(datatypes::CE) in (
   * value.code = '882-1' and value.codeSystem = '2.16.840.1.113883.6.1'))
   * @param 血型章节Nom The receiving '<em><b>血型章节 Nom</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validate血型章节NomCode(血型章节Nom 血型章节Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型章节_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.血型章节_NOM);
      try
      {
        VALIDATE血型章节_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型章节_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型章节_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(血型章节Nom))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.血型章节_NOM__VALIDATE血型章节_NOM_CODE,
             EhrPlugin.INSTANCE.getString("血型章节NomCode"),
             new Object [] { 血型章节Nom }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型章节NomText(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Text</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NomText(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型章节_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "not self.text.oclIsUndefined()";

  /**
   * The cached OCL invariant for the '{@link #validate血型章节NomText(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Text</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NomText(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE血型章节_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;


  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * not self.text.oclIsUndefined()
   * @param 血型章节Nom The receiving '<em><b>血型章节 Nom</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validate血型章节NomText(血型章节Nom 血型章节Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型章节_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.血型章节_NOM);
      try
      {
        VALIDATE血型章节_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型章节_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型章节_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(血型章节Nom))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.血型章节_NOM__VALIDATE血型章节_NOM_TEXT,
             EhrPlugin.INSTANCE.getString("血型章节NomText"),
             new Object [] { 血型章节Nom }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validate血型章节NomTitle(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Title</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NomTitle(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATE血型章节_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.title.oclIsUndefined() or self.title.isNullFlavorUndefined()) implies (not self.title.oclIsUndefined() and self.title.getText() = '血型')";

  /**
   * The cached OCL invariant for the '{@link #validate血型章节NomTitle(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>Validate血型章节 Nom Title</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validate血型章节NomTitle(血型章节Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATE血型章节_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;


  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.title.oclIsUndefined() or self.title.isNullFlavorUndefined()) implies (not self.title.oclIsUndefined() and self.title.getText() = '血型')
   * @param 血型章节Nom The receiving '<em><b>血型章节 Nom</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validate血型章节NomTitle(血型章节Nom 血型章节Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATE血型章节_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.血型章节_NOM);
      try
      {
        VALIDATE血型章节_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATE血型章节_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATE血型章节_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(血型章节Nom))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.血型章节_NOM__VALIDATE血型章节_NOM_TITLE,
             EhrPlugin.INSTANCE.getString("血型章节NomTitle"),
             new Object [] { 血型章节Nom }));
      }
      return false;
    }
    return true;
  }

} // 血型章节NomOperations