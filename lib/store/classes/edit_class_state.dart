import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/classes/difficulty_level.model.dart';
import 'package:professors/models/language_context/language_context.model.dart';

part 'edit_class_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class EditClassState extends _EditClassState with _$EditClassState {
  EditClassState();
}

// The store-class
abstract class _EditClassState with Store {

  /// Screen Context
  @observable
  int currentPageNumber = 0;

  /// Class Attributes
  @observable
  int id;

  @observable
  LanguageContextModel languageContext;

  @observable
  String designation;

  @observable
  String description;

  @observable
  int duration;

  @observable
  ObservableList<int> possibleDurations = ObservableList.of([20, 30, 35, 45]);// in minutes

  @observable
  DifficultyLevel difficultyLevel;

  @observable
  ObservableList<DifficultyLevel> possibleDifficultyLevels = ObservableList.of([
    DifficultyLevel(
      1, 'Easy', 'Applies to every types of members'
    ) ,
    DifficultyLevel(
        2, 'Moderate', 'Moderate charge'
    ),
    DifficultyLevel(
        3, 'Fit', 'Requires a very good physical shape'
    ),
    DifficultyLevel(
        4, 'Hard', 'Only for beasts'
    )
  ]);// in minutes

  @action
  setPossibleDifficultyLevels(List<DifficultyLevel> levels){
    this.possibleDifficultyLevels.clear();
    this.possibleDifficultyLevels.addAll(levels);
  }

  @action
  setDifficultyLevel(DifficultyLevel level){
    this.difficultyLevel = level;
  }

  //////////////////////////////////////////////////////////////////////////////
  // CATEGORY RELATED
  //////////////////////////////////////////////////////////////////////////////
  @observable
  CategoryModel parentCategory;
  @observable
  CategoryModel subCategory;

  @observable
  bool isLoadingSubCategories = false;

  @observable
  ObservableList<CategoryModel> subCategoriesList = ObservableList.of([
    CategoryModel(
      4,
      'Pure Cardio',
      'Pure Cardio Workout Training'
    ),
    CategoryModel(
        4,
        'Pure Cardio',
        'Pure Cardio Workout Training'
    ),
  ],);

  @action
  setSubCategory(CategoryModel category) {
    this.subCategory = category;
  }

  @action
  setIsLoadingSubCategories(bool isLoading) {
    this.isLoadingSubCategories = isLoading;
  }

  @action
  setSubCategoriesList(List<CategoryModel> subCategories) {
    this.subCategoriesList.clear();
    this.subCategoriesList.addAll(subCategories);
  }
  //////////////////////////////////////////////////////////////////////////////
  // END OF CATEGORY RELATED
  //////////////////////////////////////////////////////////////////////////////

  @observable
  String equipment;

  @observable
  String goals;

  @observable
  double calories;

  /// Context Actions
  @action
  setCurrentPageNumber(int n) {
    this.currentPageNumber = n;
  }

  @action
  nextPage() {
    this.currentPageNumber++;
  }

  /// Screen Actions
  @action
  setId(int id){
    this.id = id;
  }

  @action
  setLanguageContext(LanguageContextModel lcm) {
    this.languageContext = lcm;
  }
  @action
  setDesignation(String newDesignation) {
    this.designation = newDesignation;
  }
  @action
  setDescription(String newDescription) {
    this.description = newDescription;
  }
  @action
  setDuration(int newDuration) {
    this.duration = newDuration;
  }

  @action
  setPossibleDurations(List<int> durations) {
    this.possibleDurations.clear();
    this.possibleDurations.addAll(durations);
  }

  @action
  setParentCategory(CategoryModel category) {
    this.parentCategory = category;
  }


  @action
  setEquipment(String equipment){
    this.equipment = equipment;
  }
  @action
  setGoals(String newGoals){
    this.goals = newGoals;
  }
  @action
  setCalories(double newCalories){
    this.calories = newCalories;
  }

}