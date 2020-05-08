import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/models/classes/class_list_item.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class ClassService extends AbstractRestService {

  ///
  /// Creates a new class
  ///
  Future<int> createOrUpdateClass(BuildContext context, int classId, int categoryId, int languageId,
      String designation, String description, String equipment, String goal,
      int difficultyLevel, double calories, int duration) async {
    try {
      if ( classId == null ) {
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
        return decodeBody(rsp)["id"];
      } else {
        await performJsonPut(context, '$REST_URL/disciplines/$classId', jsonEncode({
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
        return classId;
      }
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
    try {
      final rsp = await performJsonGet(context, '$REST_URL/disciplines/$classId');
      Map<String, dynamic> result = decodeBody(rsp);
      return ClassModel(
        result["id"],
        result["languageId"],
        result["category"]["id"],
        result["category"]["designation"],
        result["parentCategory"]["id"],
        result["parentCategory"]["designation"],
        result["designation"],
        result["description"],
        result["duration"],
        result["equipment"],
        result["goals"],
        result["difficultyLevel"],
        result["calories"],
        result["imageUrl"],
        result["status"],
        result["isActive"],
      );
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      throw ApiException("Something went wrong...");
    }
  }

  ///
  /// Changes the class picture
  ///
  Future<void> changeClassPicture(BuildContext context, int classId, File file) async {
    try {
      final rsp = await uploadFile(context, file, '$REST_URL/disciplines/$classId/picture');
      return;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      throw ApiException("Something went wrong");
    }
  }

  ///
  /// Toggles is active status
  ///
  Future<void> toggleIsActive(BuildContext context, int classId, bool isActive) async {
    String routeSuffix = isActive ? 'enable' : 'disable';
    try {
      final rsp = await performJsonPut(context, '$REST_URL/disciplines/$classId/$routeSuffix', jsonEncode({}));
      return;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      throw ApiException("Something went wrong");
    }
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
            elem["languageId"],
            elem["designation"],
            elem["description"],
            elem["pictureUrl"],
            elem["languageCode"],
            elem["difficultyLevel"],
            elem["duration"],
            elem["status"],
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

  ///
  /// Deletes an existing class
  ///
  Future<void> deleteClass(BuildContext context, int classId) async {
    try {
      final rsp = await performJsonDelete(context, '$REST_URL/disciplines/$classId');
      return;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      throw ApiException("Something went wrong");
    }
  }

}