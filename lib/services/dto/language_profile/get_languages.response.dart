import 'package:professors/models/language.model.dart';

class GetLanguagesResponse {

  List<LanguageModel> languages;
  GetLanguagesResponse.fromJson(Map<String, dynamic> map) {
    this.languages = this.mapper(map);
  }

  @override
  List<LanguageModel> mapper(Map<String, dynamic> map) {
    List<Map<String, dynamic>> list = map["items"];
    List<LanguageModel> result = List.of([]);
    list.forEach(
      (elem) {
        result.add(LanguageModel(elem["id"], elem["designation"]));
      },
    );
    return result;
  }
}
