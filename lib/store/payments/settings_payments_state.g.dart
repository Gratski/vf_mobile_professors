// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_payments_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsPaymentsState on _SettingsPaymentsState, Store {
  final _$isLoadingAtom = Atom(name: '_SettingsPaymentsState.isLoading');

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

  final _$balanceAtom = Atom(name: '_SettingsPaymentsState.balance');

  @override
  double get balance {
    _$balanceAtom.context.enforceReadPolicy(_$balanceAtom);
    _$balanceAtom.reportObserved();
    return super.balance;
  }

  @override
  set balance(double value) {
    _$balanceAtom.context.conditionallyRunInAction(() {
      super.balance = value;
      _$balanceAtom.reportChanged();
    }, _$balanceAtom, name: '${_$balanceAtom.name}_set');
  }

  final _$paymentMethodsAtom =
      Atom(name: '_SettingsPaymentsState.paymentMethods');

  @override
  ObservableList<PaymentMethodModel> get paymentMethods {
    _$paymentMethodsAtom.context.enforceReadPolicy(_$paymentMethodsAtom);
    _$paymentMethodsAtom.reportObserved();
    return super.paymentMethods;
  }

  @override
  set paymentMethods(ObservableList<PaymentMethodModel> value) {
    _$paymentMethodsAtom.context.conditionallyRunInAction(() {
      super.paymentMethods = value;
      _$paymentMethodsAtom.reportChanged();
    }, _$paymentMethodsAtom, name: '${_$paymentMethodsAtom.name}_set');
  }

  final _$_SettingsPaymentsStateActionController =
      ActionController(name: '_SettingsPaymentsState');

  @override
  dynamic setIsLoading(bool isLoading) {
    final _$actionInfo = _$_SettingsPaymentsStateActionController.startAction();
    try {
      return super.setIsLoading(isLoading);
    } finally {
      _$_SettingsPaymentsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBalance(double newValue) {
    final _$actionInfo = _$_SettingsPaymentsStateActionController.startAction();
    try {
      return super.setBalance(newValue);
    } finally {
      _$_SettingsPaymentsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPaymentMethods(List<PaymentMethodModel> payments) {
    final _$actionInfo = _$_SettingsPaymentsStateActionController.startAction();
    try {
      return super.setPaymentMethods(payments);
    } finally {
      _$_SettingsPaymentsStateActionController.endAction(_$actionInfo);
    }
  }
}
