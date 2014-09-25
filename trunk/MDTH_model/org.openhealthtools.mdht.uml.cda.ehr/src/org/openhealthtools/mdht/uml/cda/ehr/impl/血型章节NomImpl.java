/**
 * <copyright>
 * </copyright>
 *
 * $Id$
 */
package org.openhealthtools.mdht.uml.cda.ehr.impl;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;

import org.eclipse.emf.ecore.EClass;

import org.openhealthtools.mdht.uml.cda.ehr.EhrPackage;

import org.openhealthtools.mdht.uml.cda.ehr.operations.血型章节NomOperations;

import org.openhealthtools.mdht.uml.cda.ehr.血型章节Nom;

import org.openhealthtools.mdht.uml.cda.impl.SectionImpl;

import org.openhealthtools.mdht.uml.cda.util.CDAUtil;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>血型章节 Nom</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * </p>
 *
 * @generated
 */
public class 血型章节NomImpl extends SectionImpl implements 血型章节Nom
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected 血型章节NomImpl()
  {
    super();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  protected EClass eStaticClass()
  {
    return EhrPackage.Literals.血型章节_NOM;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节NomTemplateId(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节NomOperations.validate血型章节NomTemplateId(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节NomCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节NomOperations.validate血型章节NomCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节NomText(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节NomOperations.validate血型章节NomText(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节NomTitle(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节NomOperations.validate血型章节NomTitle(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public 血型章节Nom init() {
    	CDAUtil.init(this);
    	return this;
  }
} //血型章节NomImpl
