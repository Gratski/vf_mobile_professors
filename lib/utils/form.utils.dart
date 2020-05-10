class FormUtils {

  ///
  /// Validates the given email
  /// True if it has a valid format
  ///
  validateEmail(String email) {
    String pattern = r'^.+@[a-zA-Z-]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  ///
  /// Validates the given password
  /// True if has enough strength
  ///
  validatePasswordStrength(String pwd) {
    return pwd != null && pwd.isNotEmpty && pwd.length >= 8;
  }

}