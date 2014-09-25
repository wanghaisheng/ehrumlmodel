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
import org.openhealthtools.mdht.uml.cda.ehr.RH血型观察条目;

import org.openhealthtools.mdht.uml.cda.ehr.operations.RH血型观察条目Operations;

import org.openhealthtools.mdht.uml.cda.util.CDAUtil;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>RH血型观察条目</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * </p>
 *
 * @generated
 */
public class RH血型观察条目Impl extends 血型观察条目Impl implements RH血型观察条目
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected RH血型观察条目Impl()
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
    return EhrPackage.Literals.RH血型观察条目;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRH血型观察条目ClassCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return RH血型观察条目Operations.validateRH血型观察条目ClassCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRH血型观察条目MoodCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return RH血型观察条目Operations.validateRH血型观察条目MoodCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRH血型观察条目Text(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return RH血型观察条目Operations.validateRH血型观察条目Text(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public boolean validate血型观察条目Code(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return RH血型观察条目Operations.validate血型观察条目Code(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public boolean validate血型观察条目Value(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return RH血型观察条目Operations.validate血型观察条目Value(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public RH血型观察条目 init() {
    	CDAUtil.init(this);
    	return this;
  }
} //RH血型观察条目Impl
