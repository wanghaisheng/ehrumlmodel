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
import org.openhealthtools.mdht.uml.cda.ehr.operations.Ѫ���½�NarOperations;
import org.openhealthtools.mdht.uml.cda.ehr.Ѫ���½�Nar;

import org.openhealthtools.mdht.uml.cda.impl.SectionImpl;

import org.openhealthtools.mdht.uml.cda.util.CDAUtil;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Ѫ���½� Nar</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * </p>
 *
 * @generated
 */
public class Ѫ���½�NarImpl extends SectionImpl implements Ѫ���½�Nar
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected Ѫ���½�NarImpl()
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
    return EhrPackage.Literals.Ѫ���½�_NAR;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�NarTemplateId(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�NarOperations.validateѪ���½�NarTemplateId(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�NarCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�NarOperations.validateѪ���½�NarCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�NarText(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�NarOperations.validateѪ���½�NarText(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�NarTitle(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�NarOperations.validateѪ���½�NarTitle(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Ѫ���½�Nar init() {
    	CDAUtil.init(this);
    	return this;
  }
} //Ѫ���½�NarImpl
