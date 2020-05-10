import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/models/notification_preference_type.model.dart';
import 'package:professors/services/dto/notifications/get_notifications.response.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';
import 'package:professors/store/user/edit_profile_details_state.dart';
import 'package:professors/visual/builders/toaster.builder.dart';

class UserService extends AbstractRestService {
  ///
  /// Gets user personal details
  ///
  Future<void> getUserPersonalDetails(BuildContext context) async {
    userStore.setIsLoading(true);
    try {
      final rsp = await this.performJsonGet(context, "$REST_URL/auth/me");
      Map<String, dynamic> resultMap = decodeBody(rsp);
      userStore.setId(resultMap["id"]);
      userStore.setFirstName(resultMap["firstName"]);
      userStore.setLastName(resultMap["lastName"]);
      userStore.setEmail(resultMap["email"]);
      userStore.setGender(resultMap["gender"]);
      userStore.setBirthday(DateTime.parse(resultMap["birthday"]));
      userStore.setPhoneNumber(resultMap["phoneNumber"]);
      userStore.setCountry(resultMap["nationality"]["id"],
          resultMap["nationality"]["countryName"]);

      // make this validation to optimize the resource consumption
      if (resultMap["pictureUrl"] != userStore.pictureUrl) {
        userStore.setPictureUrl(resultMap["pictureUrl"]);
      }
    } on ApiException catch (e) {
      throw e;
    } finally {
      userStore.setIsLoading(false);
    }
  }

  ///
  /// Gets the user notification preferences
  ///
  Future<void> getUserNotificationPreferences(BuildContext context) async {
    notificationsStore.setIsLoading(true);
    try {
      final rsp = await performJsonGet(
          context, '$REST_URL/users/me/notification-preferences');

      // update each type of notification
      GetNotificationPreferencesResponse response =
          GetNotificationPreferencesResponse.fromJson(jsonDecode(rsp.body));
      response.items.forEach(
        (e) {
          switch(e.type) {
            case NotificationPreferenceTypeModel.GENERAL:
              notificationsStore.setMessageNotificationsActive(e.isActive);
              break;
            case NotificationPreferenceTypeModel.REMINDER:
              notificationsStore.setReminderNotificationsActive(e.isActive);
              break;
            case NotificationPreferenceTypeModel.SYSTEM:
              notificationsStore.setSupportNotificationsActive(e.isActive);
              break;
          }
        },
      );
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      ToasterBuilder.buildErrorToaster(context, "Something went wrong");
    } finally {
      notificationsStore.setIsLoading(false);
    }
  }

  ///
  /// Toggles a given notification preference
  ///
  Future<void> toggleUserNotificationPreference(
      BuildContext context,
      NotificationPreferenceTypeModel type,
      bool isActive
      ) async {

    try {
      String path = '$REST_URL/users/me/notification-preferences/'
          '${enumToString(type)}/${ isActive ? 'disable' : 'enable' }';
      final rsp = await performJsonPost(context, path, jsonEncode({}));
      getUserNotificationPreferences(context);
      return;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, "Something went wrong");
      return;
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
        '$REST_URL/users/me',
        jsonEncode(
          {
            "firstName": firstName,
            "lastName": lastName,
            "gender": gender,
            "nationalityCountryId": nationalityCountryId,
            "phoneNumber": phoneNumber,
            "birthday": birthday.millisecondsSinceEpoch,
          },
        ),
      );
      return;
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<void> changeProfilePicture(BuildContext context, File file) async {
    try {
      final uploadedFile = uploadFile(context, file, '$REST_URL/users/me/picture');
    } on Exception catch(e) {
      throw ApiException("Something went wrong. Try again later");
    }
  }
}
