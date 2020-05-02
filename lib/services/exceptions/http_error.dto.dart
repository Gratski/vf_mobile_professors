import 'dart:convert';

class HttpError {
  String timestamp;
  int status;
  String error;
  String message;
  String path;
  HttpError.fromJson(Map<String, dynamic> map)
      : timestamp = map["timestamp"] ??= "",
        status = map["status"] ??= 200,
        error = map["error"] ??= "Oops.. Something went wrong",
        message = map["message"] ??= "Oops.. Something went wrong",
        path = map["path"] ??= "";
}