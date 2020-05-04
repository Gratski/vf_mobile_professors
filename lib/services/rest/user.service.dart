import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class UserService extends AbstractRestService {

  ///
  /// Gets user personal details
  ///
  Future<void> getUserPersonalDetails(BuildContext context) async {
    userStore.setIsLoading(true);
    try {
      final rsp = await this.performJsonGet(context, "$REST_URL/auth/me");
      Map<String, dynamic> resultMap = jsonDecode(rsp.body);
      userStore.setFirstName(resultMap["firstName"]);
      userStore.setLastName(resultMap["lastName"]);
      userStore.setEmail(resultMap["email"]);
      userStore.setGender(resultMap["gender"]);
      userStore.setBirthday(resultMap["birthday"]);
      userStore.setPhoneNumber(resultMap["phoneNumber"]);
      userStore.setCountry(resultMap["nationality"]["id"], resultMap["nationality"]["countryName"]);

      // make this validation to optimize the resource consumption
      if ( resultMap["pictureUrl"] != userStore.pictureUrl ) {
        userStore.setPictureUrl(resultMap["pictureUrl"]);
      }
    } on ApiException catch(e) {
      throw e;
    } finally {
      userStore.setIsLoading(false);
    }
  }

  ///
  /// Updates the user personal details
  ///
  Future<void> updateUserPersonalDetails(
      BuildContext context,
      String firstName,
      String lastName,
      String gender,
      int nationalityCountryId,
      String phoneNumber,
      DateTime birthday) async {
    try {
      final rsp = await this.performJsonPut(
        context,
        '$REST_URL/me',
        jsonEncode(
          {
            "firstName": firstName,
            "lastName": lastName,
            "gender": gender,
            "nationalityCountryId": nationalityCountryId,
            "phoneNumber": phoneNumber,
            "birthday": birthday,
          },
        ),
      );
      return;
    } on ApiException catch (e) {
      throw e;
    }
  }
}
