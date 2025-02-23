import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/form_validation.constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/localization.config.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/interceptors/auth.interceptor.dart';
import 'package:professors/utils/compression.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AbstractRestService {
  //String REST_URL = "http://192.168.1.103:8080/api/v1";
  String REST_URL = "https://vfbusinessserver.herokuapp.com/api/v1";
  FormValidationConstants formConstants = FormValidationConstants();
  GeneralConstants constants = GeneralConstants();

  Future<Dio> getHttpClient(BuildContext context, {bool useAuth = true}) async {
    BaseOptions options = BaseOptions(receiveTimeout: 10000, connectTimeout: 10000);
    final dio = Dio(options);
    dio.interceptors.add(AuthInterceptor(context));
    return dio;
  }

  Future<dynamic> performJsonPost(
      BuildContext context, String path, String data,
      {bool useAuth = true}) async {
    try {
      final client = await getHttpClient(context);
      final response = await client.post(path, data: data);
      return response.data;
    } catch (e) {
      throw ApiException(e.error);
    }
  }

  Future<void> performJsonPut(
      BuildContext context, String path, String data,
      {bool useAuth: true}) async {
    try {
      final client = await getHttpClient(context);
      await client.put(path, data: data);
      return;
    } catch (e) {
      throw ApiException(e.error);
    }
  }

  Future<Map<String, dynamic>> performJsonGet(BuildContext context, String path,
      {bool useAuth = true, bool useCache = false}) async {
    try {
      final client = await getHttpClient(context);
      final rsp = await client.get(path);
      return rsp.data;
    } catch (e) {
      throw ApiException(e.error);
    }
  }

  Future<void> performJsonDelete(BuildContext context, String path,
      {bool useAuth = true}) async {
    try {
      final client = await getHttpClient(context);
      final rsp = await client.delete(path);
      return;
    } catch(e) {
      throw ApiException(e.error);
    }
  }

  Future<void> uploadFile(BuildContext context, File file, String url) async {
    try {
      var compressedFile = await CompressionUtils().compressAndGetFile(file);
      var stream = new http.ByteStream(
          DelegatingStream.typed(compressedFile.openRead()));
      var length = await compressedFile.length();

      var imageSize = await compressedFile.length();
      if (imageSize > CompressionUtils.MAX_FILE_SIZE) {
        throw ApiException(AppLocalizations.of(context).translate(formConstants.fileIsTooBigError));
      }

      var uri = Uri.parse(url);

      Map<String, String> headers = await _authHeaders(context);
      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(compressedFile.path));

      request.headers.addAll(headers);
      request.files.add(multipartFile);
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        Map<String, dynamic> result = jsonDecode(value);
        int status = result["status"];
        String pictureUrl = result["pictureUrl"];
        if ((pictureUrl != null && pictureUrl.isNotEmpty) ||
            (status == 200 || status == 201)) {
          restServices.getUserService().getUserPersonalDetails(context);
          ToasterBuilder.buildSuccessToaster(context, AppLocalizations.of(context).translate(formConstants.pictureSuccessFullyChanged));
          return;
        } else if (status == 500) {
          throw ApiException(AppLocalizations.of(context).translate(constants.errorWhileUploadingImage));
        } else {
          throw ApiException(AppLocalizations.of(context).translate(constants.somethingWentWrongText));
        }
      });
    } on ApiException catch (e) {
      throw ApiException(e.cause);
    } on Exception catch (e) {
      throw ApiException(AppLocalizations.of(context).translate(constants.somethingWentWrongText));
    }
  }

  ////////////////////////////////////////
  // Helpers
  ////////////////////////////////////////
  Future<Map<String, String>> _authHeaders(BuildContext context,
      {bool useAuth = true}) async {
    Map<String, String> map = {
      "content-type": "application/json",
      "Accept-Language":
          LocalizationConfig.extractCurrentLocale(context).languageCode,
    };

    if (useAuth) {
      String token = "";
      if (authStore.authToken == null || authStore.authToken.isEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        token = prefs.getString("authToken") ?? "";
      } else {
        token = authStore.authToken;
      }
      if (token != null && token.isNotEmpty) {
        map["Authorization"] = "Bearer $token";
      }
    }
    return map;
  }

  String enumToString(dynamic e) {
    return '${e.toString().substring(e.toString().indexOf('.') + 1)}';
  }

  ////////////////////////////////////////
  // Cache Handlers
  ////////////////////////////////////////
  Future<String> fetchFromCache(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cachedContent = prefs.getString(url);
    if (cachedContent != null) {
      return cachedContent;
    } else {
      return null;
    }
  }

}
