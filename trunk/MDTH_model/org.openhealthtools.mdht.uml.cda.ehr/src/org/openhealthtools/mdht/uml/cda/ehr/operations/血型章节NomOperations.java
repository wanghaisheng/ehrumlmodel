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

import org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nom;

import org.openhealthtools.mdht.uml.cda.operations.SectionOperations;

/**
 * <!-- begin-user-doc -->
 * A static utility class that provides operations related to '<em><b>Ѫ���½� Nom</b></em>' model objects.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following operations are supported:
 * <ul>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nom#validateѪ���½�NomTemplateId(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Template Id</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nom#validateѪ���½�NomCode(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Code</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nom#validateѪ���½�NomText(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Text</em>}</li>
 *   <li>{@link org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nom#validateѪ���½�NomTitle(org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Title</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class Ѫ���½�NomOperations extends SectionOperations
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected Ѫ���½�NomOperations() {
    super();
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ���½�NomTemplateId(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Template Id</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NomTemplateId(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ���½�_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "self.templateId->exists(id : datatypes::II | id.root = 'Section_template_Root_OID.1.1')";

  /**
   * The cached OCL invariant for the '{@link #validateѪ���½�NomTemplateId(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Template Id</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NomTemplateId(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ���½�_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;
  

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * self.templateId->exists(id : datatypes::II | id.root = 'Section_template_Root_OID.1.1')
   * @param Ѫ���½�Nom The receiving '<em><b>Ѫ���½� Nom</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ���½�NomTemplateId(Ѫ���½�Nom Ѫ���½�Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ���½�_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ���½�_NOM);
      try
      {
        VALIDATEѪ���½�_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ���½�_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ���½�_NOM_TEMPLATE_ID__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ���½�Nom))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ���½�_NOM__VALIDATEѪ���½�_NOM_TEMPLATE_ID,
             EhrPlugin.INSTANCE.getString("Ѫ���½�NomTemplateId"),
             new Object [] { Ѫ���½�Nom }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ���½�NomCode(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Code</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NomCode(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ���½�_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CE) and "+
"let value : datatypes::CE = self.code.oclAsType(datatypes::CE) in ("+
"value.code = '882-1' and value.codeSystem = '2.16.840.1.113883.6.1'))";

  /**
   * The cached OCL invariant for the '{@link #validateѪ���½�NomCode(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Code</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NomCode(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ���½�_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;


  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.code.oclIsUndefined() or self.code.isNullFlavorUndefined()) implies (not self.code.oclIsUndefined() and self.code.oclIsKindOf(datatypes::CE) and 
   * let value : datatypes::CE = self.code.oclAsType(datatypes::CE) in (
   * value.code = '882-1' and value.codeSystem = '2.16.840.1.113883.6.1'))
   * @param Ѫ���½�Nom The receiving '<em><b>Ѫ���½� Nom</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ���½�NomCode(Ѫ���½�Nom Ѫ���½�Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ���½�_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ���½�_NOM);
      try
      {
        VALIDATEѪ���½�_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ���½�_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ���½�_NOM_CODE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ���½�Nom))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ���½�_NOM__VALIDATEѪ���½�_NOM_CODE,
             EhrPlugin.INSTANCE.getString("Ѫ���½�NomCode"),
             new Object [] { Ѫ���½�Nom }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ���½�NomText(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Text</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NomText(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ���½�_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "not self.text.oclIsUndefined()";

  /**
   * The cached OCL invariant for the '{@link #validateѪ���½�NomText(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Text</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NomText(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ���½�_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;


  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * not self.text.oclIsUndefined()
   * @param Ѫ���½�Nom The receiving '<em><b>Ѫ���½� Nom</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ���½�NomText(Ѫ���½�Nom Ѫ���½�Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ���½�_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ���½�_NOM);
      try
      {
        VALIDATEѪ���½�_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ���½�_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ���½�_NOM_TEXT__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ���½�Nom))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ���½�_NOM__VALIDATEѪ���½�_NOM_TEXT,
             EhrPlugin.INSTANCE.getString("Ѫ���½�NomText"),
             new Object [] { Ѫ���½�Nom }));
      }
      return false;
    }
    return true;
  }

  /**
   * The cached OCL expression body for the '{@link #validateѪ���½�NomTitle(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Title</em>}' operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NomTitle(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  protected static final String VALIDATEѪ���½�_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP = "(self.title.oclIsUndefined() or self.title.isNullFlavorUndefined()) implies (not self.title.oclIsUndefined() and self.title.getText() = 'Ѫ��')";

  /**
   * The cached OCL invariant for the '{@link #validateѪ���½�NomTitle(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map) <em>ValidateѪ���½� Nom Title</em>}' invariant operation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #validateѪ���½�NomTitle(Ѫ���½�Nom, org.eclipse.emf.common.util.DiagnosticChain, java.util.Map)
   * @generated
   * @ordered
   */
  
  protected static Constraint VALIDATEѪ���½�_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV;


  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * <!-- begin-model-doc -->
   * (self.title.oclIsUndefined() or self.title.isNullFlavorUndefined()) implies (not self.title.oclIsUndefined() and self.title.getText() = 'Ѫ��')
   * @param Ѫ���½�Nom The receiving '<em><b>Ѫ���½� Nom</b></em>' model object.
   * @param diagnostics The chain of diagnostics to which problems are to be appended.
   * @param context The cache of context-specific information.
   * <!-- end-model-doc -->
   * @generated
   */
  
  public static  boolean validateѪ���½�NomTitle(Ѫ���½�Nom Ѫ���½�Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (VALIDATEѪ���½�_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV == null) {
      OCL.Helper helper = EOCL_ENV.createOCLHelper();
      helper.setContext(EhrPackage.Literals.Ѫ���½�_NOM);
      try
      {
        VALIDATEѪ���½�_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV = helper.createInvariant(VALIDATEѪ���½�_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_EXP);
      }
      catch (ParserException pe)
      {
        throw new UnsupportedOperationException(pe.getLocalizedMessage());
      }
    }
    if (!EOCL_ENV.createQuery(VALIDATEѪ���½�_NOM_TITLE__DIAGNOSTIC_CHAIN_MAP__EOCL_INV).check(Ѫ���½�Nom))
    {
      if (diagnostics != null)
      {
        diagnostics.add
          (new BasicDiagnostic
            (Diagnostic.ERROR,
             EhrValidator.DIAGNOSTIC_SOURCE,
             EhrValidator.Ѫ���½�_NOM__VALIDATEѪ���½�_NOM_TITLE,
             EhrPlugin.INSTANCE.getString("Ѫ���½�NomTitle"),
             new Object [] { Ѫ���½�Nom }));
      }
      return false;
    }
    return true;
  }

} // Ѫ���½�NomOperations