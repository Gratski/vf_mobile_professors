import 'package:professors/services/rest/auth.service.dart';
import 'package:professors/services/rest/language_profile.service.dart';

class RestServices {

  ///
  /// Gets the authentication service
  ///
  AuthService getAuthRestService() {
    return AuthService();
  }

  ///
  /// Gets the language profile service
  ///
  LanguageProfileService getLanguageProfileService() {
    return LanguageProfileService();
  }

}