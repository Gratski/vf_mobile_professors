import 'dart:convert';

class RegistrationRequest {
  String email, password, accessCode;
  RegistrationRequest(this.email, this.password, this.accessCode);

  String toJson() => jsonEncode(
      {
        "email": this.email,
        "password": this.password,
        "accessCode": this.accessCode
      }
  );
}