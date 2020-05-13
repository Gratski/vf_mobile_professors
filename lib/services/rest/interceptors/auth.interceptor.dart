import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/localization.config.dart';
import 'package:professors/services/dto/errors/http_error.dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {

  GeneralConstants constants = GeneralConstants();
  final BuildContext context;
  AuthInterceptor(this.context);

  @override
  Future onRequest(RequestOptions options) async {
    if (!(options.path.contains("/auth/signin") || options.path.contains("/registrations") || options.path.contains("/password-recovery"))) {
      options = await _authHeaders(context, options, useAuth: true);
    } else {
      options = await _authHeaders(context, options, useAuth: false);
    }

    print("Making request ${options.path}");
    super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    // if is authentication problem
    if ( response.statusCode == 401 || response.statusCode == 403 ) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("authToken");
      authStore.setAuthToken(null);
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
    }

    // if sent error status
    if ( response.statusCode != 200 && response.statusCode != 201 ) {
      print("Handle error");
    }
    super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    // connection broke
    if (err.response == null) {
      return AppLocalizations.of(context).translate(constants.somethingWentWrongText);
    }
    // forbidden access
    if ( err.response.statusCode == 401 || err.response.statusCode == 403 ) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("authToken");
      authStore.setAuthToken(null);
      Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      return;
    }

    // general error handling
    final error = HttpError.fromJson(err.response.data);
    return error.message;

  }

  Future<RequestOptions> _authHeaders(BuildContext context, RequestOptions options,
      {bool useAuth = true}) async {
    options.headers["content-type"] = "application/json";
    options.headers["Accept-Language"] = LocalizationConfig.extractCurrentLocale(context).languageCode;

    if (useAuth) {
      String token = "";
      if (authStore.authToken == null || authStore.authToken.isEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        token = prefs.getString("authToken") ?? "";
      } else {
        token = authStore.authToken;
      }
      if (token != null && token.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $token";
      }
    }
    return options;
  }

  decodeBody(String msg) {
    /*String jsonStr = Utf8Decoder().convert(rsp.bodyBytes);
    if (jsonStr == null || jsonStr.isEmpty) {
      return {};
    }
    return jsonDecode(jsonStr);
    */
  }

}