import 'dart:convert';

class LoginRequest {
  String email, password, domain;

  LoginRequest(this.email, this.password) {
    this.domain = "PROFESSORS_APP";
  }

  String toJson() => jsonEncode(
        {'email': this.email, 'password': this.password, 'domain': this.domain},
      );
}
