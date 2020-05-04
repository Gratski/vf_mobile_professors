import 'package:professors/models/language.model.dart';

class GetLanguagesResponse {

  List<LanguageModel> languages;
  GetLanguagesResponse.fromJson(Map<String, dynamic> map) {
    this.languages = this.mapper(map["items"]);
  }

  @override
  List<LanguageModel> mapper(List<dynamic> list) {
    List<LanguageModel> result = List.of([]);
    list.forEach(
      (elem) {
        result.add(LanguageModel(elem["id"], elem["designation"]));
      },
    );
    return result;
  }
}
