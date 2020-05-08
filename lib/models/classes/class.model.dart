import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/language_context/language_context.model.dart';

class ClassModel {
  int id;
  String designation;
  String description;
  String equipment;
  String goals;
  double calories;
  String imageUrl;
  bool isActive;
  int duration;
  int status;
  int languageId;

  int difficultyLevel;

  int categoryId;
  String categoryName;
  int parentCategoryId;
  String parentCategoryName;

  ClassModel(
      this.id,
      this.languageId,
      this.categoryId,
      this.categoryName,
      this.parentCategoryId,
      this.parentCategoryName,
      this.designation,
      this.description,
      this.duration,
      this.equipment,
      this.goals,
      this.difficultyLevel,
      this.calories,
      this.imageUrl,
      this.status,
      this.isActive
      );
}
