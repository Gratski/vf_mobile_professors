// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_history_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionsHistoryState on _TransactionsHistoryState, Store {
  final _$tabIndexAtom = Atom(name: '_TransactionsHistoryState.tabIndex');

  @override
  int get tabIndex {
    _$tabIndexAtom.context.enforceReadPolicy(_$tabIndexAtom);
    _$tabIndexAtom.reportObserved();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.context.conditionallyRunInAction(() {
      super.tabIndex = value;
      _$tabIndexAtom.reportChanged();
    }, _$tabIndexAtom, name: '${_$tabIndexAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_TransactionsHistoryState.isLoading');

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

  final _$pageNumberAtom = Atom(name: '_TransactionsHistoryState.pageNumber');

  @override
  int get pageNumber {
    _$pageNumberAtom.context.enforceReadPolicy(_$pageNumberAtom);
    _$pageNumberAtom.reportObserved();
    return super.pageNumber;
  }

  @override
  set pageNumber(int value) {
    _$pageNumberAtom.context.conditionallyRunInAction(() {
      super.pageNumber = value;
      _$pageNumberAtom.reportChanged();
    }, _$pageNumberAtom, name: '${_$pageNumberAtom.name}_set');
  }

  final _$pageSizeAtom = Atom(name: '_TransactionsHistoryState.pageSize');

  @override
  int get pageSize {
    _$pageSizeAtom.context.enforceReadPolicy(_$pageSizeAtom);
    _$pageSizeAtom.reportObserved();
    return super.pageSize;
  }

  @override
  set pageSize(int value) {
    _$pageSizeAtom.context.conditionallyRunInAction(() {
      super.pageSize = value;
      _$pageSizeAtom.reportChanged();
    }, _$pageSizeAtom, name: '${_$pageSizeAtom.name}_set');
  }

  final _$transactionsAtom =
      Atom(name: '_TransactionsHistoryState.transactions');

  @override
  ObservableList<TransactionListItem> get transactions {
    _$transactionsAtom.context.enforceReadPolicy(_$transactionsAtom);
    _$transactionsAtom.reportObserved();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<TransactionListItem> value) {
    _$transactionsAtom.context.conditionallyRunInAction(() {
      super.transactions = value;
      _$transactionsAtom.reportChanged();
    }, _$transactionsAtom, name: '${_$transactionsAtom.name}_set');
  }

  final _$_TransactionsHistoryStateActionController =
      ActionController(name: '_TransactionsHistoryState');

  @override
  dynamic setTransactions(List<TransactionListItem> newTransactions) {
    final _$actionInfo =
        _$_TransactionsHistoryStateActionController.startAction();
    try {
      return super.setTransactions(newTransactions);
    } finally {
      _$_TransactionsHistoryStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoading(bool newIsLoading) {
    final _$actionInfo =
        _$_TransactionsHistoryStateActionController.startAction();
    try {
      return super.setIsLoading(newIsLoading);
    } finally {
      _$_TransactionsHistoryStateActionController.endAction(_$actionInfo);
    }
  }
}
