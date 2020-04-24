// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_payment_methods_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsPaymentMethodsState on _SettingsPaymentMethodsState, Store {
  final _$accountsAtom = Atom(name: '_SettingsPaymentMethodsState.accounts');

  @override
  ObservableList<PaymentAccountListItem> get accounts {
    _$accountsAtom.context.enforceReadPolicy(_$accountsAtom);
    _$accountsAtom.reportObserved();
    return super.accounts;
  }

  @override
  set accounts(ObservableList<PaymentAccountListItem> value) {
    _$accountsAtom.context.conditionallyRunInAction(() {
      super.accounts = value;
      _$accountsAtom.reportChanged();
    }, _$accountsAtom, name: '${_$accountsAtom.name}_set');
  }

  final _$_SettingsPaymentMethodsStateActionController =
      ActionController(name: '_SettingsPaymentMethodsState');

  @override
  dynamic setAccounts(List<PaymentAccountListItem> accounts) {
    final _$actionInfo =
        _$_SettingsPaymentMethodsStateActionController.startAction();
    try {
      return super.setAccounts(accounts);
    } finally {
      _$_SettingsPaymentMethodsStateActionController.endAction(_$actionInfo);
    }
  }
}
