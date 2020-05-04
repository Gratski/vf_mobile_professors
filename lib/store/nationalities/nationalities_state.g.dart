// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nationalities_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NationalitiesState on _NationalitiesState, Store {
  final _$isLoadingAtom = Atom(name: '_NationalitiesState.isLoading');

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

  final _$nationalitiesAtom = Atom(name: '_NationalitiesState.nationalities');

  @override
  ObservableList<CountryModel> get nationalities {
    _$nationalitiesAtom.context.enforceReadPolicy(_$nationalitiesAtom);
    _$nationalitiesAtom.reportObserved();
    return super.nationalities;
  }

  @override
  set nationalities(ObservableList<CountryModel> value) {
    _$nationalitiesAtom.context.conditionallyRunInAction(() {
      super.nationalities = value;
      _$nationalitiesAtom.reportChanged();
    }, _$nationalitiesAtom, name: '${_$nationalitiesAtom.name}_set');
  }

  final _$_NationalitiesStateActionController =
      ActionController(name: '_NationalitiesState');

  @override
  dynamic setIsLoading(bool isLoading) {
    final _$actionInfo = _$_NationalitiesStateActionController.startAction();
    try {
      return super.setIsLoading(isLoading);
    } finally {
      _$_NationalitiesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNationalities(List<CountryModel> list) {
    final _$actionInfo = _$_NationalitiesStateActionController.startAction();
    try {
      return super.setNationalities(list);
    } finally {
      _$_NationalitiesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearNationalities() {
    final _$actionInfo = _$_NationalitiesStateActionController.startAction();
    try {
      return super.clearNationalities();
    } finally {
      _$_NationalitiesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetState() {
    final _$actionInfo = _$_NationalitiesStateActionController.startAction();
    try {
      return super.resetState();
    } finally {
      _$_NationalitiesStateActionController.endAction(_$actionInfo);
    }
  }
}
