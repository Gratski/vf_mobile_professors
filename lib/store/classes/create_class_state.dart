import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/models/classes/difficulty_level.model.dart';

part 'create_class_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class CreateClassState extends _CreateClassState with _$CreateClassState {
  CreateClassState();
}

// The store-class
abstract class _CreateClassState with Store {

  @observable
  ObservableList<int> possibleDurations = ObservableList.of([20, 30, 35, 45]);// in minutes

  @observable
  ObservableList<DifficultyLevel> possibleDifficultyLevels = ObservableList.of([
    DifficultyLevel(
        1, 'GENERAL_DIFFICULTY_LEVEL_BEGINNER'
    ) ,
    DifficultyLevel(
        2, 'GENERAL_DIFFICULTY_LEVEL_INTERMEDIATE'
    ),
    DifficultyLevel(
        3, 'GENERAL_DIFFICULTY_LEVEL_ADVANCED'
    ),
    DifficultyLevel(
        4, 'GENERAL_DIFFICULTY_LEVEL_WARRIOR'
    )
  ]);// in minutes

  @observable
  String imageFilePath;

  /// Screen Context
  @observable
  int currentPageNumber = 0;

  @observable
  int previousPageNumber;

  /// loading flags
  @observable
  bool isLoadingContext = true; // discipline details
  @observable
  bool isLoadingCategories = true; // categories list
  @observable
  bool isLoadingSubCategories = true; // sub categories list

  /// required data for context
  @observable
  ObservableList<CategoryModel> categoriesList = ObservableList.of([]);
  @observable
  ObservableList<CategoryModel> subCategoriesList = ObservableList.of([]);

  /// Class Attributes
  @observable
  int id;

  @observable
  int languageId;
  @observable
  String languageDesignation;


  @observable
  String designation;

  @observable
  String description;

  @observable
  int duration; // in minutes

  @observable
  int categoryId;
  @observable
  String categoryName;

  @observable
  int subCategoryId;
  @observable
  String subCategoryName;

  @observable
  String equipment;

  @observable
  int status;

  @observable
  bool isActive;

  @observable
  String goals;

  @observable
  double calories;

  @observable
  int difficultyLevel;

  @observable
  String pictureUrl;

  /// Context Actions
  @action
  setCurrentPageNumber(int number) {
    this.currentPageNumber = number;
  }

  @action
  setPreviousPageNumber(int number) {
    this.previousPageNumber = number;
  }

  @action
  nextPage() {
    this.currentPageNumber++;
  }

  @action
  setImageFilePath(String filePath) {
    this.imageFilePath = filePath;
  }

  @action
  setCategories(List<CategoryModel> categories) {
    this.categoriesList.clear();
    this.categoriesList.addAll(categories);
  }
  @action
  setSubCategories(List<CategoryModel> subCategories) {
    this.subCategoriesList.clear();
    this.subCategoriesList.addAll(subCategories);
  }

  /// Loaders related
  @action
  setIsLoadingContext(bool isLoading) {
    this.isLoadingContext = isLoading;
  }
  @action
  setIsLoadingCategories(bool isLoading) {
    this.isLoadingCategories = isLoading;
  }
  @action
  setIsLoadingSubCategories(bool isLoading) {
    this.isLoadingSubCategories = isLoading;
  }

  /// Screen Actions
  @action
  setId(int id){
    this.id = id;
  }
  @action
  setLanguageId(int languageId) {
    this.languageId = languageId;
  }
  @action
  setLanguageDesignation(String designation) {
    this.languageDesignation = designation;
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
  setPictureUrl(String url) {
    this.pictureUrl = url;
  }
  @action
  setStatus(int status) {
    this.status = status;
  }
  @action
  setIsActive(bool isActive) {
    this.isActive = isActive;
  }

  @action
  setCategoryId(int newCategoryId) {
    this.categoryId = newCategoryId;
  }
  @action
  setCategoryName(String name) {
    this.categoryName = name;
  }
  @action
  setSubCategoryId(int newSubCategoryId) {
    this.subCategoryId = newSubCategoryId;
  }
  @action
  setSubCategoryName(String name) {
    this.subCategoryName = name;
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

  @action
  setDifficultyLevel(int difficultyLevel) {
    this.difficultyLevel = difficultyLevel;
  }

}