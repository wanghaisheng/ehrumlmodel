/**
 * <copyright>
 * </copyright>
 *
 * $Id$
 */
package org.openhealthtools.mdht.uml.cda.ehr.impl;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.impl.EFactoryImpl;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

import org.openhealthtools.mdht.uml.cda.ehr.*;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Factory</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class EhrFactoryImpl extends EFactoryImpl implements EhrFactory
{
  /**
   * Creates the default factory implementation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static EhrFactory init()
  {
    try
    {
      EhrFactory theEhrFactory = (EhrFactory)EPackage.Registry.INSTANCE.getEFactory("http://www.openhealthtools.org/mdht/uml/cda/ehr"); 
      if (theEhrFactory != null)
      {
        return theEhrFactory;
      }
    }
    catch (Exception exception)
    {
      EcorePlugin.INSTANCE.log(exception);
    }
    return new EhrFactoryImpl();
  }

  /**
   * Creates an instance of the factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EhrFactoryImpl()
  {
    super();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public EObject create(EClass eClass)
  {
    switch (eClass.getClassifierID())
    {
      case EhrPackage.Ѫ���½�_NAR: return createѪ���½�Nar();
      case EhrPackage.Ѫ�͹۲���Ŀ: return createѪ�͹۲���Ŀ();
      case EhrPackage.Ѫ���½�_NOM: return createѪ���½�Nom();
      case EhrPackage.AB_OѪ�͹۲���Ŀ: return createABOѪ�͹۲���Ŀ();
      case EhrPackage.RHѪ�͹۲���Ŀ: return createRHѪ�͹۲���Ŀ();
      default:
        throw new IllegalArgumentException("The class '" + eClass.getName() + "' is not a valid classifier");
    }
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Ѫ���½�Nar createѪ���½�Nar()
  {
    Ѫ���½�NarImpl Ѫ���½�Nar = new Ѫ���½�NarImpl();
    return Ѫ���½�Nar;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Ѫ�͹۲���Ŀ createѪ�͹۲���Ŀ()
  {
    Ѫ�͹۲���ĿImpl Ѫ�͹۲���Ŀ = new Ѫ�͹۲���ĿImpl();
    return Ѫ�͹۲���Ŀ;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Ѫ���½�Nom createѪ���½�Nom()
  {
    Ѫ���½�NomImpl Ѫ���½�Nom = new Ѫ���½�NomImpl();
    return Ѫ���½�Nom;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public ABOѪ�͹۲���Ŀ createABOѪ�͹۲���Ŀ()
  {
    ABOѪ�͹۲���ĿImpl abOѪ�͹۲���Ŀ = new ABOѪ�͹۲���ĿImpl();
    return abOѪ�͹۲���Ŀ;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public RHѪ�͹۲���Ŀ createRHѪ�͹۲���Ŀ()
  {
    RHѪ�͹۲���ĿImpl rHѪ�͹۲���Ŀ = new RHѪ�͹۲���ĿImpl();
    return rHѪ�͹۲���Ŀ;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EhrPackage getEhrPackage()
  {
    return (EhrPackage)getEPackage();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @deprecated
   * @generated
   */
  @Deprecated
  public static EhrPackage getPackage()
  {
    return EhrPackage.eINSTANCE;
  }

} //EhrFactoryImpl
