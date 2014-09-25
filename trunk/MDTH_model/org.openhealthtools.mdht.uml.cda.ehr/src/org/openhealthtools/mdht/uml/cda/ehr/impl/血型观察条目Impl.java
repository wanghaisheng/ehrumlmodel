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
import org.openhealthtools.mdht.uml.cda.ehr.operations.血型观察条目Operations;
import org.openhealthtools.mdht.uml.cda.ehr.血型观察条目;

import org.openhealthtools.mdht.uml.cda.impl.ObservationImpl;

import org.openhealthtools.mdht.uml.cda.util.CDAUtil;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>血型观察条目</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * </p>
 *
 * @generated
 */
public class 血型观察条目Impl extends ObservationImpl implements 血型观察条目
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected 血型观察条目Impl()
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
    return EhrPackage.Literals.血型观察条目;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目TemplateId(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目Operations.validate血型观察条目TemplateId(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目ClassCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目Operations.validate血型观察条目ClassCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目Code(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目Operations.validate血型观察条目Code(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目MoodCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目Operations.validate血型观察条目MoodCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目Text(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目Operations.validate血型观察条目Text(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目Value(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目Operations.validate血型观察条目Value(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public 血型观察条目 init() {
    	CDAUtil.init(this);
    	return this;
  }
} //血型观察条目Impl
