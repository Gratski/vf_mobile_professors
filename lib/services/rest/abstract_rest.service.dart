import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/services/dto/errors/http_error.dto.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/exceptions/authentication.exception.dart';

abstract class AbstractRestService {
  String REST_URL = "http://192.168.1.103:2222/api/v1";

  Future<Response> performJsonPost(BuildContext context, String path, String body) async {
    final response = await http.post(path, body: body, headers: {
      "content-type": "application/json"
    });
    if( response.statusCode >= 400 ) {

      // not authenticated
      if ( response.statusCode == 401 || response.statusCode == 403 ) {
        await restServices.getAuthRestService().signOut();
        Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
      }

      HttpError error = HttpError.fromJson(jsonDecode(response.body));
      throw new ApiException(error.message);
    }

    return response;
  }
}