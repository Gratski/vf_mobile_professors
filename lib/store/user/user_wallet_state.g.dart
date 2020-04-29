// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_wallet_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserWalletState on _UserWalletState, Store {
  final _$isLoadingAtom = Atom(name: '_UserWalletState.isLoading');

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

  final _$balanceAtom = Atom(name: '_UserWalletState.balance');

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

  final _$currencyAtom = Atom(name: '_UserWalletState.currency');

  @override
  CurrencyModel get currency {
    _$currencyAtom.context.enforceReadPolicy(_$currencyAtom);
    _$currencyAtom.reportObserved();
    return super.currency;
  }

  @override
  set currency(CurrencyModel value) {
    _$currencyAtom.context.conditionallyRunInAction(() {
      super.currency = value;
      _$currencyAtom.reportChanged();
    }, _$currencyAtom, name: '${_$currencyAtom.name}_set');
  }

  final _$availableCurrenciesAtom =
      Atom(name: '_UserWalletState.availableCurrencies');

  @override
  ObservableList<CurrencyModel> get availableCurrencies {
    _$availableCurrenciesAtom.context
        .enforceReadPolicy(_$availableCurrenciesAtom);
    _$availableCurrenciesAtom.reportObserved();
    return super.availableCurrencies;
  }

  @override
  set availableCurrencies(ObservableList<CurrencyModel> value) {
    _$availableCurrenciesAtom.context.conditionallyRunInAction(() {
      super.availableCurrencies = value;
      _$availableCurrenciesAtom.reportChanged();
    }, _$availableCurrenciesAtom,
        name: '${_$availableCurrenciesAtom.name}_set');
  }

  final _$_UserWalletStateActionController =
      ActionController(name: '_UserWalletState');

  @override
  dynamic setBalance(double balance) {
    final _$actionInfo = _$_UserWalletStateActionController.startAction();
    try {
      return super.setBalance(balance);
    } finally {
      _$_UserWalletStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrency(CurrencyModel currency) {
    final _$actionInfo = _$_UserWalletStateActionController.startAction();
    try {
      return super.setCurrency(currency);
    } finally {
      _$_UserWalletStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetState() {
    final _$actionInfo = _$_UserWalletStateActionController.startAction();
    try {
      return super.resetState();
    } finally {
      _$_UserWalletStateActionController.endAction(_$actionInfo);
    }
  }
}
