import 'package:mobx/mobx.dart';
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