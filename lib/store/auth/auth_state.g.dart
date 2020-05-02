// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthState on _AuthState, Store {
  final _$loginIsLoadingAtom = Atom(name: '_AuthState.loginIsLoading');

  @override
  bool get loginIsLoading {
    _$loginIsLoadingAtom.context.enforceReadPolicy(_$loginIsLoadingAtom);
    _$loginIsLoadingAtom.reportObserved();
    return super.loginIsLoading;
  }

  @override
  set loginIsLoading(bool value) {
    _$loginIsLoadingAtom.context.conditionallyRunInAction(() {
      super.loginIsLoading = value;
      _$loginIsLoadingAtom.reportChanged();
    }, _$loginIsLoadingAtom, name: '${_$loginIsLoadingAtom.name}_set');
  }

  final _$loginHasErrorAtom = Atom(name: '_AuthState.loginHasError');

  @override
  bool get loginHasError {
    _$loginHasErrorAtom.context.enforceReadPolicy(_$loginHasErrorAtom);
    _$loginHasErrorAtom.reportObserved();
    return super.loginHasError;
  }

  @override
  set loginHasError(bool value) {
    _$loginHasErrorAtom.context.conditionallyRunInAction(() {
      super.loginHasError = value;
      _$loginHasErrorAtom.reportChanged();
    }, _$loginHasErrorAtom, name: '${_$loginHasErrorAtom.name}_set');
  }

  final _$loginErrorMsgAtom = Atom(name: '_AuthState.loginErrorMsg');

  @override
  String get loginErrorMsg {
    _$loginErrorMsgAtom.context.enforceReadPolicy(_$loginErrorMsgAtom);
    _$loginErrorMsgAtom.reportObserved();
    return super.loginErrorMsg;
  }

  @override
  set loginErrorMsg(String value) {
    _$loginErrorMsgAtom.context.conditionallyRunInAction(() {
      super.loginErrorMsg = value;
      _$loginErrorMsgAtom.reportChanged();
    }, _$loginErrorMsgAtom, name: '${_$loginErrorMsgAtom.name}_set');
  }

  final _$passwordRecoveryIsLoadingAtom =
      Atom(name: '_AuthState.passwordRecoveryIsLoading');

  @override
  bool get passwordRecoveryIsLoading {
    _$passwordRecoveryIsLoadingAtom.context
        .enforceReadPolicy(_$passwordRecoveryIsLoadingAtom);
    _$passwordRecoveryIsLoadingAtom.reportObserved();
    return super.passwordRecoveryIsLoading;
  }

  @override
  set passwordRecoveryIsLoading(bool value) {
    _$passwordRecoveryIsLoadingAtom.context.conditionallyRunInAction(() {
      super.passwordRecoveryIsLoading = value;
      _$passwordRecoveryIsLoadingAtom.reportChanged();
    }, _$passwordRecoveryIsLoadingAtom,
        name: '${_$passwordRecoveryIsLoadingAtom.name}_set');
  }

  final _$passwordRecoveryHasErrorAtom =
      Atom(name: '_AuthState.passwordRecoveryHasError');

  @override
  bool get passwordRecoveryHasError {
    _$passwordRecoveryHasErrorAtom.context
        .enforceReadPolicy(_$passwordRecoveryHasErrorAtom);
    _$passwordRecoveryHasErrorAtom.reportObserved();
    return super.passwordRecoveryHasError;
  }

  @override
  set passwordRecoveryHasError(bool value) {
    _$passwordRecoveryHasErrorAtom.context.conditionallyRunInAction(() {
      super.passwordRecoveryHasError = value;
      _$passwordRecoveryHasErrorAtom.reportChanged();
    }, _$passwordRecoveryHasErrorAtom,
        name: '${_$passwordRecoveryHasErrorAtom.name}_set');
  }

  final _$passwordRecoveryErrorMsgAtom =
      Atom(name: '_AuthState.passwordRecoveryErrorMsg');

  @override
  String get passwordRecoveryErrorMsg {
    _$passwordRecoveryErrorMsgAtom.context
        .enforceReadPolicy(_$passwordRecoveryErrorMsgAtom);
    _$passwordRecoveryErrorMsgAtom.reportObserved();
    return super.passwordRecoveryErrorMsg;
  }

  @override
  set passwordRecoveryErrorMsg(String value) {
    _$passwordRecoveryErrorMsgAtom.context.conditionallyRunInAction(() {
      super.passwordRecoveryErrorMsg = value;
      _$passwordRecoveryErrorMsgAtom.reportChanged();
    }, _$passwordRecoveryErrorMsgAtom,
        name: '${_$passwordRecoveryErrorMsgAtom.name}_set');
  }

  final _$passwordRecoveryHasSucceededAtom =
      Atom(name: '_AuthState.passwordRecoveryHasSucceeded');

  @override
  bool get passwordRecoveryHasSucceeded {
    _$passwordRecoveryHasSucceededAtom.context
        .enforceReadPolicy(_$passwordRecoveryHasSucceededAtom);
    _$passwordRecoveryHasSucceededAtom.reportObserved();
    return super.passwordRecoveryHasSucceeded;
  }

  @override
  set passwordRecoveryHasSucceeded(bool value) {
    _$passwordRecoveryHasSucceededAtom.context.conditionallyRunInAction(() {
      super.passwordRecoveryHasSucceeded = value;
      _$passwordRecoveryHasSucceededAtom.reportChanged();
    }, _$passwordRecoveryHasSucceededAtom,
        name: '${_$passwordRecoveryHasSucceededAtom.name}_set');
  }

  final _$_AuthStateActionController = ActionController(name: '_AuthState');

  @override
  dynamic setLoginIsLoading(bool isLoading) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setLoginIsLoading(isLoading);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoginHasError(bool hasError) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setLoginHasError(hasError);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoginErrorMsg(String errorMsg) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setLoginErrorMsg(errorMsg);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswordRecoveryIsLoading(bool isLoading) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setPasswordRecoveryIsLoading(isLoading);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswordRecoveryHasError(bool hasError) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setPasswordRecoveryHasError(hasError);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswordRecoveryErrorMsg(String errorMsg) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setPasswordRecoveryErrorMsg(errorMsg);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswordRecoveryHasSucceeded(bool hasSucceeded) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setPasswordRecoveryHasSucceeded(hasSucceeded);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.reset();
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }
}
