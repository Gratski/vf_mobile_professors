// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangePasswordState on _ChangePasswordState, Store {
  final _$isLoadingAtom = Atom(name: '_ChangePasswordState.isLoading');

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

  final _$_ChangePasswordStateActionController =
      ActionController(name: '_ChangePasswordState');

  @override
  dynamic setIsLoading(bool isLoading) {
    final _$actionInfo = _$_ChangePasswordStateActionController.startAction();
    try {
      return super.setIsLoading(isLoading);
    } finally {
      _$_ChangePasswordStateActionController.endAction(_$actionInfo);
    }
  }
}
