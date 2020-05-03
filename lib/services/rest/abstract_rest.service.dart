import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/localization.config.dart';
import 'package:professors/services/dto/errors/http_error.dto.dart';
import 'package:professors/services/exceptions/api.exception.dart';

abstract class AbstractRestService {
  String REST_URL = "http://192.168.1.103:2222/api/v1";

  Future<Response> performJsonPost(BuildContext context, String path, String body) async {
    final response = await http.post(path, body: body, headers: _authHeaders(context));
    await _handleError(context, response);
    return response;
  }

  Future<Response> performJsonPut(BuildContext context, String path, String body) async {
    final response = await http.put(path, body: body, headers: _authHeaders(context));
    await _handleError(context, response);
    return response;
  }

  Future<Response> performJsonGet(BuildContext context, String path) async {
    final response = await http.get(path, headers: _authHeaders(context));
    await _handleError(context, response);
    return response;
  }

  Future<Response> performJsonDelete(BuildContext context, String path) async {
    final response = await http.delete(path, headers: _authHeaders(context));
    await _handleError(context, response);
    return response;
  }

  Future<void> _handleError(BuildContext context, Response response ) async {
    if( response.statusCode >= 400 ) {

      // not authenticated
      if ( response.statusCode == 401 || response.statusCode == 403 ) {
        await restServices.getAuthRestService().signOut();
        Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
      }

      HttpError error = HttpError.fromJson(jsonDecode(response.body));
      throw new ApiException(error.message);
    }
    return;
  }

  Map<String, String> _authHeaders(BuildContext context) {
    return {
      "content-type": "application/json",
      "Accept-Language": LocalizationConfig.extractCurrentLocale(context).languageCode
    };
  }
}