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
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型章节 Nar Template Id' of '血型章节 Nar'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型章节_NAR__VALIDATE血型章节_NAR_TEMPLATE_ID = 1;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型章节 Nar Code' of '血型章节 Nar'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型章节_NAR__VALIDATE血型章节_NAR_CODE = 2;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型章节 Nar Text' of '血型章节 Nar'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型章节_NAR__VALIDATE血型章节_NAR_TEXT = 3;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型章节 Nar Title' of '血型章节 Nar'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型章节_NAR__VALIDATE血型章节_NAR_TITLE = 4;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Template Id' of '血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型观察条目__VALIDATE血型观察条目_TEMPLATE_ID = 5;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Class Code' of '血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型观察条目__VALIDATE血型观察条目_CLASS_CODE = 6;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Code' of '血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型观察条目__VALIDATE血型观察条目_CODE = 7;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Mood Code' of '血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型观察条目__VALIDATE血型观察条目_MOOD_CODE = 8;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Text' of '血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型观察条目__VALIDATE血型观察条目_TEXT = 9;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Value' of '血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型观察条目__VALIDATE血型观察条目_VALUE = 10;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型章节 Nom Template Id' of '血型章节 Nom'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型章节_NOM__VALIDATE血型章节_NOM_TEMPLATE_ID = 11;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型章节 Nom Code' of '血型章节 Nom'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型章节_NOM__VALIDATE血型章节_NOM_CODE = 12;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型章节 Nom Text' of '血型章节 Nom'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型章节_NOM__VALIDATE血型章节_NOM_TEXT = 13;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型章节 Nom Title' of '血型章节 Nom'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int 血型章节_NOM__VALIDATE血型章节_NOM_TITLE = 14;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate AB O血型观察条目 Class Code' of 'AB O血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_O血型观察条目__AB_O血型观察条目_CLASS_CODE = 15;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate AB O血型观察条目 Mood Code' of 'AB O血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_O血型观察条目__AB_O血型观察条目_MOOD_CODE = 16;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate AB O血型观察条目 Text' of 'AB O血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_O血型观察条目__AB_O血型观察条目_TEXT = 17;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Code' of 'AB O血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_O血型观察条目__VALIDATE血型观察条目_CODE = 18;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Value' of 'AB O血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int AB_O血型观察条目__VALIDATE血型观察条目_VALUE = 19;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate RH血型观察条目 Class Code' of 'RH血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RH血型观察条目__RH血型观察条目_CLASS_CODE = 20;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate RH血型观察条目 Mood Code' of 'RH血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RH血型观察条目__RH血型观察条目_MOOD_CODE = 21;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate RH血型观察条目 Text' of 'RH血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RH血型观察条目__RH血型观察条目_TEXT = 22;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Code' of 'RH血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RH血型观察条目__VALIDATE血型观察条目_CODE = 23;

  /**
   * The {@link org.eclipse.emf.common.util.Diagnostic#getCode() code} for constraint 'Validate血型观察条目 Value' of 'RH血型观察条目'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static final int RH血型观察条目__VALIDATE血型观察条目_VALUE = 24;

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
      case EhrPackage.血型章节_NAR:
        return validate血型章节Nar((血型章节Nar)value, diagnostics, context);
      case EhrPackage.血型观察条目:
        return validate血型观察条目((血型观察条目)value, diagnostics, context);
      case EhrPackage.血型章节_NOM:
        return validate血型章节Nom((血型章节Nom)value, diagnostics, context);
      case EhrPackage.AB_O血型观察条目:
        return validateABO血型观察条目((ABO血型观察条目)value, diagnostics, context);
      case EhrPackage.RH血型观察条目:
        return validateRH血型观察条目((RH血型观察条目)value, diagnostics, context);
      default:
        return true;
    }
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nar(血型章节Nar 血型章节Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(血型章节Nar, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= cdaValidator.validateSection_validateClassCode(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= cdaValidator.validateSection_validateMoodCode(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型章节Nar_validate血型章节NarTemplateId(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型章节Nar_validate血型章节NarCode(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型章节Nar_validate血型章节NarText(血型章节Nar, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型章节Nar_validate血型章节NarTitle(血型章节Nar, diagnostics, context);
    return result;
  }

  /**
   * Validates the validate血型章节NarTemplateId constraint of '<em>血型章节 Nar</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nar_validate血型章节NarTemplateId(血型章节Nar 血型章节Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节Nar.validate血型章节NarTemplateId(diagnostics, context);
  }

  /**
   * Validates the validate血型章节NarCode constraint of '<em>血型章节 Nar</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nar_validate血型章节NarCode(血型章节Nar 血型章节Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节Nar.validate血型章节NarCode(diagnostics, context);
  }

  /**
   * Validates the validate血型章节NarText constraint of '<em>血型章节 Nar</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nar_validate血型章节NarText(血型章节Nar 血型章节Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节Nar.validate血型章节NarText(diagnostics, context);
  }

  /**
   * Validates the validate血型章节NarTitle constraint of '<em>血型章节 Nar</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nar_validate血型章节NarTitle(血型章节Nar 血型章节Nar, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节Nar.validate血型章节NarTitle(diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目(血型观察条目 血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(血型观察条目, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目TemplateId(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目ClassCode(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目Code(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目MoodCode(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目Text(血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目Value(血型观察条目, diagnostics, context);
    return result;
  }

  /**
   * Validates the validate血型观察条目TemplateId constraint of '<em>血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目_validate血型观察条目TemplateId(血型观察条目 血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目.validate血型观察条目TemplateId(diagnostics, context);
  }

  /**
   * Validates the validate血型观察条目ClassCode constraint of '<em>血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目_validate血型观察条目ClassCode(血型观察条目 血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目.validate血型观察条目ClassCode(diagnostics, context);
  }

  /**
   * Validates the validate血型观察条目Code constraint of '<em>血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目_validate血型观察条目Code(血型观察条目 血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目.validate血型观察条目Code(diagnostics, context);
  }

  /**
   * Validates the validate血型观察条目MoodCode constraint of '<em>血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目_validate血型观察条目MoodCode(血型观察条目 血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目.validate血型观察条目MoodCode(diagnostics, context);
  }

  /**
   * Validates the validate血型观察条目Text constraint of '<em>血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目_validate血型观察条目Text(血型观察条目 血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目.validate血型观察条目Text(diagnostics, context);
  }

  /**
   * Validates the validate血型观察条目Value constraint of '<em>血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型观察条目_validate血型观察条目Value(血型观察条目 血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型观察条目.validate血型观察条目Value(diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nom(血型章节Nom 血型章节Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(血型章节Nom, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= cdaValidator.validateSection_validateClassCode(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= cdaValidator.validateSection_validateMoodCode(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型章节Nom_validate血型章节NomTemplateId(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型章节Nom_validate血型章节NomCode(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型章节Nom_validate血型章节NomText(血型章节Nom, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型章节Nom_validate血型章节NomTitle(血型章节Nom, diagnostics, context);
    return result;
  }

  /**
   * Validates the validate血型章节NomTemplateId constraint of '<em>血型章节 Nom</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nom_validate血型章节NomTemplateId(血型章节Nom 血型章节Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节Nom.validate血型章节NomTemplateId(diagnostics, context);
  }

  /**
   * Validates the validate血型章节NomCode constraint of '<em>血型章节 Nom</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nom_validate血型章节NomCode(血型章节Nom 血型章节Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节Nom.validate血型章节NomCode(diagnostics, context);
  }

  /**
   * Validates the validate血型章节NomText constraint of '<em>血型章节 Nom</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nom_validate血型章节NomText(血型章节Nom 血型章节Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节Nom.validate血型章节NomText(diagnostics, context);
  }

  /**
   * Validates the validate血型章节NomTitle constraint of '<em>血型章节 Nom</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validate血型章节Nom_validate血型章节NomTitle(血型章节Nom 血型章节Nom, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return 血型章节Nom.validate血型章节NomTitle(diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABO血型观察条目(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(abO血型观察条目, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目TemplateId(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目ClassCode(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateABO血型观察条目_validate血型观察条目Code(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目MoodCode(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目Text(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateABO血型观察条目_validate血型观察条目Value(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateABO血型观察条目_validateABO血型观察条目ClassCode(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateABO血型观察条目_validateABO血型观察条目MoodCode(abO血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateABO血型观察条目_validateABO血型观察条目Text(abO血型观察条目, diagnostics, context);
    return result;
  }

  /**
   * Validates the validateABO血型观察条目ClassCode constraint of '<em>AB O血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABO血型观察条目_validateABO血型观察条目ClassCode(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abO血型观察条目.validateABO血型观察条目ClassCode(diagnostics, context);
  }

  /**
   * Validates the validateABO血型观察条目MoodCode constraint of '<em>AB O血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABO血型观察条目_validateABO血型观察条目MoodCode(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abO血型观察条目.validateABO血型观察条目MoodCode(diagnostics, context);
  }

  /**
   * Validates the validateABO血型观察条目Text constraint of '<em>AB O血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABO血型观察条目_validateABO血型观察条目Text(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abO血型观察条目.validateABO血型观察条目Text(diagnostics, context);
  }

  /**
   * Validates the validate血型观察条目Code constraint of '<em>AB O血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABO血型观察条目_validate血型观察条目Code(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abO血型观察条目.validate血型观察条目Code(diagnostics, context);
  }

  /**
   * Validates the validate血型观察条目Value constraint of '<em>AB O血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateABO血型观察条目_validate血型观察条目Value(ABO血型观察条目 abO血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return abO血型观察条目.validate血型观察条目Value(diagnostics, context);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRH血型观察条目(RH血型观察条目 rH血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    if (!validate_NoCircularContainment(rH血型观察条目, diagnostics, context)) return false;
    boolean result = validate_EveryMultiplicityConforms(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryDataValueConforms(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryReferenceIsContained(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryProxyResolves(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_UniqueID(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryKeyUnique(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate_EveryMapEntryUnique(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目TemplateId(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目ClassCode(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateRH血型观察条目_validate血型观察条目Code(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目MoodCode(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validate血型观察条目_validate血型观察条目Text(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateRH血型观察条目_validate血型观察条目Value(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateRH血型观察条目_validateRH血型观察条目ClassCode(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateRH血型观察条目_validateRH血型观察条目MoodCode(rH血型观察条目, diagnostics, context);
    if (result || diagnostics != null) result &= validateRH血型观察条目_validateRH血型观察条目Text(rH血型观察条目, diagnostics, context);
    return result;
  }

  /**
   * Validates the validateRH血型观察条目ClassCode constraint of '<em>RH血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRH血型观察条目_validateRH血型观察条目ClassCode(RH血型观察条目 rH血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rH血型观察条目.validateRH血型观察条目ClassCode(diagnostics, context);
  }

  /**
   * Validates the validateRH血型观察条目MoodCode constraint of '<em>RH血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRH血型观察条目_validateRH血型观察条目MoodCode(RH血型观察条目 rH血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rH血型观察条目.validateRH血型观察条目MoodCode(diagnostics, context);
  }

  /**
   * Validates the validateRH血型观察条目Text constraint of '<em>RH血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRH血型观察条目_validateRH血型观察条目Text(RH血型观察条目 rH血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rH血型观察条目.validateRH血型观察条目Text(diagnostics, context);
  }

  /**
   * Validates the validate血型观察条目Code constraint of '<em>RH血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRH血型观察条目_validate血型观察条目Code(RH血型观察条目 rH血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rH血型观察条目.validate血型观察条目Code(diagnostics, context);
  }

  /**
   * Validates the validate血型观察条目Value constraint of '<em>RH血型观察条目</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public boolean validateRH血型观察条目_validate血型观察条目Value(RH血型观察条目 rH血型观察条目, DiagnosticChain diagnostics, Map<Object, Object> context)
  {
    return rH血型观察条目.validate血型观察条目Value(diagnostics, context);
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
