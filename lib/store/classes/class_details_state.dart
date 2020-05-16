import 'package:mobx/mobx.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/models/classes/class_comment.model.dart';
import 'package:professors/models/classes/class_list_item.dart';
import 'package:professors/models/language_context/language_context.model.dart';

part 'class_details_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class ClassDetailsState extends _ClassDetailsState with _$ClassDetailsState {
  ClassDetailsState();
}

abstract class _ClassDetailsState with Store {

  @observable
  bool isLoading = true;

  @observable
  int id;

  @observable
  int languageId;

  @observable
  String languageCode;

  @observable
  String imageUrl;

  @observable
  String categoryName;

  @observable
  String subCategoryName;

  @observable
  String designation;

  @observable
  double rate;

  @observable
  int difficultyLevel;

  @observable
  int duration;

  @observable
  double calories;

  @observable
  String description;

  @observable
  String equipment;

  @observable
  String goals;

  @observable
  int instructorId;

  @observable
  String instructorName;

  @observable
  double instructorRate;

  @observable
  String instructorPictureUrl;

  @observable
  ObservableList<ClassCommentModel> comments = ObservableList.of([]);

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setId(int id) {
    this.id = id;
  }

  @action
  setLanguageId(int id) {
    this.languageId = id;
  }

  @action
  setLanguageCode(String code) {
    this.languageCode = code;
  }

  @action
  setCategoryName(String name) {
    this.categoryName = name;
  }

  @action
  setSubCategoryName(String name) {
    this.subCategoryName = name;
  }

  @action
  setDesignation(String designation) {
    this.designation = designation;
  }

  @action
  setDifficultyLevel(int level) {
    this.difficultyLevel = level;
  }

  @action
  setDescription(String description) {
    this.description = description;
  }

  @action
  setEquipment(String equipment) {
    this.equipment = equipment;
  }

  @action
  setGoals(String goals) {
    this.goals = goals;
  }

  @action
  setRate(double rate) {
    this.rate = rate;
  }

  @action
  setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  }

  @action
  setCalories(double calories) {
    this.calories = calories;
  }

  @action
  setDuration(int duration) {
    this.duration = duration;
  }

  @action
  setInstructorId(int id){
    this.instructorId = id;
  }

  @action
  setInstructorName(String name) {
    this.instructorName = name;
  }

  @action
  setInstructorRate(double rate) {
    this.instructorRate = rate;
  }

 @action
 setInstructorPictureUrl(String pictureUrl) {
    this.instructorPictureUrl = pictureUrl;
 }

}