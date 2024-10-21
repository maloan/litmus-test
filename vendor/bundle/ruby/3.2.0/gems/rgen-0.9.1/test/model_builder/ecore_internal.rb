ePackage "ECore", :eSuperPackage => "" do
  eClass "EObject", :abstract => true, :instanceClassName => "RGen::ECore::EObject"
  eClass "EModelElement", :abstract => true, :instanceClassName => "RGen::ECore::EModelElement" do
    eReference "eAnnotations", :containment => true, :resolveProxies => false, :eOpposite => "EAnnotation.eModelElement", :upperBound => -1, :eType => "EAnnotation"
  end
  eClass "EAnnotation", :eSuperTypes => ["EModelElement", "EObject"], :instanceClassName => "RGen::ECore::EAnnotation" do
    eAttribute "source", :eType => ""
    eReference "eModelElement", :eOpposite => "EModelElement.eAnnotations", :eType => "EModelElement"
    eReference "details", :containment => true, :resolveProxies => false, :upperBound => -1, :eType => "EStringToStringMapEntry"
    eReference "contents", :containment => true, :resolveProxies => false, :upperBound => -1, :eType => "EObject"
    eReference "references", :upperBound => -1, :eType => "EObject"
  end
  eClass "ENamedElement", :abstract => true, :eSuperTypes => ["EModelElement"], :instanceClassName => "RGen::ECore::ENamedElement" do
    eAttribute "name", :lowerBound => 1, :eType => ""
  end
  eClass "ETypedElement", :abstract => true, :eSuperTypes => ["ENamedElement"], :instanceClassName => "RGen::ECore::ETypedElement" do
    eAttribute "lowerBound", :defaultValueLiteral => "0", :eType => ""
    eAttribute "ordered", :defaultValueLiteral => "true", :eType => ""
    eAttribute "unique", :defaultValueLiteral => "true", :eType => ""
    eAttribute "upperBound", :defaultValueLiteral => "1", :eType => ""
    eAttribute "many", :changeable => false, :derived => true, :transient => true, :volatile => true, :eType => ""
    eAttribute "required", :changeable => false, :derived => true, :transient => true, :volatile => true, :eType => ""
    eReference "eType", :eType => "EClassifier"
  end
  eClass "EStructuralFeature", :abstract => true, :eSuperTypes => ["ETypedElement"], :instanceClassName => "RGen::ECore::EStructuralFeature" do
    eAttribute "changeable", :defaultValueLiteral => "true", :eType => ""
    eAttribute "defaultValue", :changeable => false, :derived => true, :transient => true, :volatile => true, :eType => ""
    eAttribute "defaultValueLiteral", :eType => ""
    eAttribute "derived", :defaultValueLiteral => "false", :eType => ""
    eAttribute "transient", :defaultValueLiteral => "false", :eType => ""
    eAttribute "unsettable", :defaultValueLiteral => "false", :eType => ""
    eAttribute "volatile", :defaultValueLiteral => "false", :eType => ""
    eReference "eContainingClass", :eOpposite => "EClass.eStructuralFeatures", :eType => "EClass"
  end
  eClass "EAttribute", :eSuperTypes => ["EStructuralFeature"], :instanceClassName => "RGen::ECore::EAttribute" do
    eAttribute "iD", :defaultValueLiteral => "false", :eType => ""
    eReference "eAttributeType", :changeable => false, :derived => true, :transient => true, :volatile => true, :lowerBound => 1, :eType => "EDataType"
  end
  eClass "EClassifier", :abstract => true, :eSuperTypes => ["ENamedElement"], :instanceClassName => "RGen::ECore::EClassifier" do
    eAttribute "defaultValue", :changeable => false, :derived => true, :transient => true, :volatile => true, :eType => ""
    eAttribute "instanceClass", :changeable => false, :derived => true, :transient => true, :volatile => true, :eType => ""
    eAttribute "instanceClassName", :eType => ""
    eReference "ePackage", :eOpposite => "EPackage.eClassifiers", :eType => "EPackage"
  end
  eClass "EDataType", :eSuperTypes => ["EClassifier"], :instanceClassName => "RGen::ECore::EDataType" do
    eAttribute "serializable", :eType => ""
  end
  eClass "EGenericType", :eSuperTypes => ["EDataType"], :instanceClassName => "RGen::ECore::EGenericType" do
    eReference "eClassifier", :eType => "EDataType"
    eReference "eParameter", :eOpposite => "EParameter.eGenericType", :eType => "EParameter"
    eReference "eTypeArguments", :containment => true, :eOpposite => "ETypeArgument.eGenericType", :upperBound => -1, :eType => "ETypeArgument"
  end
  eClass "ETypeArgument", :eSuperTypes => ["EModelElement"], :instanceClassName => "RGen::ECore::ETypeArgument" do
    eReference "eClassifier", :eType => "EDataType"
    eReference "eGenericType", :eOpposite => "EGenericType.eTypeArguments", :eType => "EGenericType"
  end
  eClass "EEnum", :eSuperTypes => ["EDataType"], :instanceClassName => "RGen::ECore::EEnum" do
    eReference "eLiterals", :containment => true, :resolveProxies => false, :eOpposite => "EEnumLiteral.eEnum", :upperBound => -1, :eType => "EEnumLiteral"
  end
  eClass "EEnumLiteral", :eSuperTypes => ["ENamedElement"], :instanceClassName => "RGen::ECore::EEnumLiteral" do
    eAttribute "literal", :eType => ""
    eAttribute "value", :eType => ""
    eReference "eEnum", :eOpposite => "EEnum.eLiterals", :eType => "EEnum"
  end
  eClass "EFactory", :eSuperTypes => ["EModelElement"], :instanceClassName => "RGen::ECore::EFactory" do
    eReference "ePackage", :resolveProxies => false, :eOpposite => "EPackage.eFactoryInstance", :transient => true, :lowerBound => 1, :eType => "EPackage"
  end
  eClass "EOperation", :eSuperTypes => ["ETypedElement"], :instanceClassName => "RGen::ECore::EOperation" do
    eReference "eContainingClass", :eOpposite => "EClass.eOperations", :eType => "EClass"
    eReference "eParameters", :containment => true, :resolveProxies => false, :eOpposite => "EParameter.eOperation", :upperBound => -1, :eType => "EParameter"
    eReference "eExceptions", :upperBound => -1, :eType => "EClassifier"
  end
  eClass "EPackage", :eSuperTypes => ["ENamedElement"], :instanceClassName => "RGen::ECore::EPackage" do
    eAttribute "nsPrefix", :eType => ""
    eAttribute "nsURI", :eType => ""
    eReference "eClassifiers", :containment => true, :eOpposite => "EClassifier.ePackage", :upperBound => -1, :eType => "EClassifier"
    eReference "eSubpackages", :containment => true, :eOpposite => "eSuperPackage", :upperBound => -1, :eType => "EPackage"
    eReference "eSuperPackage", :eOpposite => "eSubpackages", :eType => "EPackage"
    eReference "eFactoryInstance", :eOpposite => "EFactory.ePackage", :eType => "EFactory"
  end
  eClass "EParameter", :eSuperTypes => ["ETypedElement"], :instanceClassName => "RGen::ECore::EParameter" do
    eReference "eOperation", :eOpposite => "EOperation.eParameters", :eType => "EOperation"
    eReference "eGenericType", :containment => true, :eOpposite => "EGenericType.eParameter", :eType => "EGenericType"
  end
  eClass "EReference", :eSuperTypes => ["EStructuralFeature"], :instanceClassName => "RGen::ECore::EReference" do
    eAttribute "container", :changeable => false, :derived => true, :transient => true, :volatile => true, :eType => ""
    eAttribute "containment", :defaultValueLiteral => "false", :eType => ""
    eAttribute "resolveProxies", :defaultValueLiteral => "true", :eType => ""
    eReference "eOpposite", :eType => "EReference"
    eReference "eReferenceType", :changeable => false, :derived => true, :transient => true, :volatile => true, :lowerBound => 1, :eType => "EClass"
  end
  eClass "EStringToStringMapEntry", :instanceClassName => "RGen::ECore::EStringToStringMapEntry" do
    eAttribute "key", :eType => ""
    eAttribute "value", :eType => ""
  end
  eClass "EClass", :eSuperTypes => ["EClassifier"], :instanceClassName => "RGen::ECore::EClass" do
    eAttribute "abstract", :defaultValueLiteral => "false", :eType => ""
    eAttribute "interface", :defaultValueLiteral => "false", :eType => ""
    eReference "eIDAttribute", :resolveProxies => false, :changeable => false, :derived => true, :transient => true, :volatile => true, :eType => "EAttribute"
    eReference "eAllAttributes", :changeable => false, :derived => true, :transient => true, :volatile => true, :upperBound => -1, :eType => "EAttribute"
    eReference "eAllContainments", :changeable => false, :derived => true, :transient => true, :volatile => true, :upperBound => -1, :eType => "EReference"
    eReference "eAllOperations", :changeable => false, :derived => true, :transient => true, :volatile => true, :upperBound => -1, :eType => "EOperation"
    eReference "eAllReferences", :changeable => false, :derived => true, :transient => true, :volatile => true, :upperBound => -1, :eType => "EReference"
    eReference "eAllStructuralFeatures", :changeable => false, :derived => true, :transient => true, :volatile => true, :upperBound => -1, :eType => "EStructuralFeature"
    eReference "eAllSuperTypes", :changeable => false, :derived => true, :transient => true, :volatile => true, :upperBound => -1, :eType => "EClass"
    eReference "eAttributes", :changeable => false, :derived => true, :transient => true, :volatile => true, :upperBound => -1, :eType => "EAttribute"
    eReference "eReferences", :changeable => false, :derived => true, :transient => true, :volatile => true, :upperBound => -1, :eType => "EReference"
    eReference "eOperations", :containment => true, :resolveProxies => false, :eOpposite => "EOperation.eContainingClass", :upperBound => -1, :eType => "EOperation"
    eReference "eStructuralFeatures", :containment => true, :resolveProxies => false, :eOpposite => "EStructuralFeature.eContainingClass", :upperBound => -1, :eType => "EStructuralFeature"
    eReference "eSuperTypes", :eOpposite => "eSubTypes", :upperBound => -1, :eType => "EClass"
    eReference "eSubTypes", :eOpposite => "eSuperTypes", :upperBound => -1, :eType => "EClass"
  end
end
