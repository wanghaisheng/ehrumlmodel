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

import org.openhealthtools.mdht.uml.cda.ehr.ABO血型观察条目;
import org.openhealthtools.mdht.uml.cda.ehr.EhrPackage;

import org.openhealthtools.mdht.uml.cda.ehr.operations.ABO血型观察条目Operations;

import org.openhealthtools.mdht.uml.cda.util.CDAUtil;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>AB O血型观察条目</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * </p>
 *
 * @generated
 */
public class ABO血型观察条目Impl extends 血型观察条目Impl implements ABO血型观察条目
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected ABO血型观察条目Impl()
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
    return EhrPackage.Literals.AB_O血型观察条目;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABO血型观察条目ClassCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return ABO血型观察条目Operations.validateABO血型观察条目ClassCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABO血型观察条目MoodCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return ABO血型观察条目Operations.validateABO血型观察条目MoodCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABO血型观察条目Text(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return ABO血型观察条目Operations.validateABO血型观察条目Text(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public boolean validate血型观察条目Code(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return ABO血型观察条目Operations.validate血型观察条目Code(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public boolean validate血型观察条目Value(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return ABO血型观察条目Operations.validate血型观察条目Value(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public ABO血型观察条目 init() {
    	CDAUtil.init(this);
    	return this;
  }
} //ABO血型观察条目Impl
