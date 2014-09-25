/**
 * <copyright>
 * </copyright>
 *
 * $Id$
 */
package org.openhealthtools.mdht.uml.cda.ehr.util;

import java.util.Map;

import org.eclipse.emf.common.util.DiagnosticChain;
import org.eclipse.emf.common.util.ResourceLocator;

import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.util.EObjectValidator;

import org.openhealthtools.mdht.uml.cda.ehr.*;

import org.openhealthtools.mdht.uml.cda.util.CDAValidator;

/**
 * <!-- begin-user-doc -->
 * The <b>Validator</b> for the model.
 * <!-- end-user-doc -->
 * @see org.openhealthtools.mdht.uml.cda.ehr.EhrPackage
 * @generated
 */
public class EhrValidator extends EObjectValidator
{
  /**
   * The cached model package
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final EhrValidator INSTANCE = new EhrValidator();

  /**
   * A constant for the {@link org.eclipse.emf.common.util.Diagnostic#getSource() source} of diagnostic {@link org.eclipse.emf.common.util.Diagnostic#getCode() codes} from this package.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.eclipse.emf.common.util.Diagnostic#getSource()
   * @see org.eclipse.emf.common.util.Diagnostic#getCode()
   * @generated
   */
  public static final String DIAGNOSTIC_SOURCE = "org.openhealthtools.mdht.uml.cda.ehr";

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ���½� Nar Template Id' of 'Ѫ���½� Nar'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ���½�_NAR__VALIDATEѪ���½�_NAR_TEMPLATE_ID = 1;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ���½� Nar Code' of 'Ѫ���½� Nar'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ���½�_NAR__VALIDATEѪ���½�_NAR_CODE = 2;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ���½� Nar Text' of 'Ѫ���½� Nar'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ���½�_NAR__VALIDATEѪ���½�_NAR_TEXT = 3;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ���½� Nar Title' of 'Ѫ���½� Nar'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ���½�_NAR__VALIDATEѪ���½�_NAR_TITLE = 4;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Template Id' of 'Ѫ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_TEMPLATE_ID = 5;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Class Code' of 'Ѫ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_CLASS_CODE = 6;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Code' of 'Ѫ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_CODE = 7;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Mood Code' of 'Ѫ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_MOOD_CODE = 8;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Text' of 'Ѫ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_TEXT = 9;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Value' of 'Ѫ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_VALUE = 10;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ���½� Nom Template Id' of 'Ѫ���½� Nom'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ���½�_NOM__VALIDATEѪ���½�_NOM_TEMPLATE_ID = 11;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ���½� Nom Code' of 'Ѫ���½� Nom'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ���½�_NOM__VALIDATEѪ���½�_NOM_CODE = 12;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ���½� Nom Text' of 'Ѫ���½� Nom'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ���½�_NOM__VALIDATEѪ���½�_NOM_TEXT = 13;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ���½� Nom Title' of 'Ѫ���½� Nom'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int Ѫ���½�_NOM__VALIDATEѪ���½�_NOM_TITLE = 14;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate AB OѪ�͹۲���Ŀ Class Code' of 'AB OѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_OѪ�͹۲���Ŀ__AB_OѪ�͹۲���Ŀ_CLASS_CODE = 15;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate AB OѪ�͹۲���Ŀ Mood Code' of 'AB OѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_OѪ�͹۲���Ŀ__AB_OѪ�͹۲���Ŀ_MOOD_CODE = 16;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate AB OѪ�͹۲���Ŀ Text' of 'AB OѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_OѪ�͹۲���Ŀ__AB_OѪ�͹۲���Ŀ_TEXT = 17;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Code' of 'AB OѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_OѪ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_CODE = 18;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Value' of 'AB OѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_OѪ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_VALUE = 19;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate RHѪ�͹۲���Ŀ Class Code' of 'RHѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RHѪ�͹۲���Ŀ__RHѪ�͹۲���Ŀ_CLASS_CODE = 20;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate RHѪ�͹۲���Ŀ Mood Code' of 'RHѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RHѪ�͹۲���Ŀ__RHѪ�͹۲���Ŀ_MOOD_CODE = 21;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate RHѪ�͹۲���Ŀ Text' of 'RHѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RHѪ�͹۲���Ŀ__RHѪ�͹۲���Ŀ_TEXT = 22;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Code' of 'RHѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RHѪ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_CODE = 23;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'ValidateѪ�͹۲���Ŀ Value' of 'RHѪ�͹۲���Ŀ'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RHѪ�͹۲���Ŀ__VALIDATEѪ�͹۲���Ŀ_VALUE = 24;

  /**
   * A constant with a fixed name that can be used as the base value for additional hand written constants.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private static final int GENERATED_DIAGNOSTIC_CODE_COUNT = 24;

  /**
   * A constant with a fixed name that can be used as the base value for additional hand written constants in a derived class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected static final int DIAGNOSTIC_CODE_COUNT = GENERATED_DIAGNOSTIC_CODE_COUNT;

  /**
   * The cached base package validator.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected CDAValidator cdaValidator;

  /**
   * Creates an instance of the switch.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EhrValidator()
  {
    super();
    cdaValidator = CDAValidator.INSTANCE;
  }

  /**
   * Returns the package of this validator switch.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  protected EPackage getEPackage()
  {
    return EhrPackage.eINSTANCE;
  }

  /**
   * Calls <code>validateXXX</code> for the corresponding classifier of the model.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  protected boolean validate(int classifierID, Object value, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    switch (classifierID)
    {
      case EhrPackage.Ѫ���½�_NAR:
        return validateѪ���½�Nar((Ѫ���½�Nar)value, diagnostics, context);
      case EhrPackage.Ѫ�͹۲���Ŀ:
        return validateѪ�͹۲���Ŀ((Ѫ�͹۲���Ŀ)value, diagnostics, context);
      case EhrPackage.Ѫ���½�_NOM:
        return validateѪ���½�Nom((Ѫ���½�Nom)value, diagnostics, context);
      case EhrPackage.AB_OѪ�͹۲���Ŀ:
        return validateABOѪ�͹۲���Ŀ((ABOѪ�͹۲���Ŀ)value, diagnostics, context);
      case EhrPackage.RHѪ�͹۲���Ŀ:
        return validateRHѪ�͹۲���Ŀ((RHѪ�͹۲���Ŀ)value, diagnostics, context);
      default:
        return true;
    }
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nar(Ѫ���½�Nar Ѫ���½�Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(Ѫ���½�Nar, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= cdaValidator.validateSection_validateClassCode(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= cdaValidator.validateSection_validateMoodCode(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ���½�Nar_validateѪ���½�NarTemplateId(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ���½�Nar_validateѪ���½�NarCode(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ���½�Nar_validateѪ���½�NarText(Ѫ���½�Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ���½�Nar_validateѪ���½�NarTitle(Ѫ���½�Nar, diagnostics, context);
    return result;
  }

  /**
   * Validates the validateѪ���½�NarTemplateId constraint of '<em>Ѫ���½� Nar</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nar_validateѪ���½�NarTemplateId(Ѫ���½�Nar Ѫ���½�Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�Nar.validateѪ���½�NarTemplateId(diagnostics, context);
  }

  /**
   * Validates the validateѪ���½�NarCode constraint of '<em>Ѫ���½� Nar</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nar_validateѪ���½�NarCode(Ѫ���½�Nar Ѫ���½�Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�Nar.validateѪ���½�NarCode(diagnostics, context);
  }

  /**
   * Validates the validateѪ���½�NarText constraint of '<em>Ѫ���½� Nar</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nar_validateѪ���½�NarText(Ѫ���½�Nar Ѫ���½�Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�Nar.validateѪ���½�NarText(diagnostics, context);
  }

  /**
   * Validates the validateѪ���½�NarTitle constraint of '<em>Ѫ���½� Nar</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nar_validateѪ���½�NarTitle(Ѫ���½�Nar Ѫ���½�Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�Nar.validateѪ���½�NarTitle(diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���Ŀ(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(Ѫ�͹۲���Ŀ, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿTemplateId(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿClassCode(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿCode(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿMoodCode(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿText(Ѫ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿValue(Ѫ�͹۲���Ŀ, diagnostics, context);
    return result;
  }

  /**
   * Validates the validateѪ�͹۲���ĿTemplateId constraint of '<em>Ѫ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿTemplateId(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���Ŀ.validateѪ�͹۲���ĿTemplateId(diagnostics, context);
  }

  /**
   * Validates the validateѪ�͹۲���ĿClassCode constraint of '<em>Ѫ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿClassCode(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���Ŀ.validateѪ�͹۲���ĿClassCode(diagnostics, context);
  }

  /**
   * Validates the validateѪ�͹۲���ĿCode constraint of '<em>Ѫ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿCode(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���Ŀ.validateѪ�͹۲���ĿCode(diagnostics, context);
  }

  /**
   * Validates the validateѪ�͹۲���ĿMoodCode constraint of '<em>Ѫ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿMoodCode(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���Ŀ.validateѪ�͹۲���ĿMoodCode(diagnostics, context);
  }

  /**
   * Validates the validateѪ�͹۲���ĿText constraint of '<em>Ѫ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿText(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���Ŀ.validateѪ�͹۲���ĿText(diagnostics, context);
  }

  /**
   * Validates the validateѪ�͹۲���ĿValue constraint of '<em>Ѫ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿValue(Ѫ�͹۲���Ŀ Ѫ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ�͹۲���Ŀ.validateѪ�͹۲���ĿValue(diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nom(Ѫ���½�Nom Ѫ���½�Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(Ѫ���½�Nom, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= cdaValidator.validateSection_validateClassCode(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= cdaValidator.validateSection_validateMoodCode(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ���½�Nom_validateѪ���½�NomTemplateId(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ���½�Nom_validateѪ���½�NomCode(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ���½�Nom_validateѪ���½�NomText(Ѫ���½�Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ���½�Nom_validateѪ���½�NomTitle(Ѫ���½�Nom, diagnostics, context);
    return result;
  }

  /**
   * Validates the validateѪ���½�NomTemplateId constraint of '<em>Ѫ���½� Nom</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nom_validateѪ���½�NomTemplateId(Ѫ���½�Nom Ѫ���½�Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�Nom.validateѪ���½�NomTemplateId(diagnostics, context);
  }

  /**
   * Validates the validateѪ���½�NomCode constraint of '<em>Ѫ���½� Nom</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nom_validateѪ���½�NomCode(Ѫ���½�Nom Ѫ���½�Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�Nom.validateѪ���½�NomCode(diagnostics, context);
  }

  /**
   * Validates the validateѪ���½�NomText constraint of '<em>Ѫ���½� Nom</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nom_validateѪ���½�NomText(Ѫ���½�Nom Ѫ���½�Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�Nom.validateѪ���½�NomText(diagnostics, context);
  }

  /**
   * Validates the validateѪ���½�NomTitle constraint of '<em>Ѫ���½� Nom</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateѪ���½�Nom_validateѪ���½�NomTitle(Ѫ���½�Nom Ѫ���½�Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return Ѫ���½�Nom.validateѪ���½�NomTitle(diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABOѪ�͹۲���Ŀ(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(abOѪ�͹۲���Ŀ, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿTemplateId(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿClassCode(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateABOѪ�͹۲���Ŀ_validateѪ�͹۲���ĿCode(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿMoodCode(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿText(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateABOѪ�͹۲���Ŀ_validateѪ�͹۲���ĿValue(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateABOѪ�͹۲���Ŀ_validateABOѪ�͹۲���ĿClassCode(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateABOѪ�͹۲���Ŀ_validateABOѪ�͹۲���ĿMoodCode(abOѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateABOѪ�͹۲���Ŀ_validateABOѪ�͹۲���ĿText(abOѪ�͹۲���Ŀ, diagnostics, context);
    return result;
  }

  /**
   * Validates the validateABOѪ�͹۲���ĿClassCode constraint of '<em>AB OѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABOѪ�͹۲���Ŀ_validateABOѪ�͹۲���ĿClassCode(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abOѪ�͹۲���Ŀ.validateABOѪ�͹۲���ĿClassCode(diagnostics, context);
  }

  /**
   * Validates the validateABOѪ�͹۲���ĿMoodCode constraint of '<em>AB OѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABOѪ�͹۲���Ŀ_validateABOѪ�͹۲���ĿMoodCode(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abOѪ�͹۲���Ŀ.validateABOѪ�͹۲���ĿMoodCode(diagnostics, context);
  }

  /**
   * Validates the validateABOѪ�͹۲���ĿText constraint of '<em>AB OѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABOѪ�͹۲���Ŀ_validateABOѪ�͹۲���ĿText(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abOѪ�͹۲���Ŀ.validateABOѪ�͹۲���ĿText(diagnostics, context);
  }

  /**
   * Validates the validateѪ�͹۲���ĿCode constraint of '<em>AB OѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABOѪ�͹۲���Ŀ_validateѪ�͹۲���ĿCode(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abOѪ�͹۲���Ŀ.validateѪ�͹۲���ĿCode(diagnostics, context);
  }

  /**
   * Validates the validateѪ�͹۲���ĿValue constraint of '<em>AB OѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABOѪ�͹۲���Ŀ_validateѪ�͹۲���ĿValue(ABOѪ�͹۲���Ŀ abOѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abOѪ�͹۲���Ŀ.validateѪ�͹۲���ĿValue(diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRHѪ�͹۲���Ŀ(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(rHѪ�͹۲���Ŀ, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿTemplateId(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿClassCode(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateRHѪ�͹۲���Ŀ_validateѪ�͹۲���ĿCode(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿMoodCode(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateѪ�͹۲���Ŀ_validateѪ�͹۲���ĿText(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateRHѪ�͹۲���Ŀ_validateѪ�͹۲���ĿValue(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateRHѪ�͹۲���Ŀ_validateRHѪ�͹۲���ĿClassCode(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateRHѪ�͹۲���Ŀ_validateRHѪ�͹۲���ĿMoodCode(rHѪ�͹۲���Ŀ, diagnostics, context);
    if (result || diagnostics != null) result &= validateRHѪ�͹۲���Ŀ_validateRHѪ�͹۲���ĿText(rHѪ�͹۲���Ŀ, diagnostics, context);
    return result;
  }

  /**
   * Validates the validateRHѪ�͹۲���ĿClassCode constraint of '<em>RHѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRHѪ�͹۲���Ŀ_validateRHѪ�͹۲���ĿClassCode(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rHѪ�͹۲���Ŀ.validateRHѪ�͹۲���ĿClassCode(diagnostics, context);
  }

  /**
   * Validates the validateRHѪ�͹۲���ĿMoodCode constraint of '<em>RHѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRHѪ�͹۲���Ŀ_validateRHѪ�͹۲���ĿMoodCode(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rHѪ�͹۲���Ŀ.validateRHѪ�͹۲���ĿMoodCode(diagnostics, context);
  }

  /**
   * Validates the validateRHѪ�͹۲���ĿText constraint of '<em>RHѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRHѪ�͹۲���Ŀ_validateRHѪ�͹۲���ĿText(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rHѪ�͹۲���Ŀ.validateRHѪ�͹۲���ĿText(diagnostics, context);
  }

  /**
   * Validates the validateѪ�͹۲���ĿCode constraint of '<em>RHѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRHѪ�͹۲���Ŀ_validateѪ�͹۲���ĿCode(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rHѪ�͹۲���Ŀ.validateѪ�͹۲���ĿCode(diagnostics, context);
  }

  /**
   * Validates the validateѪ�͹۲���ĿValue constraint of '<em>RHѪ�͹۲���Ŀ</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRHѪ�͹۲���Ŀ_validateѪ�͹۲���ĿValue(RHѪ�͹۲���Ŀ rHѪ�͹۲���Ŀ, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rHѪ�͹۲���Ŀ.validateѪ�͹۲���ĿValue(diagnostics, context);
  }

  /**
   * Returns the resource locator that will be used to fetch messages for this validator's diagnostics.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public ResourceLocator getResourceLocator()
  {
    return EhrPlugin.INSTANCE;
  }

} //EhrValidator
