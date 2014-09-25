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

import org.openhealthtools.mdht.uml.cda.ehr.operations.Ѫ���½�NomOperations;

import org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nom;

import org.openhealthtools.mdht.uml.cda.impl.SectionImpl;

import org.openhealthtools.mdht.uml.cda.util.CDAUtil;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Ѫ���½� Nom</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * </p>
 *
 * @generated
 */
public class Ѫ���½�NomImpl extends SectionImpl implements Ѫ���½�Nom
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected Ѫ���½�NomImpl()
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
    return EhrPackage.Literals.Ѫ���½�_NOM;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�NomTemplateId(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�NomOperations.validateѪ���½�NomTemplateId(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�NomCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�NomOperations.validateѪ���½�NomCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�NomText(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�NomOperations.validateѪ���½�NomText(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�NomTitle(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�NomOperations.validateѪ���½�NomTitle(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Ѫ���½�Nom init() {
    	CDAUtil.init(this);
    	return this;
  }
} //Ѫ���½�NomImpl
