// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NavState on _NavState, Store {
  final _$bottomNavigationIndexAtom =
      Atom(name: '_NavState.bottomNavigationIndex');

  @override
  int get bottomNavigationIndex {
    _$bottomNavigationIndexAtom.context
        .enforceReadPolicy(_$bottomNavigationIndexAtom);
    _$bottomNavigationIndexAtom.reportObserved();
    return super.bottomNavigationIndex;
  }

  @override
  set bottomNavigationIndex(int value) {
    _$bottomNavigationIndexAtom.context.conditionallyRunInAction(() {
      super.bottomNavigationIndex = value;
      _$bottomNavigationIndexAtom.reportChanged();
    }, _$bottomNavigationIndexAtom,
        name: '${_$bottomNavigationIndexAtom.name}_set');
  }

  final _$_NavStateActionController = ActionController(name: '_NavState');

  @override
  dynamic bottomNavigationTabIndexChangedAction(int value) {
    final _$actionInfo = _$_NavStateActionController.startAction();
    try {
      return super.bottomNavigationTabIndexChangedAction(value);
    } finally {
      _$_NavStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetBottomNavigationIndex() {
    final _$actionInfo = _$_NavStateActionController.startAction();
    try {
      return super.resetBottomNavigationIndex();
    } finally {
      _$_NavStateActionController.endAction(_$actionInfo);
    }
  }
}
