import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
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
      final rsp = await performJsonGet(context, '$REST_URL/wallet/me/payment-methods');
      List<dynamic> list = rsp["items"];
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
      ToasterBuilder.buildErrorToaster(context, "Something went wrong");
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
      ToasterBuilder.buildErrorToaster(context, "Something went wrong");
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
      ToasterBuilder.buildErrorToaster(context, "Something went wrong");
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
      ToasterBuilder.buildErrorToaster(context, "Something went wrong");
    }
  }

}