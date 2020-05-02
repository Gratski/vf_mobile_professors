// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthState on _AuthState, Store {
  final _$isLoadingAtom = Atom(name: '_AuthState.isLoading');

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

  final _$hasErrorAtom = Atom(name: '_AuthState.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.context.enforceReadPolicy(_$hasErrorAtom);
    _$hasErrorAtom.reportObserved();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.context.conditionallyRunInAction(() {
      super.hasError = value;
      _$hasErrorAtom.reportChanged();
    }, _$hasErrorAtom, name: '${_$hasErrorAtom.name}_set');
  }

  final _$errorMsgAtom = Atom(name: '_AuthState.errorMsg');

  @override
  String get errorMsg {
    _$errorMsgAtom.context.enforceReadPolicy(_$errorMsgAtom);
    _$errorMsgAtom.reportObserved();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.context.conditionallyRunInAction(() {
      super.errorMsg = value;
      _$errorMsgAtom.reportChanged();
    }, _$errorMsgAtom, name: '${_$errorMsgAtom.name}_set');
  }

  final _$_AuthStateActionController = ActionController(name: '_AuthState');

  @override
  dynamic setIsLoading(bool isLoading) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setIsLoading(isLoading);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHasError(bool hasError) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setHasError(hasError);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorMsg(String errorMsg) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setErrorMsg(errorMsg);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }
}
