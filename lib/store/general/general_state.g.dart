// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GeneralState on _GeneralState, Store {
  final _$isReadyAtom = Atom(name: '_GeneralState.isReady');

  @override
  bool get isReady {
    _$isReadyAtom.context.enforceReadPolicy(_$isReadyAtom);
    _$isReadyAtom.reportObserved();
    return super.isReady;
  }

  @override
  set isReady(bool value) {
    _$isReadyAtom.context.conditionallyRunInAction(() {
      super.isReady = value;
      _$isReadyAtom.reportChanged();
    }, _$isReadyAtom, name: '${_$isReadyAtom.name}_set');
  }

  final _$isCategoriesLoadingAtom =
      Atom(name: '_GeneralState.isCategoriesLoading');

  @override
  bool get isCategoriesLoading {
    _$isCategoriesLoadingAtom.context
        .enforceReadPolicy(_$isCategoriesLoadingAtom);
    _$isCategoriesLoadingAtom.reportObserved();
    return super.isCategoriesLoading;
  }

  @override
  set isCategoriesLoading(bool value) {
    _$isCategoriesLoadingAtom.context.conditionallyRunInAction(() {
      super.isCategoriesLoading = value;
      _$isCategoriesLoadingAtom.reportChanged();
    }, _$isCategoriesLoadingAtom,
        name: '${_$isCategoriesLoadingAtom.name}_set');
  }

  final _$categoriesAtom = Atom(name: '_GeneralState.categories');

  @override
  ObservableList<CategoryModel> get categories {
    _$categoriesAtom.context.enforceReadPolicy(_$categoriesAtom);
    _$categoriesAtom.reportObserved();
    return super.categories;
  }

  @override
  set categories(ObservableList<CategoryModel> value) {
    _$categoriesAtom.context.conditionallyRunInAction(() {
      super.categories = value;
      _$categoriesAtom.reportChanged();
    }, _$categoriesAtom, name: '${_$categoriesAtom.name}_set');
  }

  final _$isSubCategoriesLoadingAtom =
      Atom(name: '_GeneralState.isSubCategoriesLoading');

  @override
  bool get isSubCategoriesLoading {
    _$isSubCategoriesLoadingAtom.context
        .enforceReadPolicy(_$isSubCategoriesLoadingAtom);
    _$isSubCategoriesLoadingAtom.reportObserved();
    return super.isSubCategoriesLoading;
  }

  @override
  set isSubCategoriesLoading(bool value) {
    _$isSubCategoriesLoadingAtom.context.conditionallyRunInAction(() {
      super.isSubCategoriesLoading = value;
      _$isSubCategoriesLoadingAtom.reportChanged();
    }, _$isSubCategoriesLoadingAtom,
        name: '${_$isSubCategoriesLoadingAtom.name}_set');
  }

  final _$subCategoriesAtom = Atom(name: '_GeneralState.subCategories');

  @override
  ObservableList<CategoryModel> get subCategories {
    _$subCategoriesAtom.context.enforceReadPolicy(_$subCategoriesAtom);
    _$subCategoriesAtom.reportObserved();
    return super.subCategories;
  }

  @override
  set subCategories(ObservableList<CategoryModel> value) {
    _$subCategoriesAtom.context.conditionallyRunInAction(() {
      super.subCategories = value;
      _$subCategoriesAtom.reportChanged();
    }, _$subCategoriesAtom, name: '${_$subCategoriesAtom.name}_set');
  }

  final _$isAvailableLanguagesLoadingAtom =
      Atom(name: '_GeneralState.isAvailableLanguagesLoading');

  @override
  bool get isAvailableLanguagesLoading {
    _$isAvailableLanguagesLoadingAtom.context
        .enforceReadPolicy(_$isAvailableLanguagesLoadingAtom);
    _$isAvailableLanguagesLoadingAtom.reportObserved();
    return super.isAvailableLanguagesLoading;
  }

  @override
  set isAvailableLanguagesLoading(bool value) {
    _$isAvailableLanguagesLoadingAtom.context.conditionallyRunInAction(() {
      super.isAvailableLanguagesLoading = value;
      _$isAvailableLanguagesLoadingAtom.reportChanged();
    }, _$isAvailableLanguagesLoadingAtom,
        name: '${_$isAvailableLanguagesLoadingAtom.name}_set');
  }

  final _$availableLanguagesAtom =
      Atom(name: '_GeneralState.availableLanguages');

  @override
  ObservableList<LanguageModel> get availableLanguages {
    _$availableLanguagesAtom.context
        .enforceReadPolicy(_$availableLanguagesAtom);
    _$availableLanguagesAtom.reportObserved();
    return super.availableLanguages;
  }

  @override
  set availableLanguages(ObservableList<LanguageModel> value) {
    _$availableLanguagesAtom.context.conditionallyRunInAction(() {
      super.availableLanguages = value;
      _$availableLanguagesAtom.reportChanged();
    }, _$availableLanguagesAtom, name: '${_$availableLanguagesAtom.name}_set');
  }

  final _$isExistingLanguagesLoadingAtom =
      Atom(name: '_GeneralState.isExistingLanguagesLoading');

  @override
  bool get isExistingLanguagesLoading {
    _$isExistingLanguagesLoadingAtom.context
        .enforceReadPolicy(_$isExistingLanguagesLoadingAtom);
    _$isExistingLanguagesLoadingAtom.reportObserved();
    return super.isExistingLanguagesLoading;
  }

  @override
  set isExistingLanguagesLoading(bool value) {
    _$isExistingLanguagesLoadingAtom.context.conditionallyRunInAction(() {
      super.isExistingLanguagesLoading = value;
      _$isExistingLanguagesLoadingAtom.reportChanged();
    }, _$isExistingLanguagesLoadingAtom,
        name: '${_$isExistingLanguagesLoadingAtom.name}_set');
  }

  final _$existingLanguagesAtom = Atom(name: '_GeneralState.existingLanguages');

  @override
  ObservableList<LanguageModel> get existingLanguages {
    _$existingLanguagesAtom.context.enforceReadPolicy(_$existingLanguagesAtom);
    _$existingLanguagesAtom.reportObserved();
    return super.existingLanguages;
  }

  @override
  set existingLanguages(ObservableList<LanguageModel> value) {
    _$existingLanguagesAtom.context.conditionallyRunInAction(() {
      super.existingLanguages = value;
      _$existingLanguagesAtom.reportChanged();
    }, _$existingLanguagesAtom, name: '${_$existingLanguagesAtom.name}_set');
  }

  final _$_GeneralStateActionController =
      ActionController(name: '_GeneralState');

  @override
  dynamic setIsCategoriesLoading(bool isLoading) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setIsCategoriesLoading(isLoading);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategories(List<CategoryModel> categories) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setCategories(categories);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsSubCategoriesLoading(bool isLoading) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setIsSubCategoriesLoading(isLoading);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSubCategories(List<CategoryModel> subCategorires) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setSubCategories(subCategorires);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsAvailableLanguagesLoading(bool isLoading) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setIsAvailableLanguagesLoading(isLoading);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAvailableLanguages(List<LanguageModel> languages) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setAvailableLanguages(languages);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsExistingLanguagesLoading(bool isLoading) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setIsExistingLanguagesLoading(isLoading);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setExistingLanguages(List<LanguageModel> languages) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setExistingLanguages(languages);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsReady(bool isReady) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setIsReady(isReady);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }
}
