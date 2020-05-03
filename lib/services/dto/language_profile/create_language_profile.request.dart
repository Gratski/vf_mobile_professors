import 'dart:convert';

class CreateLanguageProfileRequest {

  int languageId;
  String designation;
  String description;
  String quote;

  CreateLanguageProfileRequest(this.languageId, this.designation, this.description, this.quote);

  String toJson() => jsonEncode({
    "languageId": this.languageId,
    "designation": this.designation,
    "description": this.description,
    "quote": this.quote
  });
}