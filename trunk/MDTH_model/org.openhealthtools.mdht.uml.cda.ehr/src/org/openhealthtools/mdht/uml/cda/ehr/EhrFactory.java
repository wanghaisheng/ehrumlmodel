/**
 * <copyright>
 * </copyright>
 *
 * $Id$
 */
package org.openhealthtools.mdht.uml.cda.ehr;

import org.eclipse.emf.ecore.EFactory;

/**
 * <!-- begin-user-doc -->
 * The <b>Factory</b> for the model.
 * It provides a create method for each non-abstract class of the model.
 * <!-- end-user-doc -->
 * @see org.openhealthtools.mdht.uml.cda.ehr.EhrPackage
 * @generated
 */
public interface EhrFactory extends EFactory
{
  /**
   * The singleton instance of the factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  EhrFactory eINSTANCE = org.openhealthtools.mdht.uml.cda.ehr.impl.EhrFactoryImpl.init();

  /**
   * Returns a new object of class '<em>血型章节 Nar</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>血型章节 Nar</em>'.
   * @generated
   */
  血型章节Nar create血型章节Nar();

  /**
   * Returns a new object of class '<em>血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>血型观察条目</em>'.
   * @generated
   */
  血型观察条目 create血型观察条目();

  /**
   * Returns a new object of class '<em>血型章节 Nom</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>血型章节 Nom</em>'.
   * @generated
   */
  血型章节Nom create血型章节Nom();

  /**
   * Returns a new object of class '<em>AB O血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>AB O血型观察条目</em>'.
   * @generated
   */
  ABO血型观察条目 createABO血型观察条目();

  /**
   * Returns a new object of class '<em>RH血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>RH血型观察条目</em>'.
   * @generated
   */
  RH血型观察条目 createRH血型观察条目();

  /**
   * Returns the package supported by this factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the package supported by this factory.
   * @generated
   */
  EhrPackage getEhrPackage();

} //EhrFactory
