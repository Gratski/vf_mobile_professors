import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/language_context/language_context.model.dart';

class ClassModel {
  int id;
  double rate;
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
  String languageCode;

  int difficultyLevel;

  int categoryId;
  String categoryName;
  int parentCategoryId;
  String parentCategoryName;

  int instructorId;
  String instructorName;
  double instructorRate;
  String instructorPictureUrl;

  ClassModel(
      this.id,
      this.rate,
      this.languageId,
      this.languageCode,
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
      this.isActive,
      this.instructorId,
      this.instructorName,
      this.instructorRate,
      this.instructorPictureUrl
      );
}
