// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_contact_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SupportContactState on _SupportContactState, Store {
  final _$supportTypeAtom = Atom(name: '_SupportContactState.supportType');

  @override
  SupportContactTypeModel get supportType {
    _$supportTypeAtom.context.enforceReadPolicy(_$supportTypeAtom);
    _$supportTypeAtom.reportObserved();
    return super.supportType;
  }

  @override
  set supportType(SupportContactTypeModel value) {
    _$supportTypeAtom.context.conditionallyRunInAction(() {
      super.supportType = value;
      _$supportTypeAtom.reportChanged();
    }, _$supportTypeAtom, name: '${_$supportTypeAtom.name}_set');
  }

  final _$_SupportContactStateActionController =
      ActionController(name: '_SupportContactState');

  @override
  dynamic setContactType(SupportContactTypeModel type) {
    final _$actionInfo = _$_SupportContactStateActionController.startAction();
    try {
      return super.setContactType(type);
    } finally {
      _$_SupportContactStateActionController.endAction(_$actionInfo);
    }
  }
}
