import 'package:professors/services/rest/auth.service.dart';

class RestServices {

  ///
  /// Gets the authentication service
  ///
  AuthService getAuthRestService() {
    return AuthService();
  }

}