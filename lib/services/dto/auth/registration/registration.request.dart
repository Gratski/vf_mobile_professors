class RegistrationRequest {
  String email, password, accessCode;
  RegistrationRequest(this.email, this.password, this.accessCode);

  Map<String, dynamic> toJson() => {
    "email": this.email,
    "password": this.password,
    "accessCode": this.accessCode
  };
}