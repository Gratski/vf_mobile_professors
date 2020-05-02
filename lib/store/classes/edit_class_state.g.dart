// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_class_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditClassState on _EditClassState, Store {
  final _$currentPageNumberAtom =
      Atom(name: '_EditClassState.currentPageNumber');

  @override
  int get currentPageNumber {
    _$currentPageNumberAtom.context.enforceReadPolicy(_$currentPageNumberAtom);
    _$currentPageNumberAtom.reportObserved();
    return super.currentPageNumber;
  }

  @override
  set currentPageNumber(int value) {
    _$currentPageNumberAtom.context.conditionallyRunInAction(() {
      super.currentPageNumber = value;
      _$currentPageNumberAtom.reportChanged();
    }, _$currentPageNumberAtom, name: '${_$currentPageNumberAtom.name}_set');
  }

  final _$idAtom = Atom(name: '_EditClassState.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$languageContextAtom = Atom(name: '_EditClassState.languageContext');

  @override
  LanguageContextModel get languageContext {
    _$languageContextAtom.context.enforceReadPolicy(_$languageContextAtom);
    _$languageContextAtom.reportObserved();
    return super.languageContext;
  }

  @override
  set languageContext(LanguageContextModel value) {
    _$languageContextAtom.context.conditionallyRunInAction(() {
      super.languageContext = value;
      _$languageContextAtom.reportChanged();
    }, _$languageContextAtom, name: '${_$languageContextAtom.name}_set');
  }

  final _$designationAtom = Atom(name: '_EditClassState.designation');

  @override
  String get designation {
    _$designationAtom.context.enforceReadPolicy(_$designationAtom);
    _$designationAtom.reportObserved();
    return super.designation;
  }

  @override
  set designation(String value) {
    _$designationAtom.context.conditionallyRunInAction(() {
      super.designation = value;
      _$designationAtom.reportChanged();
    }, _$designationAtom, name: '${_$designationAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_EditClassState.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$durationAtom = Atom(name: '_EditClassState.duration');

  @override
  int get duration {
    _$durationAtom.context.enforceReadPolicy(_$durationAtom);
    _$durationAtom.reportObserved();
    return super.duration;
  }

  @override
  set duration(int value) {
    _$durationAtom.context.conditionallyRunInAction(() {
      super.duration = value;
      _$durationAtom.reportChanged();
    }, _$durationAtom, name: '${_$durationAtom.name}_set');
  }

  final _$possibleDurationsAtom =
      Atom(name: '_EditClassState.possibleDurations');

  @override
  ObservableList<int> get possibleDurations {
    _$possibleDurationsAtom.context.enforceReadPolicy(_$possibleDurationsAtom);
    _$possibleDurationsAtom.reportObserved();
    return super.possibleDurations;
  }

  @override
  set possibleDurations(ObservableList<int> value) {
    _$possibleDurationsAtom.context.conditionallyRunInAction(() {
      super.possibleDurations = value;
      _$possibleDurationsAtom.reportChanged();
    }, _$possibleDurationsAtom, name: '${_$possibleDurationsAtom.name}_set');
  }

  final _$difficultyLevelAtom = Atom(name: '_EditClassState.difficultyLevel');

  @override
  DifficultyLevel get difficultyLevel {
    _$difficultyLevelAtom.context.enforceReadPolicy(_$difficultyLevelAtom);
    _$difficultyLevelAtom.reportObserved();
    return super.difficultyLevel;
  }

  @override
  set difficultyLevel(DifficultyLevel value) {
    _$difficultyLevelAtom.context.conditionallyRunInAction(() {
      super.difficultyLevel = value;
      _$difficultyLevelAtom.reportChanged();
    }, _$difficultyLevelAtom, name: '${_$difficultyLevelAtom.name}_set');
  }

  final _$possibleDifficultyLevelsAtom =
      Atom(name: '_EditClassState.possibleDifficultyLevels');

  @override
  ObservableList<DifficultyLevel> get possibleDifficultyLevels {
    _$possibleDifficultyLevelsAtom.context
        .enforceReadPolicy(_$possibleDifficultyLevelsAtom);
    _$possibleDifficultyLevelsAtom.reportObserved();
    return super.possibleDifficultyLevels;
  }

  @override
  set possibleDifficultyLevels(ObservableList<DifficultyLevel> value) {
    _$possibleDifficultyLevelsAtom.context.conditionallyRunInAction(() {
      super.possibleDifficultyLevels = value;
      _$possibleDifficultyLevelsAtom.reportChanged();
    }, _$possibleDifficultyLevelsAtom,
        name: '${_$possibleDifficultyLevelsAtom.name}_set');
  }

  final _$parentCategoryAtom = Atom(name: '_EditClassState.parentCategory');

  @override
  CategoryModel get parentCategory {
    _$parentCategoryAtom.context.enforceReadPolicy(_$parentCategoryAtom);
    _$parentCategoryAtom.reportObserved();
    return super.parentCategory;
  }

  @override
  set parentCategory(CategoryModel value) {
    _$parentCategoryAtom.context.conditionallyRunInAction(() {
      super.parentCategory = value;
      _$parentCategoryAtom.reportChanged();
    }, _$parentCategoryAtom, name: '${_$parentCategoryAtom.name}_set');
  }

  final _$subCategoryAtom = Atom(name: '_EditClassState.subCategory');

  @override
  CategoryModel get subCategory {
    _$subCategoryAtom.context.enforceReadPolicy(_$subCategoryAtom);
    _$subCategoryAtom.reportObserved();
    return super.subCategory;
  }

  @override
  set subCategory(CategoryModel value) {
    _$subCategoryAtom.context.conditionallyRunInAction(() {
      super.subCategory = value;
      _$subCategoryAtom.reportChanged();
    }, _$subCategoryAtom, name: '${_$subCategoryAtom.name}_set');
  }

  final _$isLoadingSubCategoriesAtom =
      Atom(name: '_EditClassState.isLoadingSubCategories');

  @override
  bool get isLoadingSubCategories {
    _$isLoadingSubCategoriesAtom.context
        .enforceReadPolicy(_$isLoadingSubCategoriesAtom);
    _$isLoadingSubCategoriesAtom.reportObserved();
    return super.isLoadingSubCategories;
  }

  @override
  set isLoadingSubCategories(bool value) {
    _$isLoadingSubCategoriesAtom.context.conditionallyRunInAction(() {
      super.isLoadingSubCategories = value;
      _$isLoadingSubCategoriesAtom.reportChanged();
    }, _$isLoadingSubCategoriesAtom,
        name: '${_$isLoadingSubCategoriesAtom.name}_set');
  }

  final _$subCategoriesListAtom =
      Atom(name: '_EditClassState.subCategoriesList');

  @override
  ObservableList<CategoryModel> get subCategoriesList {
    _$subCategoriesListAtom.context.enforceReadPolicy(_$subCategoriesListAtom);
    _$subCategoriesListAtom.reportObserved();
    return super.subCategoriesList;
  }

  @override
  set subCategoriesList(ObservableList<CategoryModel> value) {
    _$subCategoriesListAtom.context.conditionallyRunInAction(() {
      super.subCategoriesList = value;
      _$subCategoriesListAtom.reportChanged();
    }, _$subCategoriesListAtom, name: '${_$subCategoriesListAtom.name}_set');
  }

  final _$equipmentAtom = Atom(name: '_EditClassState.equipment');

  @override
  String get equipment {
    _$equipmentAtom.context.enforceReadPolicy(_$equipmentAtom);
    _$equipmentAtom.reportObserved();
    return super.equipment;
  }

  @override
  set equipment(String value) {
    _$equipmentAtom.context.conditionallyRunInAction(() {
      super.equipment = value;
      _$equipmentAtom.reportChanged();
    }, _$equipmentAtom, name: '${_$equipmentAtom.name}_set');
  }

  final _$goalsAtom = Atom(name: '_EditClassState.goals');

  @override
  String get goals {
    _$goalsAtom.context.enforceReadPolicy(_$goalsAtom);
    _$goalsAtom.reportObserved();
    return super.goals;
  }

  @override
  set goals(String value) {
    _$goalsAtom.context.conditionallyRunInAction(() {
      super.goals = value;
      _$goalsAtom.reportChanged();
    }, _$goalsAtom, name: '${_$goalsAtom.name}_set');
  }

  final _$caloriesAtom = Atom(name: '_EditClassState.calories');

  @override
  double get calories {
    _$caloriesAtom.context.enforceReadPolicy(_$caloriesAtom);
    _$caloriesAtom.reportObserved();
    return super.calories;
  }

  @override
  set calories(double value) {
    _$caloriesAtom.context.conditionallyRunInAction(() {
      super.calories = value;
      _$caloriesAtom.reportChanged();
    }, _$caloriesAtom, name: '${_$caloriesAtom.name}_set');
  }

  final _$_EditClassStateActionController =
      ActionController(name: '_EditClassState');

  @override
  dynamic setPossibleDifficultyLevels(List<DifficultyLevel> levels) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setPossibleDifficultyLevels(levels);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDifficultyLevel(DifficultyLevel level) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setDifficultyLevel(level);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSubCategory(CategoryModel category) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setSubCategory(category);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoadingSubCategories(bool isLoading) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setIsLoadingSubCategories(isLoading);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSubCategoriesList(List<CategoryModel> subCategories) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setSubCategoriesList(subCategories);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentPageNumber(int n) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setCurrentPageNumber(n);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextPage() {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.nextPage();
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setId(int id) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setId(id);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLanguageContext(LanguageContextModel lcm) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setLanguageContext(lcm);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDesignation(String newDesignation) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setDesignation(newDesignation);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String newDescription) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setDescription(newDescription);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDuration(int newDuration) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setDuration(newDuration);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPossibleDurations(List<int> durations) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setPossibleDurations(durations);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setParentCategory(CategoryModel category) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setParentCategory(category);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEquipment(String equipment) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setEquipment(equipment);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGoals(String newGoals) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setGoals(newGoals);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCalories(double newCalories) {
    final _$actionInfo = _$_EditClassStateActionController.startAction();
    try {
      return super.setCalories(newCalories);
    } finally {
      _$_EditClassStateActionController.endAction(_$actionInfo);
    }
  }
}
