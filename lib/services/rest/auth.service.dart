import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:professors/services/dto/auth/registration/registration.request.dart';
import 'package:professors/services/dto/auth/registration/registration.response.dart';
import 'package:professors/services/dto/auth/signin/login.request.dart';
import 'package:professors/services/dto/auth/signin/login.response.dart';
import 'package:professors/services/dto/auth/signout/signout.dto.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/exceptions/authentication.exception.dart';
import 'package:professors/services/exceptions/http_error.dto.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends AbstractRestService {

  ///
  /// Signs the user in
  ///
  Future<LoginResponse> signIn(String email, String pwd) async {
    LoginRequest request = LoginRequest(email, pwd);
    final response = await http.post('$REST_URL/auth/signin', body: request.toJson(), headers: {
      "content-type": "application/json"
    });
    if( response.statusCode >= 400 ) {
      HttpError error = HttpError.fromJson(jsonDecode(response.body));
      throw new AuthenticationException(error.message);
    }

    LoginResponse loginRsp = LoginResponse.fromJson(jsonDecode(response.body));
    // store token in shared preferences and in user store
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', loginRsp.token);

    return loginRsp;
  }

  ///
  /// Signs out the user
  ///
  Future<SignOutResponse> signOut() async {
    // remove token from shared prefs and from user store
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