import 'dart:convert';

class UpdateLanguageProfileRequest {

  String designation, description, quote;
  UpdateLanguageProfileRequest(this.designation, this.description, this.quote);

  String toJson() => jsonEncode({
    "designation": this.designation,
    "description": this.description,
    "quote": this.quote
  });

}