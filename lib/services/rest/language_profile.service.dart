import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/services/dto/create_operation.response.dart';
import 'package:professors/services/dto/language_profile/create_language_profile.request.dart';
import 'package:professors/services/dto/language_profile/get_languages.response.dart';
import 'package:professors/services/dto/language_profile/update_language_profile.request.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class LanguageProfileService extends AbstractRestService {

  ///
  /// Gets all existing profile languages for the professor
  ///
  Future<void> getExistingProfileLanguages(BuildContext context) async {
    // set loading to true
    generalStore.setIsExistingLanguagesLoading(true);
    try{
      final rsp = await this.performJsonGet(context, '$REST_URL/professors/me/profile-details/existing-languages');
      final languages = GetLanguagesResponse.fromJson(jsonDecode(rsp.body));

      // update existing languages in general store
      generalStore.setExistingLanguages(languages.languages);

    } on ApiException catch(e) {
      throw e;
    } finally {
      // set loading to false
      generalStore.setIsExistingLanguagesLoading(false);
    }
  }

  ///
  /// Gets all available profile languages for the professor
  ///
  Future<void> getAvailableProfileLanguages(BuildContext context) async {
    // set loading to true
    generalStore.setIsAvailableLanguagesLoading(true);
    try{
      final rsp = await this.performJsonGet(context, '$REST_URL/professors/me/profile-details/available-languages');
      final languages = GetLanguagesResponse.fromJson(jsonDecode(rsp.body));

      // update available languages in general store
      generalStore.setAvailableLanguages(languages.languages);

    } on ApiException catch(e) {
      throw e;
    } finally {
      // set loading to false
      generalStore.setIsAvailableLanguagesLoading(false);
    }
  }

  Future<CreateOperationResponse> createLanguageProfile(
      BuildContext context, int languageId, String designation,
      String description, String quote) async {
    CreateLanguageProfileRequest req = CreateLanguageProfileRequest(languageId, description, description, quote);
    try {
      final rsp =  await this.performJsonPost(context, '$REST_URL/professors/me/profile-details', req.toJson());
      return CreateOperationResponse.fromJson(jsonDecode(rsp.body));
    } on ApiException catch(e) {
      throw e;
    }
  }

  Future<void> updateLanguageProfile(
      BuildContext context, int languageId, String designation, String description, String quote
      ) {
    UpdateLanguageProfileRequest req = UpdateLanguageProfileRequest(designation, description, quote);
    try {

    } on ApiException catch(e) {
      throw e;
    }
  }

}