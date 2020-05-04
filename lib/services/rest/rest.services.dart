import 'package:professors/services/rest/auth.service.dart';
import 'package:professors/services/rest/countries.service.dart';
import 'package:professors/services/rest/language_profile.service.dart';
import 'package:professors/services/rest/profile_details.service.dart';
import 'package:professors/services/rest/user.service.dart';

class RestServices {

  ///
  /// Gets the authentication service
  ///
  AuthService getAuthRestService() {
    return AuthService();
  }

  ///
  /// Gets user service
  ///
  UserService getUserService() {
    return UserService();
  }

  ///
  /// Gets profile details service
  ///
  ProfileDetailsService getProfileDetailsService() {
    return ProfileDetailsService();
  }

  ///
  /// Gets countries service
  ///
  CountriesService getCountriesService() {
    return CountriesService();
  }

  ///
  /// Gets the language profile service
  ///
  LanguageProfileService getLanguageProfileService() {
    return LanguageProfileService();
  }

}