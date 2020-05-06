import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/localization.config.dart';
import 'package:professors/services/dto/errors/http_error.dto.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AbstractRestService {
  String REST_URL = "http://192.168.1.103:2222/api/v1";

  Future<Response> performJsonPost(BuildContext context, String path, String body, {bool useAuth = true}) async {
    try {
      final response = await http.post(path, body: body, headers: await _authHeaders(context, useAuth: useAuth));
      await _handleError(context, response);
      return response;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      throw ApiException("Internet Error");
    }
  }

  Future<Response> performJsonPut(BuildContext context, String path, String body, {bool useAuth: true}) async {
    final response = await http.put(path, body: body, headers: await _authHeaders(context));
    await _handleError(context, response);
    return response;
  }

  Future<Response> performJsonGet(BuildContext context, String path, {bool useAuth = true, bool useCache = false}) async {
    try {

      // check cache
      if (useCache) {
       final cachedContent = await fetchFromCache(path);
       if (cachedContent != null && cachedContent.isNotEmpty) {
         return Response(cachedContent, 200);
       }
      }

      final response = await http.get(path, headers: await _authHeaders(context, useAuth: useAuth));
      await _handleError(context, response);

      // update cache
      if (useCache) {
        updateCache(path, response);
      }

      return response;
    } on Exception catch(e) {
      print("");
    }
  }

  Future<Response> performJsonDelete(BuildContext context, String path, {bool useAuth = true}) async {
    try {
      final response = await http.delete(path, headers: await _authHeaders(context, useAuth: useAuth));
      await _handleError(context, response);
      return response;
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, "Internet Connection Error");
    }
  }

  Future<void> handleUnknownError(BuildContext context) async {
    // TODO: Localize this
    ToasterBuilder.buildErrorToaster(context, "Something went wrong");
    return;
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

  ////////////////////////////////////////
  // Helpers
  ////////////////////////////////////////
  Future<Map<String, String>> _authHeaders(BuildContext context, {bool useAuth = true}) async {
    Map<String, String> map = {
      "content-type": "application/json",
      "Accept-Language": LocalizationConfig.extractCurrentLocale(context).languageCode,
    };

    if ( useAuth ) {
      String token = "";
      if (authStore.authToken == null || authStore.authToken.isEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        token = prefs.getString("authToken") ?? "";
      } else {
        token = authStore.authToken;
      }
      if ( token != null && token.isNotEmpty ) {
        map["Authorization"] = "Bearer $token";
      }
    }
    return map;
  }

  Future<String> fetchFromCache(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic cachedContent = prefs.getString(url);
    if ( cachedContent != null ) {
      return cachedContent;
    } else {
      return null;
    }
  }

  Future<void> updateCache(String url, Response rsp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(url, decodeBody(rsp));
    return;
  }

  decodeBody(Response rsp) {
    return jsonDecode(Utf8Decoder().convert(rsp.bodyBytes));
  }
}