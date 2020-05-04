import 'package:professors/models/country.model.dart';

class GetCountriesResponse {

  List<CountryModel> countries;
  GetCountriesResponse.fromJson(Map<String, dynamic> map) :
      this.countries = _mapper(map["items"]);

  static List<CountryModel> _mapper(List<dynamic> list) {
    List<CountryModel> result = List.of([]);
    list.forEach((v) {
      CountryModel cur = CountryModel(
        v["id"],
        v["countryName"],
        v["countryCode"],
      );
      result.add(cur);
    });
    return result;
  }

}