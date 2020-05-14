import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/services/dto/payments/currency.model.dart';
import 'package:professors/services/dto/payments/payment_method.model.dart';
import 'package:professors/services/exceptions/api.exception.dart';
import 'package:professors/services/rest/abstract_rest.service.dart';
import 'package:professors/visual/builders/toaster.builder.dart';

class WalletService extends AbstractRestService {

  ///
  /// Get the existing payment methods for the given user
  ///
  Future<void> getPaymentMethods(BuildContext context) async {
    // show loader
    paymentsStore.setIsLoading(true);
    try {
      final resultMap = await performJsonGet(context, '$REST_URL/wallet/me/payment-methods');
      List<dynamic> list = resultMap["items"];
      List<PaymentMethodModel> result = List.of([]);
      list.forEach((elem) {
        result.add(PaymentMethodModel(
          elem["id"],
          elem["paymentEmail"],
          elem["isDefault"]
        ));
      },);

      // set the results
      paymentsStore.setPaymentMethods(result);
      // remove loader
      paymentsStore.setIsLoading(false);
    } on ApiException catch (e) {
      throw e;
    } on Exception catch (e) {
      ToasterBuilder.buildErrorToaster(context, AppLocalizations.of(context).translate(constants.somethingWentWrongText));
    }
  }

  ///
  /// Creates a new payment method
  ///
  Future<void> createPaymentMethod(BuildContext context, String email) async {
    try {
      final rsp = await performJsonPost(context, '$REST_URL/wallet/me/payment-methods', jsonEncode({
        "email": email
      },),);
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, AppLocalizations.of(context).translate(constants.somethingWentWrongText));
    }
  }

  ///
  /// Sets a given payment method as default
  ///
  Future<void> setPaymentMethodAsDefault(BuildContext context, int id) async {
    try {
      final rsp = await performJsonPost(context, '$REST_URL/wallet/me/payment-methods/$id/make-default', null);
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, AppLocalizations.of(context).translate(constants.somethingWentWrongText));
    }
  }

  ///
  /// Deletes an existing payment method
  ///
  Future<void> deletePaymentMethod(BuildContext context, int id) async {
    try {
      final rsp = await performJsonDelete(context, '$REST_URL/wallet/me/payment-methods/$id');
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, AppLocalizations.of(context).translate(constants.somethingWentWrongText));
    }
  }

  ///
  /// Gets all available currencies
  ///
  Future<void> getCurrencies(BuildContext context) async {
    userWallet.setIsLoading(true);
    try {
      final rsp = await performJsonGet(context, '$REST_URL/wallet/currencies');

      List<dynamic> list = rsp["items"];
      List<CurrencyModel> result = List.of([]);
      list.forEach((elem) {
        result.add(CurrencyModel(elem["id"], elem["designation"], elem["symbol"]));
      });
      userWallet.setCurrencies(result);
      userWallet.setIsLoading(false);
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, AppLocalizations.of(context).translate(constants.somethingWentWrongText));
    }
  }

  ///
  /// Gets the user currency
  ///
  Future<void> getUserCurrency(BuildContext context) async {
    userWallet.setIsLoading(true);
    try {
      final rsp = await performJsonGet(context, '$REST_URL/wallet/me/currency');
      userWallet.setCurrency(CurrencyModel(rsp["id"], rsp["designation"], rsp["symbol"]));
      userWallet.setIsLoading(false);
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, AppLocalizations.of(context).translate(constants.somethingWentWrongText));
    }
  }

  ///
  /// Updates user currency
  ///
  Future<void> updateCurrency(BuildContext context, int currencyId) async {
    userWallet.setIsUpdating(true);
    try {
      await performJsonPut(context, '$REST_URL/wallet/me/currency', jsonEncode(
        {
          "id": currencyId
        }
      ));
      userWallet.setIsUpdating(false);
    } on ApiException catch(e) {
      throw e;
    } on Exception catch(e) {
      ToasterBuilder.buildErrorToaster(context, AppLocalizations.of(context).translate(constants.somethingWentWrongText));
    }
  }

}