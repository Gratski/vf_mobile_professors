import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/profile/profile_details.model.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';
import 'package:professors/visual/builders/toaster.builder.dart';

class ProfileDetailsService extends AbstractRestService {

  ///
  /// Gets the professor complete profile for a given language
  ///
  Future<ProfileDetailsModel> getProfileDetails(BuildContext context, int professorId, int languageId) async {
    try {
      final rsp = await performJsonGet(context, '$REST_URL/professors/$professorId/$languageId');
      Map<String, dynamic> mapResult = decodeBody(rsp);
      return ProfileDetailsModel(
        mapResult["id"],
        mapResult["firstName"],
        mapResult["lastName"],
        mapResult["pictureUrl"],
        mapResult["about"],
        mapResult["quote"],
        _extractCategoriesList(mapResult["teaches"])
      );
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      throw ApiException(AppLocalizations.of(context).translate(constants.somethingWentWrongText));
    }
  }

  _extractCategoriesList(List<dynamic> list) {
    List<CategoryModel> result = List.of([]);
    list.forEach((elem) {
      result.add(CategoryModel(
        elem["id"],
        elem["designation"],
        elem["description"]
      ));
    });
    return result;
  }

  ///
  /// Gets a profile details for a given language
  ///
  Future<void> getProfileDetailsByLanguageId(
      BuildContext context, int languageId) async {
    profileDetailsStore.setIsLoading(true);
    try {
      final rsp = await performJsonGet(
          context, '$REST_URL/professors/me/profile-details/$languageId');
      Map<String, dynamic> result = decodeBody(rsp);
      profileDetailsStore.setId(result["id"]);
      profileDetailsStore.setDesignation(result["designation"]);
      profileDetailsStore.setDescription(result["description"]);
      profileDetailsStore.setQuote(result["quote"]);
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      handleUnknownError(context);
    } finally {
      profileDetailsStore.setIsLoading(false);
    }
  }

  ///
  /// Creates a new profile details for a language
  ///
  Future<void> createProfileDetails(BuildContext context, int languageId,
      String designation, String description, String quote) async {
    profileDetailsStore.setIsLoading(true);
    try {
      final rsp = await performJsonPost(
          context,
          '$REST_URL/professors/me/profile-details',
          jsonEncode({
            "languageId": languageId,
            "designation": designation,
            "description": description,
            "quote": quote,
          }));

      // update profile details in foreground
      Map<String, dynamic> result = decodeBody(rsp);
      profileDetailsStore.setId(result["id"]);

      // show success message
      ToasterBuilder.buildSuccessToaster(context, AppLocalizations.of(context).translate(constants.successfullyCreatedText));
      return;
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      handleUnknownError(context);
    } finally {
      profileDetailsStore.setIsLoading(false);
    }
  }

  ///
  /// Updates an existing profile details
  ///
  Future<void> updateProfileDetails(BuildContext context, int profileDetailsId,
      String designation, String description, String quote) async {
    profileDetailsStore.setIsLoading(true);
    try {
      await performJsonPut(
          context,
          '$REST_URL/professors/me/profile-details/$profileDetailsId',
          jsonEncode({
            "id": profileDetailsId,
            "designation": designation,
            "description": description,
            "quote": quote,
          }));
      ToasterBuilder.buildSuccessToaster(context, AppLocalizations.of(context).translate(constants.successfullySavedText));
      return;
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      handleUnknownError(context);
    } finally {
      profileDetailsStore.setIsLoading(false);
    }
  }
}
