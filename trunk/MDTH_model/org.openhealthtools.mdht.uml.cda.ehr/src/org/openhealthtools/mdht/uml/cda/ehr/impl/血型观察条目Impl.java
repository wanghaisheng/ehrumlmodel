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
import org.openhealthtools.mdht.uml.cda.ehr.operations.Ѫ�͹۲���ĿOperations;
import org.openhealthtools.mdht.uml.cda.ehr.Ѫ�͹۲���Ŀ;

import org.openhealthtools.mdht.uml.cda.impl.ObservationImpl;

import org.openhealthtools.mdht.uml.cda.util.CDAUtil;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Ѫ�͹۲���Ŀ</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * </p>
 *
 * @generated
 */
public class Ѫ�͹۲���ĿImpl extends ObservationImpl implements Ѫ�͹۲���Ŀ
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected Ѫ�͹۲���ĿImpl()
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
    return EhrPackage.Literals.Ѫ�͹۲���Ŀ;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���ĿTemplateId(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���ĿOperations.validateѪ�͹۲���ĿTemplateId(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���ĿClassCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���ĿOperations.validateѪ�͹۲���ĿClassCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���ĿCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���ĿOperations.validateѪ�͹۲���ĿCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���ĿMoodCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���ĿOperations.validateѪ�͹۲���ĿMoodCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���ĿText(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���ĿOperations.validateѪ�͹۲���ĿText(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���ĿValue(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���ĿOperations.validateѪ�͹۲���ĿValue(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Ѫ�͹۲���Ŀ init() {
    	CDAUtil.init(this);
    	return this;
  }
} //Ѫ�͹۲���ĿImpl
