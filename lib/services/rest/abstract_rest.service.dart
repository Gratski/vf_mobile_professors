import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/localization.config.dart';
import 'package:professors/services/dto/errors/http_error.dto.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/exceptions/file_size.exception.dart';
import 'package:professors/utils/compression.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AbstractRestService {
  String REST_URL = "http://192.168.1.103:2222/api/v1";

  Future<Response> performJsonPost(
      BuildContext context, String path, String body,
      {bool useAuth = true}) async {
    try {
      final response = await http.post(path,
          body: body, headers: await _authHeaders(context, useAuth: useAuth));
      await _handleError(context, response);
      return response;
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      throw ApiException("Internet Error");
    }
  }

  Future<Response> performJsonPut(
      BuildContext context, String path, String body,
      {bool useAuth: true}) async {
    final response =
        await http.put(path, body: body, headers: await _authHeaders(context));
    await _handleError(context, response);
    return response;
  }

  Future<Response> performJsonGet(BuildContext context, String path,
      {bool useAuth = true, bool useCache = false}) async {
    try {
      // check cache
      if (useCache) {
        final cachedContent = await fetchFromCache(path);
        if (cachedContent != null && cachedContent.isNotEmpty) {
          return Response(cachedContent, 200);
        }
      }

      final response = await http.get(path,
          headers: await _authHeaders(context, useAuth: useAuth));
      await _handleError(context, response);

      // update cache
      if (useCache) {
        updateCache(path, response);
      }

      return response;
    } on Exception catch (e) {
      print("");
    }
  }

  Future<Response> performJsonDelete(BuildContext context, String path,
      {bool useAuth = true}) async {
    try {
      final response = await http.delete(path,
          headers: await _authHeaders(context, useAuth: useAuth));
      await _handleError(context, response);
      return response;
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      ToasterBuilder.buildErrorToaster(context, "Internet Connection Error");
    }
  }

  Future<void> uploadFile(BuildContext context, File file, String url) async {
    try {
      var compressedFile = await CompressionUtils().compressAndGetFile(file);
      var stream = new http.ByteStream(
          DelegatingStream.typed(compressedFile.openRead()));
      var length = await compressedFile.length();

      var imageSize = await compressedFile.length();
      if (imageSize > 80000) {
        throw FileSizeException("Please choose a smaller picture");
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
          ToasterBuilder.buildSuccessToaster(context, "Picture changed!");
          return;
        } else if (status == 500) {
          throw ToasterBuilder.buildErrorToaster(
              context, "Please consider a smaller file");
        } else {
          throw ToasterBuilder.buildErrorToaster(
              context, "Something went wrong. Please try again later");
        }
      });
    } on FileSizeException catch (e) {
      throw ApiException(e.cause);
    } on Exception catch (e) {
      throw ApiException("Something went wrong.. Please try again");
    }
  }

  ////////////////////////////////////////
  // Error Handlers
  ////////////////////////////////////////
  Future<void> handleUnknownError(BuildContext context) async {
    // TODO: Localize this
    ToasterBuilder.buildErrorToaster(context, "Something went wrong");
    return;
  }

  Future<void> _handleError(BuildContext context, Response response) async {
    if (response.statusCode >= 400) {
      // not authenticated
      if (response.statusCode == 401 || response.statusCode == 403) {
        await restServices.getAuthRestService().signOut();
        Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
      }

      HttpError error = HttpError.fromJson(jsonDecode(response.body));
      throw new ApiException(error.message);
    }
    return;
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

  decodeBody(Response rsp) {
    String jsonStr = Utf8Decoder().convert(rsp.bodyBytes);
    if (jsonStr == null || jsonStr.isEmpty) {
      return {};
    }
    return jsonDecode(jsonStr);
  }

  decodeBodyPayload(String rsp) {
    return jsonDecode(rsp);
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

  Future<void> updateCache(String url, Response rsp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(url, jsonEncode(decodeBody(rsp)));
    return;
  }

  String enumToString(dynamic e) {
    return '${e.toString().substring(e.toString().indexOf('.') + 1)}';
  }
}
