// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileDetailsState on _ProfileDetailsState, Store {
  final _$isLoadingAtom = Atom(name: '_ProfileDetailsState.isLoading');

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

  final _$idAtom = Atom(name: '_ProfileDetailsState.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$designationAtom = Atom(name: '_ProfileDetailsState.designation');

  @override
  String get designation {
    _$designationAtom.context.enforceReadPolicy(_$designationAtom);
    _$designationAtom.reportObserved();
    return super.designation;
  }

  @override
  set designation(String value) {
    _$designationAtom.context.conditionallyRunInAction(() {
      super.designation = value;
      _$designationAtom.reportChanged();
    }, _$designationAtom, name: '${_$designationAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_ProfileDetailsState.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$quoteAtom = Atom(name: '_ProfileDetailsState.quote');

  @override
  String get quote {
    _$quoteAtom.context.enforceReadPolicy(_$quoteAtom);
    _$quoteAtom.reportObserved();
    return super.quote;
  }

  @override
  set quote(String value) {
    _$quoteAtom.context.conditionallyRunInAction(() {
      super.quote = value;
      _$quoteAtom.reportChanged();
    }, _$quoteAtom, name: '${_$quoteAtom.name}_set');
  }

  final _$_ProfileDetailsStateActionController =
      ActionController(name: '_ProfileDetailsState');

  @override
  dynamic setIsLoading(bool isLoading) {
    final _$actionInfo = _$_ProfileDetailsStateActionController.startAction();
    try {
      return super.setIsLoading(isLoading);
    } finally {
      _$_ProfileDetailsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setId(int id) {
    final _$actionInfo = _$_ProfileDetailsStateActionController.startAction();
    try {
      return super.setId(id);
    } finally {
      _$_ProfileDetailsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDesignation(String designation) {
    final _$actionInfo = _$_ProfileDetailsStateActionController.startAction();
    try {
      return super.setDesignation(designation);
    } finally {
      _$_ProfileDetailsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String description) {
    final _$actionInfo = _$_ProfileDetailsStateActionController.startAction();
    try {
      return super.setDescription(description);
    } finally {
      _$_ProfileDetailsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuote(String quote) {
    final _$actionInfo = _$_ProfileDetailsStateActionController.startAction();
    try {
      return super.setQuote(quote);
    } finally {
      _$_ProfileDetailsStateActionController.endAction(_$actionInfo);
    }
  }
}
