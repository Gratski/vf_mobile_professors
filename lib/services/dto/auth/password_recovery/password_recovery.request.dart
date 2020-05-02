import 'dart:convert';

class PasswordRecoveryRequest {
  String email;
  PasswordRecoveryRequest(this.email);

  String toJson() => jsonEncode({'email': this.email});
}