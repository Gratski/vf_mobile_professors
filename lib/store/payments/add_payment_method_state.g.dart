// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_payment_method_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddPaymentMethodState on _AddPaymentMethodState, Store {
  final _$isLoadingAtom = Atom(name: '_AddPaymentMethodState.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_AddPaymentMethodState.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$_AddPaymentMethodStateActionController =
      ActionController(name: '_AddPaymentMethodState');

  @override
  dynamic setIsLoading(bool isLoading) {
    final _$actionInfo = _$_AddPaymentMethodStateActionController.startAction();
    try {
      return super.setIsLoading(isLoading);
    } finally {
      _$_AddPaymentMethodStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String email) {
    final _$actionInfo = _$_AddPaymentMethodStateActionController.startAction();
    try {
      return super.setEmail(email);
    } finally {
      _$_AddPaymentMethodStateActionController.endAction(_$actionInfo);
    }
  }
}
