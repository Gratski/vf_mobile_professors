import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:professors/globals/global_vars.dart';
import 'package:professors/services/dto/auth/password_recovery/password_recovery.request.dart';
import 'package:professors/services/dto/auth/password_recovery/password_recovery.response.dart';
import 'package:professors/services/dto/auth/registration/registration.request.dart';
import 'package:professors/services/dto/auth/registration/registration.response.dart';
import 'package:professors/services/dto/auth/signin/signin.request.dart';
import 'package:professors/services/dto/auth/signin/signin.response.dart';
import 'package:professors/services/dto/auth/signout/signout.dto.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/exceptions/authentication.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends AbstractRestService {

  ///
  /// Signs the user in
  ///
  Future<LoginResponse> signIn(BuildContext context, String email, String pwd) async {

    LoginRequest request = LoginRequest(email, pwd);
    try {
      final response = await this.performJsonPost(context, '$REST_URL/auth/signin', request.toJson(), useAuth: false);
      LoginResponse loginRsp = LoginResponse.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('authToken', loginRsp.token);
      authStore.setAuthToken(loginRsp.token);
      return loginRsp;
    } on ApiException catch(e) {
      throw AuthenticationException(e.cause);
    } on Exception catch(e) {
      throw AuthenticationException('Internet Connection Error');
    }

  }

  ///
  /// Signs out the user
  ///
  Future<SignOutResponse> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("authToken");
    authStore.setAuthToken(null);
    return SignOutResponse();
  }

  ///
  /// Validates a user if this is user has already a valid access token
  ///
  Future<RegistrationResponse> registration(BuildContext context, String email, String password, String accessCode) async {
    RegistrationRequest request = RegistrationRequest(email, password, accessCode);
    try {
      final rsp = await performJsonPost(context, '$REST_URL/registrations/professor/validation', request.toJson(), useAuth: false);
      RegistrationResponse result = RegistrationResponse();
      return result;
    } on ApiException catch(e) {
      throw new ApiException(e.cause);
    }
  }

  ///
  /// Recovers the password for a given user
  Future<PasswordRecoveryResponse> passwordRecovery(BuildContext context, String email) async {
    PasswordRecoveryRequest request = PasswordRecoveryRequest(email);
    try {
      final response = await performJsonPost(context, '$REST_URL/auth/password-recovery', request.toJson(), useAuth: false);
      PasswordRecoveryResponse result = PasswordRecoveryResponse();
      return result;
    } on ApiException catch(e) {
      throw new ApiException(e.cause);
    }
  }

}