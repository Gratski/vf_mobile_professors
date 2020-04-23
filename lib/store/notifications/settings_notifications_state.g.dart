// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_notifications_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsNotificationsState on _SettingsNotificationsState, Store {
  final _$messageNotificationsActiveAtom =
      Atom(name: '_SettingsNotificationsState.messageNotificationsActive');

  @override
  bool get messageNotificationsActive {
    _$messageNotificationsActiveAtom.context
        .enforceReadPolicy(_$messageNotificationsActiveAtom);
    _$messageNotificationsActiveAtom.reportObserved();
    return super.messageNotificationsActive;
  }

  @override
  set messageNotificationsActive(bool value) {
    _$messageNotificationsActiveAtom.context.conditionallyRunInAction(() {
      super.messageNotificationsActive = value;
      _$messageNotificationsActiveAtom.reportChanged();
    }, _$messageNotificationsActiveAtom,
        name: '${_$messageNotificationsActiveAtom.name}_set');
  }

  final _$reminderNotificationsActiveAtom =
      Atom(name: '_SettingsNotificationsState.reminderNotificationsActive');

  @override
  bool get reminderNotificationsActive {
    _$reminderNotificationsActiveAtom.context
        .enforceReadPolicy(_$reminderNotificationsActiveAtom);
    _$reminderNotificationsActiveAtom.reportObserved();
    return super.reminderNotificationsActive;
  }

  @override
  set reminderNotificationsActive(bool value) {
    _$reminderNotificationsActiveAtom.context.conditionallyRunInAction(() {
      super.reminderNotificationsActive = value;
      _$reminderNotificationsActiveAtom.reportChanged();
    }, _$reminderNotificationsActiveAtom,
        name: '${_$reminderNotificationsActiveAtom.name}_set');
  }

  final _$supportNotificationsActiveAtom =
      Atom(name: '_SettingsNotificationsState.supportNotificationsActive');

  @override
  bool get supportNotificationsActive {
    _$supportNotificationsActiveAtom.context
        .enforceReadPolicy(_$supportNotificationsActiveAtom);
    _$supportNotificationsActiveAtom.reportObserved();
    return super.supportNotificationsActive;
  }

  @override
  set supportNotificationsActive(bool value) {
    _$supportNotificationsActiveAtom.context.conditionallyRunInAction(() {
      super.supportNotificationsActive = value;
      _$supportNotificationsActiveAtom.reportChanged();
    }, _$supportNotificationsActiveAtom,
        name: '${_$supportNotificationsActiveAtom.name}_set');
  }

  final _$_SettingsNotificationsStateActionController =
      ActionController(name: '_SettingsNotificationsState');

  @override
  dynamic setMessageNotificationsActive(bool newValue) {
    final _$actionInfo =
        _$_SettingsNotificationsStateActionController.startAction();
    try {
      return super.setMessageNotificationsActive(newValue);
    } finally {
      _$_SettingsNotificationsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setReminderNotificationsActive(bool newValue) {
    final _$actionInfo =
        _$_SettingsNotificationsStateActionController.startAction();
    try {
      return super.setReminderNotificationsActive(newValue);
    } finally {
      _$_SettingsNotificationsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSupportNotificationsActive(bool newValue) {
    final _$actionInfo =
        _$_SettingsNotificationsStateActionController.startAction();
    try {
      return super.setSupportNotificationsActive(newValue);
    } finally {
      _$_SettingsNotificationsStateActionController.endAction(_$actionInfo);
    }
  }
}
