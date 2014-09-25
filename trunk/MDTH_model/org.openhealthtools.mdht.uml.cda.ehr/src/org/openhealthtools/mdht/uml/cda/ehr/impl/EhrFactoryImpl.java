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
      case EhrPackage.血型章节_NAR: return create血型章节Nar();
      case EhrPackage.血型观察条目: return create血型观察条目();
      case EhrPackage.血型章节_NOM: return create血型章节Nom();
      case EhrPackage.AB_O血型观察条目: return createABO血型观察条目();
      case EhrPackage.RH血型观察条目: return createRH血型观察条目();
      default:
        throw new IllegalArgumentException("The class '" + eClass.getName() + "' is not a valid classifier");
    }
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public 血型章节Nar create血型章节Nar()
  {
    血型章节NarImpl 血型章节Nar = new 血型章节NarImpl();
    return 血型章节Nar;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public 血型观察条目 create血型观察条目()
  {
    血型观察条目Impl 血型观察条目 = new 血型观察条目Impl();
    return 血型观察条目;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public 血型章节Nom create血型章节Nom()
  {
    血型章节NomImpl 血型章节Nom = new 血型章节NomImpl();
    return 血型章节Nom;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public ABO血型观察条目 createABO血型观察条目()
  {
    ABO血型观察条目Impl abO血型观察条目 = new ABO血型观察条目Impl();
    return abO血型观察条目;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public RH血型观察条目 createRH血型观察条目()
  {
    RH血型观察条目Impl rH血型观察条目 = new RH血型观察条目Impl();
    return rH血型观察条目;
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
