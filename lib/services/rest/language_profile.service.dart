import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:professors/services/dto/create_operation.response.dart';
import 'package:professors/services/dto/language_profile/create_language_profile.request.dart';
import 'package:professors/services/dto/language_profile/update_language_profile.request.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class LanguageProfileService extends AbstractRestService {

  Future<CreateOperationResponse> createLanguageProfile(
      BuildContext context, int languageId, String designation,
      String description, String quote) async {
    CreateLanguageProfileRequest req = CreateLanguageProfileRequest(languageId, description, description, quote);
    try {
      final rsp =  await this.performJsonPost(context, '$REST_URL/professors/profile-details', req.toJson());
      return CreateOperationResponse.fromJson(jsonDecode(rsp.body));
    } on ApiException catch(e) {
      throw e;
    }
  }

  Future<void> updateLanguageProfile(
      BuildContext context, int languageProfileId, String designation, String description, String quote
      ) {
    UpdateLanguageProfileRequest req = UpdateLanguageProfileRequest(designation, description, quote);
    try {

    } on ApiException catch(e) {
      throw e;
    }
  }

}