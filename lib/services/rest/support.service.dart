import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:professors/models/support/support_contact_type.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class SupportService extends AbstractRestService {

  ///
  /// Sends a support message on behalf of the professor
  ///
  Future<void> sendSupportMessage(
      BuildContext context, SupportContactTypeModel type, String msg) async {
    try {
      await performJsonPost(
        context,
        '$REST_URL/support/professor',
        jsonEncode({"type": enumToString(type), "msg": msg}),
      );
      return;
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      throw ApiException("Internet Error");
    }
  }
}
