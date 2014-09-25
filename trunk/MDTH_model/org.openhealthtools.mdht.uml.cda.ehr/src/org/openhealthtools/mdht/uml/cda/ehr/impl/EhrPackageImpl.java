/**
 * <copyright>
 * </copyright>
 *
 * $Id$
 */
package org.openhealthtools.mdht.uml.cda.ehr.impl;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EGenericType;
import org.eclipse.emf.ecore.EOperation;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EValidator;

import org.eclipse.emf.ecore.impl.EPackageImpl;

import org.openhealthtools.mdht.uml.cda.CDAPackage;

import org.openhealthtools.mdht.uml.cda.ehr.ABO血型观察条目;
import org.openhealthtools.mdht.uml.cda.ehr.EhrFactory;
import org.openhealthtools.mdht.uml.cda.ehr.EhrPackage;
import org.openhealthtools.mdht.uml.cda.ehr.ehrmodel;

import org.openhealthtools.mdht.uml.cda.ehr.util.EhrValidator;
import org.openhealthtools.mdht.uml.cda.ehr.血型章节Nar;
import org.openhealthtools.mdht.uml.cda.ehr.血型章节Nom;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Package</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class EhrPackageImpl extends EPackageImpl implements EhrPackage
{
  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass 血型章节NarEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass 血型观察条目EClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass 血型章节NomEClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass abO血型观察条目EClass = null;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private EClass rH血型观察条目EClass = null;

  /**
   * Creates an instance of the model <b>Package</b>, registered with
   * {@link org.eclipse.emf.ecore.EPackage.Registry EPackage.Registry} by the package
   * package URI value.
   * <p>Note: the correct way to create the package is via the static
   * factory method {@link #init init()}, which also performs
   * initialization of the package, or returns the registered package,
   * if one already exists.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.eclipse.emf.ecore.EPackage.Registry
   * @see org.openhealthtools.mdht.uml.cda.ehr.EhrPackage#eNS_URI
   * @see #init()
   * @generated
   */
  private EhrPackageImpl()
  {
    super(eNS_URI, EhrFactory.eINSTANCE);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private static boolean isInited = false;

  /**
   * Creates, registers, and initializes the <b>Package</b> for this model, and for any others upon which it depends.
   * 
   * <p>This method is used to initialize {@link EhrPackage#eINSTANCE} when that field is accessed.
   * Clients should not invoke it directly. Instead, they should simply access that field to obtain the package.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #eNS_URI
   * @see #createPackageContents()
   * @see #initializePackageContents()
   * @generated
   */
  public static EhrPackage init()
  {
    if (isInited) return (EhrPackage)EPackage.Registry.INSTANCE.getEPackage(EhrPackage.eNS_URI);

    // Obtain or create and register package
    EhrPackageImpl theEhrPackage = (EhrPackageImpl)(EPackage.Registry.INSTANCE.get(eNS_URI) instanceof EhrPackageImpl ? EPackage.Registry.INSTANCE.get(eNS_URI) : new EhrPackageImpl());

    isInited = true;

    // Initialize simple dependencies
    CDAPackage.eINSTANCE.eClass();

    // Create package meta-data objects
    theEhrPackage.createPackageContents();

    // Initialize created meta-data
    theEhrPackage.initializePackageContents();

    // Register package validator
    EValidator.Registry.INSTANCE.put
      (theEhrPackage, 
       new EValidator.Descriptor()
       {
         public EValidator getEValidator()
         {
           return EhrValidator.INSTANCE;
         }
       });

    // Mark meta-data to indicate it can't be changed
    theEhrPackage.freeze();

  
    // Update the registry and return the package
    EPackage.Registry.INSTANCE.put(EhrPackage.eNS_URI, theEhrPackage);
    return theEhrPackage;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass get血型章节Nar()
  {
    return 血型章节NarEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass get血型观察条目()
  {
    return 血型观察条目EClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass get血型章节Nom()
  {
    return 血型章节NomEClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getABO血型观察条目()
  {
    return abO血型观察条目EClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EClass getRH血型观察条目()
  {
    return rH血型观察条目EClass;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EhrFactory getEhrFactory()
  {
    return (EhrFactory)getEFactoryInstance();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private boolean isCreated = false;

  /**
   * Creates the meta-model objects for the package.  This method is
   * guarded to have no affect on any invocation but its first.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void createPackageContents()
  {
    if (isCreated) return;
    isCreated = true;

    // Create classes and their features
    血型章节NarEClass = createEClass(血型章节_NAR);

    血型观察条目EClass = createEClass(血型观察条目);

    血型章节NomEClass = createEClass(血型章节_NOM);

    abO血型观察条目EClass = createEClass(AB_O血型观察条目);

    rH血型观察条目EClass = createEClass(RH血型观察条目);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  private boolean isInitialized = false;

  /**
   * Complete the initialization of the package and its meta-model.  This
   * method is guarded to have no affect on any invocation but its first.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public void initializePackageContents()
  {
    if (isInitialized) return;
    isInitialized = true;

    // Initialize package
    setName(eNAME);
    setNsPrefix(eNS_PREFIX);
    setNsURI(eNS_URI);

    // Obtain other dependent packages
    CDAPackage theCDAPackage = (CDAPackage)EPackage.Registry.INSTANCE.getEPackage(CDAPackage.eNS_URI);

    // Create type parameters

    // Set bounds for type parameters

    // Add supertypes to classes
    血型章节NarEClass.getESuperTypes().add(theCDAPackage.getSection());
    血型观察条目EClass.getESuperTypes().add(theCDAPackage.getObservation());
    血型章节NomEClass.getESuperTypes().add(theCDAPackage.getSection());
    abO血型观察条目EClass.getESuperTypes().add(this.get血型观察条目());
    rH血型观察条目EClass.getESuperTypes().add(this.get血型观察条目());

    // Initialize classes and features; add operations and parameters
    initEClass(血型章节NarEClass, 血型章节Nar.class, "血型章节Nar", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

    EOperation op = addEOperation(血型章节NarEClass, ecorePackage.getEBoolean(), "validate血型章节NarTemplateId", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    EGenericType g1 = createEGenericType(ecorePackage.getEMap());
    EGenericType g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型章节NarEClass, ecorePackage.getEBoolean(), "validate血型章节NarCode", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型章节NarEClass, ecorePackage.getEBoolean(), "validate血型章节NarText", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型章节NarEClass, ecorePackage.getEBoolean(), "validate血型章节NarTitle", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    initEClass(血型观察条目EClass, org.openhealthtools.mdht.uml.cda.ehr.血型观察条目.class, "血型观察条目", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

    op = addEOperation(血型观察条目EClass, ecorePackage.getEBoolean(), "validate血型观察条目TemplateId", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型观察条目EClass, ecorePackage.getEBoolean(), "validate血型观察条目ClassCode", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型观察条目EClass, ecorePackage.getEBoolean(), "validate血型观察条目Code", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型观察条目EClass, ecorePackage.getEBoolean(), "validate血型观察条目MoodCode", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型观察条目EClass, ecorePackage.getEBoolean(), "validate血型观察条目Text", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型观察条目EClass, ecorePackage.getEBoolean(), "validate血型观察条目Value", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    initEClass(血型章节NomEClass, 血型章节Nom.class, "血型章节Nom", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

    op = addEOperation(血型章节NomEClass, ecorePackage.getEBoolean(), "validate血型章节NomTemplateId", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型章节NomEClass, ecorePackage.getEBoolean(), "validate血型章节NomCode", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型章节NomEClass, ecorePackage.getEBoolean(), "validate血型章节NomText", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(血型章节NomEClass, ecorePackage.getEBoolean(), "validate血型章节NomTitle", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    initEClass(abO血型观察条目EClass, ABO血型观察条目.class, "ABO血型观察条目", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

    op = addEOperation(abO血型观察条目EClass, ecorePackage.getEBoolean(), "validateABO血型观察条目ClassCode", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(abO血型观察条目EClass, ecorePackage.getEBoolean(), "validateABO血型观察条目MoodCode", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(abO血型观察条目EClass, ecorePackage.getEBoolean(), "validateABO血型观察条目Text", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    initEClass(rH血型观察条目EClass, org.openhealthtools.mdht.uml.cda.ehr.RH血型观察条目.class, "RH血型观察条目", !IS_ABSTRACT, !IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);

    op = addEOperation(rH血型观察条目EClass, ecorePackage.getEBoolean(), "validateRH血型观察条目ClassCode", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(rH血型观察条目EClass, ecorePackage.getEBoolean(), "validateRH血型观察条目MoodCode", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    op = addEOperation(rH血型观察条目EClass, ecorePackage.getEBoolean(), "validateRH血型观察条目Text", 0, 1, IS_UNIQUE, IS_ORDERED);
    addEParameter(op, ecorePackage.getEDiagnosticChain(), "diagnostics", 0, 1, IS_UNIQUE, IS_ORDERED);
    g1 = createEGenericType(ecorePackage.getEMap());
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    g2 = createEGenericType(ecorePackage.getEJavaObject());
    g1.getETypeArguments().add(g2);
    addEParameter(op, g1, "context", 0, 1, IS_UNIQUE, IS_ORDERED);

    // Create resource
    createResource(eNS_URI);

    // Create annotations
    // http://www.openhealthtools.org/mdht/uml/cda/annotation
    createAnnotationAnnotations();
    // duplicates
    createDuplicatesAnnotations();
  }

  /**
   * Initializes the annotations for <b>http://www.openhealthtools.org/mdht/uml/cda/annotation</b>.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected void createAnnotationAnnotations()
  {
    String source = "http://www.openhealthtools.org/mdht/uml/cda/annotation";		
    addAnnotation
      (血型章节NarEClass, 
       source, 
       new String[] 
       {
       "title.mixed", "\u8840\u578b",
       "code.codeSystem", "2.16.840.1.113883.6.1",
       "code.displayName", "ABO+RH\u8840\u578b\u4ee3\u7801",
       "templateId.root", "Section_template_Root_OID.1",
       "constraints.validation.error", "\u8840\u578b\u7ae0\u8282NarTemplateId \u8840\u578b\u7ae0\u8282NarCode \u8840\u578b\u7ae0\u8282NarText \u8840\u578b\u7ae0\u8282NarTitle",
       "code.codeSystemName", "LOINC",
       "code.code", "882-1"
       });																		
    addAnnotation
      (血型观察条目EClass, 
       source, 
       new String[] 
       {
       "statusCode.code", "completed",
       "value.codeSystemName", "\u536b\u751f\u90e8\u536b\u751f\u4fe1\u606f\u6570\u636e\u5143\u503c\u57df\u4ee3\u7801",
       "code.codeSystem", "EHRDATASET_OID",
       "templateId.root", "Entry_template_Root_OID.1",
       "constraints.validation.error", "\u8840\u578b\u89c2\u5bdf\u6761\u76eeTemplateId \u8840\u578b\u89c2\u5bdf\u6761\u76eeClassCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeMoodCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeValue",
       "code.codeSystemName", "\u57ce\u4e61\u5c45\u6c11\u5065\u5eb7\u6863\u6848\u57fa\u672c\u6570\u636e\u96c6",
       "classCode", "OBS",
       "constraints.validation.warning", "\u8840\u578b\u89c2\u5bdf\u6761\u76eeText",
       "moodCode", "EVN",
       "value.codeSystem", "EHRVALUESET_OID"
       });																										
    addAnnotation
      (血型章节NomEClass, 
       source, 
       new String[] 
       {
       "title.mixed", "\u8840\u578b",
       "code.codeSystem", "2.16.840.1.113883.6.1",
       "code.displayName", "ABO+RH\u8840\u578b\u4ee3\u7801",
       "templateId.root", "Section_template_Root_OID.1.1",
       "constraints.validation.error", "\u8840\u578b\u7ae0\u8282NomTemplateId \u8840\u578b\u7ae0\u8282NomCode \u8840\u578b\u7ae0\u8282NomText \u8840\u578b\u7ae0\u8282NomTitle",
       "code.codeSystemName", "LOINC",
       "code.code", "882-1"
       });																		
    addAnnotation
      (abO血型观察条目EClass, 
       source, 
       new String[] 
       {
       "statusCode.code", "completed",
       "value.codeSystemName", "\u536b\u751f\u90e8\u536b\u751f\u4fe1\u606f\u6570\u636e\u5143\u503c\u57df\u4ee3\u7801",
       "code.codeSystem", "EHRDATASET_OID",
       "code.displayName", "ABO\u8840\u578b\u4ee3\u7801",
       "constraints.validation.error", "ABO\u8840\u578b\u89c2\u5bdf\u6761\u76eeClassCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeCode ABO\u8840\u578b\u89c2\u5bdf\u6761\u76eeMoodCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeValue",
       "code.codeSystemName", "\u57ce\u4e61\u5c45\u6c11\u5065\u5eb7\u6863\u6848\u57fa\u672c\u6570\u636e\u96c6",
       "text.mixed", "ABO\u8840\u578b\u4ee3\u7801",
       "constraints.validation.warning", "ABO\u8840\u578b\u89c2\u5bdf\u6761\u76eeText",
       "classCode", "OBS",
       "code.code", "HDSD00.01.013",
       "moodCode", "EVN",
       "value.codeSystem", "EHRVALUESET_OID"
       });															
    addAnnotation
      (rH血型观察条目EClass, 
       source, 
       new String[] 
       {
       "statusCode.code", "completed",
       "value.codeSystemName", "\u536b\u751f\u90e8\u536b\u751f\u4fe1\u606f\u6570\u636e\u5143\u503c\u57df\u4ee3\u7801",
       "code.codeSystem", "EHRDATASET_OID",
       "code.displayName", "Rh\u8840\u578b\u4ee3\u7801",
       "constraints.validation.error", "RH\u8840\u578b\u89c2\u5bdf\u6761\u76eeClassCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeCode RH\u8840\u578b\u89c2\u5bdf\u6761\u76eeMoodCode \u8840\u578b\u89c2\u5bdf\u6761\u76eeValue",
       "code.codeSystemName", "\u57ce\u4e61\u5c45\u6c11\u5065\u5eb7\u6863\u6848\u57fa\u672c\u6570\u636e\u96c6",
       "text.mixed", "Rh\u8840\u578b\u4ee3\u7801",
       "constraints.validation.warning", "RH\u8840\u578b\u89c2\u5bdf\u6761\u76eeText",
       "classCode", "OBS",
       "code.code", "HDSD00.01.014",
       "moodCode", "EVN",
       "value.codeSystem", "EHRVALUESET_OID"
       });													
  }

  /**
   * Initializes the annotations for <b>duplicates</b>.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected void createDuplicatesAnnotations()
  {
    String source = "duplicates";																																																														
    addAnnotation
      (abO血型观察条目EClass, 
       source, 
       new String[] 
       {
       });															
    addAnnotation
      (rH血型观察条目EClass, 
       source, 
       new String[] 
       {
       });												
  }

} //EhrPackageImpl
