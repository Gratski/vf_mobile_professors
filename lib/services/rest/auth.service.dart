import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:professors/services/dto/auth/registration/registration.request.dart';
import 'package:professors/services/dto/auth/registration/registration.response.dart';
import 'package:professors/services/dto/auth/signin/signin.request.dart';
import 'package:professors/services/dto/auth/signin/signin.response.dart';
import 'package:professors/services/dto/auth/signout/signout.dto.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/exceptions/authentication.exception.dart';
import 'package:professors/services/dto/errors/http_error.dto.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends AbstractRestService {

  ///
  /// Signs the user in
  ///
  Future<LoginResponse> signIn(BuildContext context, String email, String pwd) async {

    LoginRequest request = LoginRequest(email, pwd);
    try {
      final response = await this.performJsonPost(context, '$REST_URL/auth/signin', request.toJson());
      LoginResponse loginRsp = LoginResponse.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('authToken', loginRsp.token);
      return loginRsp;
    } on ApiException catch(e) {
      throw new AuthenticationException(e.cause);
    }

  }

  ///
  /// Signs out the user
  ///
  Future<SignOutResponse> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("authToken");
    return SignOutResponse();
  }

  ///
  /// Validates a user if this is user has already a valid access token
  ///
  Future<RegistrationResponse> registration(String email, String password, String accessCode) async {
    RegistrationRequest request = RegistrationRequest(email, password, accessCode);
    final rsp = await http.post('$REST_URL/registrations/validation', body: request.toJson());

    if( rsp.statusCode != 201 ) {
      //TODO: handle fine grane server messages here
      throw new ApiException('Error during registration');
    }
    RegistrationResponse regRsp = RegistrationResponse.fromJson(jsonDecode(rsp.body));
  }

}