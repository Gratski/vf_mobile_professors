import 'package:mobx/mobx.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/classes/class.model.dart';

part 'create_class_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class CreateClassState extends _CreateClassState with _$CreateClassState {
  CreateClassState();
}

// The store-class
abstract class _CreateClassState with Store {

  /// Screen Context
  @observable
  int currentPageNumber = 0;

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
  int languageContextId;

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
  String goals;

  @observable
  double calories;

  /// Context Actions
  @action
  nextPage() {
    this.currentPageNumber++;
  }

  setCategories(List<CategoryModel> categories) {
    this.categoriesList.clear();
    this.categoriesList.addAll(categories);
  }
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
  setLanguageContextId(int languageContextId) {
    this.languageContextId = languageContextId;
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

}