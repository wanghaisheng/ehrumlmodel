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
import org.openhealthtools.mdht.uml.cda.ehr.operations.血型章节NarOperations;
import org.openhealthtools.mdht.uml.cda.ehr.血型章节Nar;

import org.openhealthtools.mdht.uml.cda.impl.SectionImpl;

import org.openhealthtools.mdht.uml.cda.util.CDAUtil;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>血型章节 Nar</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * </p>
 *
 * @generated
 */
public class 血型章节NarImpl extends SectionImpl implements 血型章节Nar
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected 血型章节NarImpl()
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
    return EhrPackage.Literals.血型章节_NAR;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节NarTemplateId(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节NarOperations.validate血型章节NarTemplateId(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节NarCode(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节NarOperations.validate血型章节NarCode(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节NarText(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节NarOperations.validate血型章节NarText(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节NarTitle(DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节NarOperations.validate血型章节NarTitle(this, diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public 血型章节Nar init() {
    	CDAUtil.init(this);
    	return this;
  }
} //血型章节NarImpl
