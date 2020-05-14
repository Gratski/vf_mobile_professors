import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/models/country.model.dart';
import 'package:professors/services/dto/countries/get_countries.response.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class CountriesService extends AbstractRestService {

  ///
  /// Gets all countries
  ///
  Future<List<CountryModel>> getCountries(BuildContext context) async {
    try {
      final rsp = await this.performJsonGet(context, '$REST_URL/countries');
      GetCountriesResponse result = GetCountriesResponse.fromJson(rsp);
      return result.countries;
    } on ApiException catch(e) {
      throw e;
    }
  }

}