// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserState on _UserState, Store {
  final _$isLoadingAtom = Atom(name: '_UserState.isLoading');

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

  final _$firstNameAtom = Atom(name: '_UserState.firstName');

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

  final _$lastNameAtom = Atom(name: '_UserState.lastName');

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

  final _$emailAtom = Atom(name: '_UserState.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$pictureUrlAtom = Atom(name: '_UserState.pictureUrl');

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

  final _$phoneNumberAtom = Atom(name: '_UserState.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.context.enforceReadPolicy(_$phoneNumberAtom);
    _$phoneNumberAtom.reportObserved();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.context.conditionallyRunInAction(() {
      super.phoneNumber = value;
      _$phoneNumberAtom.reportChanged();
    }, _$phoneNumberAtom, name: '${_$phoneNumberAtom.name}_set');
  }

  final _$countryLabelAtom = Atom(name: '_UserState.countryLabel');

  @override
  String get countryLabel {
    _$countryLabelAtom.context.enforceReadPolicy(_$countryLabelAtom);
    _$countryLabelAtom.reportObserved();
    return super.countryLabel;
  }

  @override
  set countryLabel(String value) {
    _$countryLabelAtom.context.conditionallyRunInAction(() {
      super.countryLabel = value;
      _$countryLabelAtom.reportChanged();
    }, _$countryLabelAtom, name: '${_$countryLabelAtom.name}_set');
  }

  final _$countryIdAtom = Atom(name: '_UserState.countryId');

  @override
  int get countryId {
    _$countryIdAtom.context.enforceReadPolicy(_$countryIdAtom);
    _$countryIdAtom.reportObserved();
    return super.countryId;
  }

  @override
  set countryId(int value) {
    _$countryIdAtom.context.conditionallyRunInAction(() {
      super.countryId = value;
      _$countryIdAtom.reportChanged();
    }, _$countryIdAtom, name: '${_$countryIdAtom.name}_set');
  }

  final _$birthdayAtom = Atom(name: '_UserState.birthday');

  @override
  DateTime get birthday {
    _$birthdayAtom.context.enforceReadPolicy(_$birthdayAtom);
    _$birthdayAtom.reportObserved();
    return super.birthday;
  }

  @override
  set birthday(DateTime value) {
    _$birthdayAtom.context.conditionallyRunInAction(() {
      super.birthday = value;
      _$birthdayAtom.reportChanged();
    }, _$birthdayAtom, name: '${_$birthdayAtom.name}_set');
  }

  final _$genderAtom = Atom(name: '_UserState.gender');

  @override
  Gender get gender {
    _$genderAtom.context.enforceReadPolicy(_$genderAtom);
    _$genderAtom.reportObserved();
    return super.gender;
  }

  @override
  set gender(Gender value) {
    _$genderAtom.context.conditionallyRunInAction(() {
      super.gender = value;
      _$genderAtom.reportChanged();
    }, _$genderAtom, name: '${_$genderAtom.name}_set');
  }

  final _$_UserStateActionController = ActionController(name: '_UserState');

  @override
  dynamic setFirstName(String firstName) {
    final _$actionInfo = _$_UserStateActionController.startAction();
    try {
      return super.setFirstName(firstName);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastName(String lastName) {
    final _$actionInfo = _$_UserStateActionController.startAction();
    try {
      return super.setLastName(lastName);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhoneNumber(String phoneNumber) {
    final _$actionInfo = _$_UserStateActionController.startAction();
    try {
      return super.setPhoneNumber(phoneNumber);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCountry(int countryId, String countryLabel) {
    final _$actionInfo = _$_UserStateActionController.startAction();
    try {
      return super.setCountry(countryId, countryLabel);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBirthday(DateTime birthday) {
    final _$actionInfo = _$_UserStateActionController.startAction();
    try {
      return super.setBirthday(birthday);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGender(Gender gender) {
    final _$actionInfo = _$_UserStateActionController.startAction();
    try {
      return super.setGender(gender);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String email) {
    final _$actionInfo = _$_UserStateActionController.startAction();
    try {
      return super.setEmail(email);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPictureUrl(String pictureUrl) {
    final _$actionInfo = _$_UserStateActionController.startAction();
    try {
      return super.setPictureUrl(pictureUrl);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetState() {
    final _$actionInfo = _$_UserStateActionController.startAction();
    try {
      return super.resetState();
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }
}
