import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class SecurityService extends AbstractRestService {
  Future<void> changePassword(
      BuildContext context, String oldPassword, String newPassword) async {
    try {
      await performJsonPost(
        context,
        '$REST_URL/users/change-password',
        jsonEncode(
          {"oldPassword": oldPassword, "newPassword": newPassword},
        ),
      );
      return;
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      handleUnknownError(context);
    }
  }
}
