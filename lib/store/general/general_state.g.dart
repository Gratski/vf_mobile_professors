// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GeneralState on _GeneralState, Store {
  final _$isReadyAtom = Atom(name: '_GeneralState.isReady');

  @override
  bool get isReady {
    _$isReadyAtom.context.enforceReadPolicy(_$isReadyAtom);
    _$isReadyAtom.reportObserved();
    return super.isReady;
  }

  @override
  set isReady(bool value) {
    _$isReadyAtom.context.conditionallyRunInAction(() {
      super.isReady = value;
      _$isReadyAtom.reportChanged();
    }, _$isReadyAtom, name: '${_$isReadyAtom.name}_set');
  }

  final _$categoriesAtom = Atom(name: '_GeneralState.categories');

  @override
  ObservableList<CategoryModel> get categories {
    _$categoriesAtom.context.enforceReadPolicy(_$categoriesAtom);
    _$categoriesAtom.reportObserved();
    return super.categories;
  }

  @override
  set categories(ObservableList<CategoryModel> value) {
    _$categoriesAtom.context.conditionallyRunInAction(() {
      super.categories = value;
      _$categoriesAtom.reportChanged();
    }, _$categoriesAtom, name: '${_$categoriesAtom.name}_set');
  }

  final _$_GeneralStateActionController =
      ActionController(name: '_GeneralState');

  @override
  dynamic setCategories(List<CategoryModel> categories) {
    final _$actionInfo = _$_GeneralStateActionController.startAction();
    try {
      return super.setCategories(categories);
    } finally {
      _$_GeneralStateActionController.endAction(_$actionInfo);
    }
  }
}
