import 'package:flutter/material.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class LanguageService extends AbstractRestService {

  ///
  /// Gets all countries
  ///
  Future<void> getLanguages(BuildContext context) async {
    try {
      final rsp = await this.performJsonGet(context, '$REST_URL/languages', useAuth: false);
    } on ApiException catch(e) {
      throw e;
    }
  }

}