// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professor_profile_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfessorProfileState on _ProfessorProfileState, Store {
  final _$isLoadingAtom = Atom(name: '_ProfessorProfileState.isLoading');

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

  final _$idAtom = Atom(name: '_ProfessorProfileState.id');

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

  final _$languageCodeAtom = Atom(name: '_ProfessorProfileState.languageCode');

  @override
  String get languageCode {
    _$languageCodeAtom.context.enforceReadPolicy(_$languageCodeAtom);
    _$languageCodeAtom.reportObserved();
    return super.languageCode;
  }

  @override
  set languageCode(String value) {
    _$languageCodeAtom.context.conditionallyRunInAction(() {
      super.languageCode = value;
      _$languageCodeAtom.reportChanged();
    }, _$languageCodeAtom, name: '${_$languageCodeAtom.name}_set');
  }

  final _$firstNameAtom = Atom(name: '_ProfessorProfileState.firstName');

  @override
  String get firstName {
    _$firstNameAtom.context.enforceReadPolicy(_$firstNameAtom);
    _$firstNameAtom.reportObserved();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.context.conditionallyRunInAction(() {
      super.firstName = value;
      _$firstNameAtom.reportChanged();
    }, _$firstNameAtom, name: '${_$firstNameAtom.name}_set');
  }

  final _$lastNameAtom = Atom(name: '_ProfessorProfileState.lastName');

  @override
  String get lastName {
    _$lastNameAtom.context.enforceReadPolicy(_$lastNameAtom);
    _$lastNameAtom.reportObserved();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.context.conditionallyRunInAction(() {
      super.lastName = value;
      _$lastNameAtom.reportChanged();
    }, _$lastNameAtom, name: '${_$lastNameAtom.name}_set');
  }

  final _$pictureUrlAtom = Atom(name: '_ProfessorProfileState.pictureUrl');

  @override
  String get pictureUrl {
    _$pictureUrlAtom.context.enforceReadPolicy(_$pictureUrlAtom);
    _$pictureUrlAtom.reportObserved();
    return super.pictureUrl;
  }

  @override
  set pictureUrl(String value) {
    _$pictureUrlAtom.context.conditionallyRunInAction(() {
      super.pictureUrl = value;
      _$pictureUrlAtom.reportChanged();
    }, _$pictureUrlAtom, name: '${_$pictureUrlAtom.name}_set');
  }

  final _$designationAtom = Atom(name: '_ProfessorProfileState.designation');

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

  final _$aboutAtom = Atom(name: '_ProfessorProfileState.about');

  @override
  String get about {
    _$aboutAtom.context.enforceReadPolicy(_$aboutAtom);
    _$aboutAtom.reportObserved();
    return super.about;
  }

  @override
  set about(String value) {
    _$aboutAtom.context.conditionallyRunInAction(() {
      super.about = value;
      _$aboutAtom.reportChanged();
    }, _$aboutAtom, name: '${_$aboutAtom.name}_set');
  }

  final _$quoteAtom = Atom(name: '_ProfessorProfileState.quote');

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

  final _$teachesAtom = Atom(name: '_ProfessorProfileState.teaches');

  @override
  ObservableList<CategoryModel> get teaches {
    _$teachesAtom.context.enforceReadPolicy(_$teachesAtom);
    _$teachesAtom.reportObserved();
    return super.teaches;
  }

  @override
  set teaches(ObservableList<CategoryModel> value) {
    _$teachesAtom.context.conditionallyRunInAction(() {
      super.teaches = value;
      _$teachesAtom.reportChanged();
    }, _$teachesAtom, name: '${_$teachesAtom.name}_set');
  }

  final _$_ProfessorProfileStateActionController =
      ActionController(name: '_ProfessorProfileState');

  @override
  dynamic setIsLoading(bool isLoading) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setIsLoading(isLoading);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setId(int id) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setId(id);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLanguageCode(String code) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setLanguageCode(code);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPictureUrl(String url) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setPictureUrl(url);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFirstName(String name) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setFirstName(name);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastName(String name) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setLastName(name);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDesignation(String designation) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setDesignation(designation);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAbout(String about) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setAbout(about);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuote(String quote) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setQuote(quote);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTeaches(List<CategoryModel> teaches) {
    final _$actionInfo = _$_ProfessorProfileStateActionController.startAction();
    try {
      return super.setTeaches(teaches);
    } finally {
      _$_ProfessorProfileStateActionController.endAction(_$actionInfo);
    }
  }
}
