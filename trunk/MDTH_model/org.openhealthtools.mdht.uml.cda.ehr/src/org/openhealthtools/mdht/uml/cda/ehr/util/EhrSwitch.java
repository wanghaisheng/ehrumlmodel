/**
 * <copyright>
 * </copyright>
 *
 * $Id$
 */
package org.openhealthtools.mdht.uml.cda.ehr.util;

import java.util.List;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;

import org.openhealthtools.mdht.uml.cda.ClinicalStatement;
import org.openhealthtools.mdht.uml.cda.Observation;
import org.openhealthtools.mdht.uml.cda.ClinicalDocument;

import org.openhealthtools.mdht.uml.cda.Section;
import org.openhealthtools.mdht.uml.cda.ehr.*;

import org.openhealthtools.mdht.uml.hl7.rim.Act;
import org.openhealthtools.mdht.uml.hl7.rim.InfrastructureRoot;

/**
 * <!-- begin-user-doc -->
 * The <b>Switch</b> for the model's inheritance hierarchy.
 * It supports the call {@link #doSwitch(EObject) doSwitch(object)}
 * to invoke the <code>caseXXX</code> method for each class of the model,
 * starting with the actual class of the object
 * and proceeding up the inheritance hierarchy
 * until a non-null result is returned,
 * which is the result of the switch.
 * <!-- end-user-doc -->
 * @see org.openhealthtools.mdht.uml.cda.ehr.EhrPackage
 * @generated
 */
public class EhrSwitch<T>
{
  /**
   * The cached model package
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected static EhrPackage modelPackage;

  /**
   * Creates an instance of the switch.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EhrSwitch()
  {
    if (modelPackage == null)
    {
      modelPackage = EhrPackage.eINSTANCE;
    }
  }

  /**
   * Calls <code>caseXXX</code> for each class of the model until one returns a non null result; it yields that result.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the first non-null result returned by a <code>caseXXX</code> call.
   * @generated
   */
  public T doSwitch(EObject theEObject)
  {
    return doSwitch(theEObject.eClass(), theEObject);
  }

  /**
   * Calls <code>caseXXX</code> for each class of the model until one returns a non null result; it yields that result.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the first non-null result returned by a <code>caseXXX</code> call.
   * @generated
   */
  protected T doSwitch(EClass theEClass, EObject theEObject)
  {
    if (theEClass.eContainer() == modelPackage)
    {
      return doSwitch(theEClass.getClassifierID(), theEObject);
    }
    else
    {
      List<EClass> eSuperTypes = theEClass.getESuperTypes();
      return
        eSuperTypes.isEmpty() ?
          defaultCase(theEObject) :
          doSwitch(eSuperTypes.get(0), theEObject);
    }
  }

  /**
   * Calls <code>caseXXX</code> for each class of the model until one returns a non null result; it yields that result.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the first non-null result returned by a <code>caseXXX</code> call.
   * @generated
   */
  protected T doSwitch(int classifierID, EObject theEObject)
  {
    switch (classifierID)
    {
      case EhrPackage.Ѫ���½�_NAR:
      {
        Ѫ���½�Nar Ѫ���½�Nar = (Ѫ���½�Nar)theEObject;
        T result = caseѪ���½�Nar(Ѫ���½�Nar);
        if (result == null) result = caseSection(Ѫ���½�Nar);
        if (result == null) result = caseAct(Ѫ���½�Nar);
        if (result == null) result = caseInfrastructureRoot(Ѫ���½�Nar);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case EhrPackage.Ѫ�͹۲���Ŀ:
      {
        Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ = (Ѫ�͹۲���Ŀ)theEObject;
        T result = caseѪ�͹۲���Ŀ(Ѫ�͹۲���Ŀ);
        if (result == null) result = caseObservation(Ѫ�͹۲���Ŀ);
        if (result == null) result = caseClinicalStatement(Ѫ�͹۲���Ŀ);
        if (result == null) result = caseAct(Ѫ�͹۲���Ŀ);
        if (result == null) result = caseInfrastructureRoot(Ѫ�͹۲���Ŀ);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case EhrPackage.Ѫ���½�_NOM:
      {
        Ѫ���½�Nom Ѫ���½�Nom = (Ѫ���½�Nom)theEObject;
        T result = caseѪ���½�Nom(Ѫ���½�Nom);
        if (result == null) result = caseSection(Ѫ���½�Nom);
        if (result == null) result = caseAct(Ѫ���½�Nom);
        if (result == null) result = caseInfrastructureRoot(Ѫ���½�Nom);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case EhrPackage.AB_OѪ�͹۲���Ŀ:
      {
        ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ = (ABOѪ�͹۲���Ŀ)theEObject;
        T result = caseABOѪ�͹۲���Ŀ(abOѪ�͹۲���Ŀ);
        if (result == null) result = caseѪ�͹۲���Ŀ(abOѪ�͹۲���Ŀ);
        if (result == null) result = caseObservation(abOѪ�͹۲���Ŀ);
        if (result == null) result = caseClinicalStatement(abOѪ�͹۲���Ŀ);
        if (result == null) result = caseAct(abOѪ�͹۲���Ŀ);
        if (result == null) result = caseInfrastructureRoot(abOѪ�͹۲���Ŀ);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      case EhrPackage.RHѪ�͹۲���Ŀ:
      {
        RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ = (RHѪ�͹۲���Ŀ)theEObject;
        T result = caseRHѪ�͹۲���Ŀ(rHѪ�͹۲���Ŀ);
        if (result == null) result = caseѪ�͹۲���Ŀ(rHѪ�͹۲���Ŀ);
        if (result == null) result = caseObservation(rHѪ�͹۲���Ŀ);
        if (result == null) result = caseClinicalStatement(rHѪ�͹۲���Ŀ);
        if (result == null) result = caseAct(rHѪ�͹۲���Ŀ);
        if (result == null) result = caseInfrastructureRoot(rHѪ�͹۲���Ŀ);
        if (result == null) result = defaultCase(theEObject);
        return result;
      }
      default: return defaultCase(theEObject);
    }
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Ѫ���½� Nar</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Ѫ���½� Nar</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseѪ���½�Nar(Ѫ���½�Nar object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Ѫ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Ѫ�͹۲���Ŀ</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseѪ�͹۲���Ŀ(Ѫ�͹۲���Ŀ object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Ѫ���½� Nom</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Ѫ���½� Nom</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseѪ���½�Nom(Ѫ���½�Nom object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>AB OѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>AB OѪ�͹۲���Ŀ</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseABOѪ�͹۲���Ŀ(ABOѪ�͹۲���Ŀ object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>RHѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>RHѪ�͹۲���Ŀ</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseRHѪ�͹۲���Ŀ(RHѪ�͹۲���Ŀ object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Infrastructure Root</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Infrastructure Root</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseInfrastructureRoot(InfrastructureRoot object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Act</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Act</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseAct(Act object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Section</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Section</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseSection(Section object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Clinical Statement</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Clinical Statement</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseClinicalStatement(ClinicalStatement object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>Observation</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>Observation</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
   * @generated
   */
  public T caseObservation(Observation object)
  {
    return null;
  }

  /**
   * Returns the result of interpreting the object as an instance of '<em>EObject</em>'.
   * <!-- begin-user-doc -->
   * This implementation returns null;
   * returning a non-null result will terminate the switch, but this is the last case anyway.
   * <!-- end-user-doc -->
   * @param object the target of the switch.
   * @return the result of interpreting the object as an instance of '<em>EObject</em>'.
   * @see #doSwitch(org.eclipse.emf.ecore.EObject)
   * @generated
   */
  public T defaultCase(EObject object)
  {
    return null;
  }

} //EhrSwitch
