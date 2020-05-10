import 'package:professors/models/category/category.model.dart';

class ProfileDetailsModel {
  int id;
  String firstName, lastName, pictureUrl, about, quote;
  List<CategoryModel> teaches;
  ProfileDetailsModel(this.id, this.firstName, this.lastName, this.pictureUrl, this.about, this.quote, this.teaches);
}