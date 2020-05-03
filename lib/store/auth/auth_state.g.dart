// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthState on _AuthState, Store {
  final _$authTokenAtom = Atom(name: '_AuthState.authToken');

  @override
  String get authToken {
    _$authTokenAtom.context.enforceReadPolicy(_$authTokenAtom);
    _$authTokenAtom.reportObserved();
    return super.authToken;
  }

  @override
  set authToken(String value) {
    _$authTokenAtom.context.conditionallyRunInAction(() {
      super.authToken = value;
      _$authTokenAtom.reportChanged();
    }, _$authTokenAtom, name: '${_$authTokenAtom.name}_set');
  }

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

  final _$registerIsLoadingAtom = Atom(name: '_AuthState.registerIsLoading');

  @override
  bool get registerIsLoading {
    _$registerIsLoadingAtom.context.enforceReadPolicy(_$registerIsLoadingAtom);
    _$registerIsLoadingAtom.reportObserved();
    return super.registerIsLoading;
  }

  @override
  set registerIsLoading(bool value) {
    _$registerIsLoadingAtom.context.conditionallyRunInAction(() {
      super.registerIsLoading = value;
      _$registerIsLoadingAtom.reportChanged();
    }, _$registerIsLoadingAtom, name: '${_$registerIsLoadingAtom.name}_set');
  }

  final _$_AuthStateActionController = ActionController(name: '_AuthState');

  @override
  dynamic setAuthToken(String authToken) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setAuthToken(authToken);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic setPasswordRecoveryIsLoading(bool isLoading) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setPasswordRecoveryIsLoading(isLoading);
    } finally {
      _$_AuthStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRegisterIsLoading(bool isLoading) {
    final _$actionInfo = _$_AuthStateActionController.startAction();
    try {
      return super.setRegisterIsLoading(isLoading);
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
