// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationsState on _NotificationsState, Store {
  final _$isLoadingNextAtom = Atom(name: '_NotificationsState.isLoadingNext');

  @override
  bool get isLoadingNext {
    _$isLoadingNextAtom.context.enforceReadPolicy(_$isLoadingNextAtom);
    _$isLoadingNextAtom.reportObserved();
    return super.isLoadingNext;
  }

  @override
  set isLoadingNext(bool value) {
    _$isLoadingNextAtom.context.conditionallyRunInAction(() {
      super.isLoadingNext = value;
      _$isLoadingNextAtom.reportChanged();
    }, _$isLoadingNextAtom, name: '${_$isLoadingNextAtom.name}_set');
  }

  final _$isLoadingPreviousAtom =
      Atom(name: '_NotificationsState.isLoadingPrevious');

  @override
  bool get isLoadingPrevious {
    _$isLoadingPreviousAtom.context.enforceReadPolicy(_$isLoadingPreviousAtom);
    _$isLoadingPreviousAtom.reportObserved();
    return super.isLoadingPrevious;
  }

  @override
  set isLoadingPrevious(bool value) {
    _$isLoadingPreviousAtom.context.conditionallyRunInAction(() {
      super.isLoadingPrevious = value;
      _$isLoadingPreviousAtom.reportChanged();
    }, _$isLoadingPreviousAtom, name: '${_$isLoadingPreviousAtom.name}_set');
  }

  final _$pageAtom = Atom(name: '_NotificationsState.page');

  @override
  int get page {
    _$pageAtom.context.enforceReadPolicy(_$pageAtom);
    _$pageAtom.reportObserved();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.context.conditionallyRunInAction(() {
      super.page = value;
      _$pageAtom.reportChanged();
    }, _$pageAtom, name: '${_$pageAtom.name}_set');
  }

  final _$sizeAtom = Atom(name: '_NotificationsState.size');

  @override
  int get size {
    _$sizeAtom.context.enforceReadPolicy(_$sizeAtom);
    _$sizeAtom.reportObserved();
    return super.size;
  }

  @override
  set size(int value) {
    _$sizeAtom.context.conditionallyRunInAction(() {
      super.size = value;
      _$sizeAtom.reportChanged();
    }, _$sizeAtom, name: '${_$sizeAtom.name}_set');
  }

  final _$notificationsAtom = Atom(name: '_NotificationsState.notifications');

  @override
  ObservableList<NotificationsModel> get notifications {
    _$notificationsAtom.context.enforceReadPolicy(_$notificationsAtom);
    _$notificationsAtom.reportObserved();
    return super.notifications;
  }

  @override
  set notifications(ObservableList<NotificationsModel> value) {
    _$notificationsAtom.context.conditionallyRunInAction(() {
      super.notifications = value;
      _$notificationsAtom.reportChanged();
    }, _$notificationsAtom, name: '${_$notificationsAtom.name}_set');
  }

  final _$_NotificationsStateActionController =
      ActionController(name: '_NotificationsState');

  @override
  dynamic setMessageNotificationsActive(
      List<NotificationsModel> newNotifications) {
    final _$actionInfo = _$_NotificationsStateActionController.startAction();
    try {
      return super.setMessageNotificationsActive(newNotifications);
    } finally {
      _$_NotificationsStateActionController.endAction(_$actionInfo);
    }
  }
}
