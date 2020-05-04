import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';
import 'package:professors/visual/builders/toaster.builder.dart';

class ProfileDetailsService extends AbstractRestService {
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
      ToasterBuilder.buildSuccessToaster(context, "created!");
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
      ToasterBuilder.buildSuccessToaster(context, "Saved!");
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
