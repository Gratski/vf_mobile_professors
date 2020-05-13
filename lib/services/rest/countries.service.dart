import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/services/dto/countries/get_countries.response.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';

class CountriesService extends AbstractRestService {

  ///
  /// Gets all countries
  ///
  Future<void> getCountries(BuildContext context) async {
    nationalitiesStore.setIsLoading(true);
    try {
      final rsp = await this.performJsonGet(context, '$REST_URL/countries');
      GetCountriesResponse result = GetCountriesResponse.fromJson(rsp);
      nationalitiesStore.setNationalities(result.countries);
    } on ApiException catch(e) {
      throw e;
    } finally {
      nationalitiesStore.setIsLoading(false);
    }
  }

}