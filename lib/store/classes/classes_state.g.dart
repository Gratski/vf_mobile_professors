// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classes_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassesState on _ClassesState, Store {
  final _$isLoadingAtom = Atom(name: '_ClassesState.isLoading');

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

  final _$isLoadingPreviousAtom = Atom(name: '_ClassesState.isLoadingPrevious');

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

  final _$isLoadingNextAtom = Atom(name: '_ClassesState.isLoadingNext');

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

  final _$pageNumberAtom = Atom(name: '_ClassesState.pageNumber');

  @override
  int get pageNumber {
    _$pageNumberAtom.context.enforceReadPolicy(_$pageNumberAtom);
    _$pageNumberAtom.reportObserved();
    return super.pageNumber;
  }

  @override
  set pageNumber(int value) {
    _$pageNumberAtom.context.conditionallyRunInAction(() {
      super.pageNumber = value;
      _$pageNumberAtom.reportChanged();
    }, _$pageNumberAtom, name: '${_$pageNumberAtom.name}_set');
  }

  final _$itemsPerPageAtom = Atom(name: '_ClassesState.itemsPerPage');

  @override
  int get itemsPerPage {
    _$itemsPerPageAtom.context.enforceReadPolicy(_$itemsPerPageAtom);
    _$itemsPerPageAtom.reportObserved();
    return super.itemsPerPage;
  }

  @override
  set itemsPerPage(int value) {
    _$itemsPerPageAtom.context.conditionallyRunInAction(() {
      super.itemsPerPage = value;
      _$itemsPerPageAtom.reportChanged();
    }, _$itemsPerPageAtom, name: '${_$itemsPerPageAtom.name}_set');
  }

  final _$sizeAtom = Atom(name: '_ClassesState.size');

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

  final _$classesAtom = Atom(name: '_ClassesState.classes');

  @override
  ObservableList<ClassListItemModel> get classes {
    _$classesAtom.context.enforceReadPolicy(_$classesAtom);
    _$classesAtom.reportObserved();
    return super.classes;
  }

  @override
  set classes(ObservableList<ClassListItemModel> value) {
    _$classesAtom.context.conditionallyRunInAction(() {
      super.classes = value;
      _$classesAtom.reportChanged();
    }, _$classesAtom, name: '${_$classesAtom.name}_set');
  }

  final _$_ClassesStateActionController =
      ActionController(name: '_ClassesState');

  @override
  dynamic setIsLoading(bool isLoading) {
    final _$actionInfo = _$_ClassesStateActionController.startAction();
    try {
      return super.setIsLoading(isLoading);
    } finally {
      _$_ClassesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoadingPrevious(bool isLoading) {
    final _$actionInfo = _$_ClassesStateActionController.startAction();
    try {
      return super.setIsLoadingPrevious(isLoading);
    } finally {
      _$_ClassesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoadingNext(bool isLoading) {
    final _$actionInfo = _$_ClassesStateActionController.startAction();
    try {
      return super.setIsLoadingNext(isLoading);
    } finally {
      _$_ClassesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addNextPageClasses(List<ClassListItemModel> page) {
    final _$actionInfo = _$_ClassesStateActionController.startAction();
    try {
      return super.addNextPageClasses(page);
    } finally {
      _$_ClassesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPreviousPageClasses(List<ClassListItemModel> page) {
    final _$actionInfo = _$_ClassesStateActionController.startAction();
    try {
      return super.addPreviousPageClasses(page);
    } finally {
      _$_ClassesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPageNumber(int pageNumber) {
    final _$actionInfo = _$_ClassesStateActionController.startAction();
    try {
      return super.setPageNumber(pageNumber);
    } finally {
      _$_ClassesStateActionController.endAction(_$actionInfo);
    }
  }
}
