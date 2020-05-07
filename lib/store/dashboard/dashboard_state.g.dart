// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardState on _DashboardState, Store {
  final _$isLoadingAtom = Atom(name: '_DashboardState.isLoading');

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

  final _$isClassesLoadingAtom = Atom(name: '_DashboardState.isClassesLoading');

  @override
  bool get isClassesLoading {
    _$isClassesLoadingAtom.context.enforceReadPolicy(_$isClassesLoadingAtom);
    _$isClassesLoadingAtom.reportObserved();
    return super.isClassesLoading;
  }

  @override
  set isClassesLoading(bool value) {
    _$isClassesLoadingAtom.context.conditionallyRunInAction(() {
      super.isClassesLoading = value;
      _$isClassesLoadingAtom.reportChanged();
    }, _$isClassesLoadingAtom, name: '${_$isClassesLoadingAtom.name}_set');
  }

  final _$scoreAtom = Atom(name: '_DashboardState.score');

  @override
  double get score {
    _$scoreAtom.context.enforceReadPolicy(_$scoreAtom);
    _$scoreAtom.reportObserved();
    return super.score;
  }

  @override
  set score(double value) {
    _$scoreAtom.context.conditionallyRunInAction(() {
      super.score = value;
      _$scoreAtom.reportChanged();
    }, _$scoreAtom, name: '${_$scoreAtom.name}_set');
  }

  final _$totalCommentsAtom = Atom(name: '_DashboardState.totalComments');

  @override
  int get totalComments {
    _$totalCommentsAtom.context.enforceReadPolicy(_$totalCommentsAtom);
    _$totalCommentsAtom.reportObserved();
    return super.totalComments;
  }

  @override
  set totalComments(int value) {
    _$totalCommentsAtom.context.conditionallyRunInAction(() {
      super.totalComments = value;
      _$totalCommentsAtom.reportChanged();
    }, _$totalCommentsAtom, name: '${_$totalCommentsAtom.name}_set');
  }

  final _$totalNumberOfStudentsAtom =
      Atom(name: '_DashboardState.totalNumberOfStudents');

  @override
  int get totalNumberOfStudents {
    _$totalNumberOfStudentsAtom.context
        .enforceReadPolicy(_$totalNumberOfStudentsAtom);
    _$totalNumberOfStudentsAtom.reportObserved();
    return super.totalNumberOfStudents;
  }

  @override
  set totalNumberOfStudents(int value) {
    _$totalNumberOfStudentsAtom.context.conditionallyRunInAction(() {
      super.totalNumberOfStudents = value;
      _$totalNumberOfStudentsAtom.reportChanged();
    }, _$totalNumberOfStudentsAtom,
        name: '${_$totalNumberOfStudentsAtom.name}_set');
  }

  final _$currentMonthNumberOfStudentsAtom =
      Atom(name: '_DashboardState.currentMonthNumberOfStudents');

  @override
  int get currentMonthNumberOfStudents {
    _$currentMonthNumberOfStudentsAtom.context
        .enforceReadPolicy(_$currentMonthNumberOfStudentsAtom);
    _$currentMonthNumberOfStudentsAtom.reportObserved();
    return super.currentMonthNumberOfStudents;
  }

  @override
  set currentMonthNumberOfStudents(int value) {
    _$currentMonthNumberOfStudentsAtom.context.conditionallyRunInAction(() {
      super.currentMonthNumberOfStudents = value;
      _$currentMonthNumberOfStudentsAtom.reportChanged();
    }, _$currentMonthNumberOfStudentsAtom,
        name: '${_$currentMonthNumberOfStudentsAtom.name}_set');
  }

  final _$totalNumberOfClassesAtom =
      Atom(name: '_DashboardState.totalNumberOfClasses');

  @override
  int get totalNumberOfClasses {
    _$totalNumberOfClassesAtom.context
        .enforceReadPolicy(_$totalNumberOfClassesAtom);
    _$totalNumberOfClassesAtom.reportObserved();
    return super.totalNumberOfClasses;
  }

  @override
  set totalNumberOfClasses(int value) {
    _$totalNumberOfClassesAtom.context.conditionallyRunInAction(() {
      super.totalNumberOfClasses = value;
      _$totalNumberOfClassesAtom.reportChanged();
    }, _$totalNumberOfClassesAtom,
        name: '${_$totalNumberOfClassesAtom.name}_set');
  }

  final _$currentMonthIncomeAtom =
      Atom(name: '_DashboardState.currentMonthIncome');

  @override
  double get currentMonthIncome {
    _$currentMonthIncomeAtom.context
        .enforceReadPolicy(_$currentMonthIncomeAtom);
    _$currentMonthIncomeAtom.reportObserved();
    return super.currentMonthIncome;
  }

  @override
  set currentMonthIncome(double value) {
    _$currentMonthIncomeAtom.context.conditionallyRunInAction(() {
      super.currentMonthIncome = value;
      _$currentMonthIncomeAtom.reportChanged();
    }, _$currentMonthIncomeAtom, name: '${_$currentMonthIncomeAtom.name}_set');
  }

  final _$currentMonthCancellationsAtom =
      Atom(name: '_DashboardState.currentMonthCancellations');

  @override
  int get currentMonthCancellations {
    _$currentMonthCancellationsAtom.context
        .enforceReadPolicy(_$currentMonthCancellationsAtom);
    _$currentMonthCancellationsAtom.reportObserved();
    return super.currentMonthCancellations;
  }

  @override
  set currentMonthCancellations(int value) {
    _$currentMonthCancellationsAtom.context.conditionallyRunInAction(() {
      super.currentMonthCancellations = value;
      _$currentMonthCancellationsAtom.reportChanged();
    }, _$currentMonthCancellationsAtom,
        name: '${_$currentMonthCancellationsAtom.name}_set');
  }

  final _$classesAtom = Atom(name: '_DashboardState.classes');

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

  final _$_DashboardStateActionController =
      ActionController(name: '_DashboardState');

  @override
  dynamic setLoading(bool isLoading) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.setLoading(isLoading);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClassesLoading(bool isLoading) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.setClassesLoading(isLoading);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setClasses(List<ClassListItemModel> classes) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.setClasses(classes);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setScore(double newScore) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.setScore(newScore);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTotalComments(int newTotalComments) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.setTotalComments(newTotalComments);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTotalNumberOfStudents(int newTotalNumberOfStudents) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.setTotalNumberOfStudents(newTotalNumberOfStudents);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentMonthNumberOfStudents(int newCurrentMonthNumberOfStudents) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super
          .setCurrentMonthNumberOfStudents(newCurrentMonthNumberOfStudents);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTotalClasses(int newTotalNumberOfClasses) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.setTotalClasses(newTotalNumberOfClasses);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentMonthIncome(double newIncome) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.setCurrentMonthIncome(newIncome);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentMonthCancellations(int cancellations) {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.setCurrentMonthCancellations(cancellations);
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetState() {
    final _$actionInfo = _$_DashboardStateActionController.startAction();
    try {
      return super.resetState();
    } finally {
      _$_DashboardStateActionController.endAction(_$actionInfo);
    }
  }
}
