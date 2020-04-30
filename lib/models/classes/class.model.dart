import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/language_context/language_context.model.dart';

class ClassModel {
  int id;
  String designation;
  String description;
  String equipment;
  String goals;
  double calories;
  String pictureUrl;
  bool isActive;
  int duration;
  LanguageContextModel languageContext;
  CategoryModel category;

  ClassModel(this.id, this.designation, this.description, this.equipment, this.pictureUrl,
      this.isActive, this.duration, this.languageContext, this.category);
}
