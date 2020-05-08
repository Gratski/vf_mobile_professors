import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/models/classes/class_list_item.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class ClassService extends AbstractRestService {

  Future<void> createClass(BuildContext context, int categoryId, int languageId,
      String designation, String description, String equipment, String goal,
      int difficultyLevel, double calories, int duration) async {
    try {
      final rsp = await performJsonPost(context, '$REST_URL/disciplines', jsonEncode({
        "categoryId": categoryId,
        "languageId": languageId,
        "designation": designation,
        "description": description,
        "equipment": equipment,
        "goal": goal,
        "difficultyLevel": difficultyLevel,
        "calories": calories,
        "duration": duration
      },),);
      return;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      throw ApiException("Something went wrong");
    }
  }

  ///
  /// Gets a class by id
  ///
  Future<ClassModel> getClassById(BuildContext context, int classId) async {

  }

  ///
  /// Gets a page of classes
  ///
  Future<List<ClassListItemModel>> getUserClasses(BuildContext context, int page, int limit) async {
    try {
      final rsp = await performJsonGet(context, '$REST_URL/professors/me/disciplines?page=$page&limit=$limit');
      List<dynamic> list = decodeBody(rsp)["items"];
      List<ClassListItemModel> result = List.of([]);
      list.forEach((elem) {
        result.add(
          ClassListItemModel(
            elem["id"],
            elem["designation"],
            elem["description"],
            elem["pictureUrl"],
            elem["languageCode"],
            elem["difficultyLevel"],
            elem["duration"],
            elem["isActive"]
          )
        );
      },);
      return result;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      throw ApiException("Something went wrong");
    }
  }

}