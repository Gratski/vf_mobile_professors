// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_payments_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsPaymentsState on _SettingsPaymentsState, Store {
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

  final _$_SettingsPaymentsStateActionController =
      ActionController(name: '_SettingsPaymentsState');

  @override
  dynamic setBalance(double newValue) {
    final _$actionInfo = _$_SettingsPaymentsStateActionController.startAction();
    try {
      return super.setBalance(newValue);
    } finally {
      _$_SettingsPaymentsStateActionController.endAction(_$actionInfo);
    }
  }
}
