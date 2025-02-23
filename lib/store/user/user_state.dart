import 'package:mobx/mobx.dart';
import 'package:professors/models/classes/class_list_item.dart';
import 'package:professors/models/gender.dart';

part 'user_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class UserState extends _UserState with _$UserState {
  UserState() {
    this.resetState();
  }
}

// The store-class
abstract class _UserState with Store {
  @observable
  bool isLoading = true;

  @observable
  bool isPictureLoading = false;

  @observable
  int id;

  @observable
  String firstName = "";

  @observable
  String lastName = "";

  @observable
  String email = "";

  @observable
  String pictureUrl;

  @observable
  String phoneNumber = "";

  @observable
  String countryLabel = "";
  @observable
  int countryId = 1;

  @observable
  String livingInLabel = "";
  @observable
  int livingInId = 1;

  @observable
  DateTime birthday = DateTime.now().subtract(
      new Duration(days: (365 * 31)));

  @observable
  Gender gender = Gender.MALE;

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setPictureIsLoading(bool isLoading) {
    this.isPictureLoading = isLoading;
  }

  @action
  setId(int id) {
    this.id = id;
  }

  @action
  setFirstName(String firstName) {
    this.firstName = firstName;
  }

  @action
  setLastName(String lastName) {
    this.lastName = lastName;
  }

  @action
  setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  @action
  setCountry(int countryId, String countryLabel) {
    this.countryId = countryId;
    this.countryLabel = countryLabel;
  }

  @action
  setLivingIn(int countryId, String countryLabel) {
    this.livingInId = countryId;
    this.livingInLabel = countryLabel;
  }

  @action
  setBirthday(DateTime birthday) {
    this.birthday = birthday;
  }

  @action
  setGender(Gender gender){
    this.gender = gender;
  }

  @action
  setEmail(String email) {
    this.email = email;
  }

  @action
  setPictureUrl(String pictureUrl) {
    this.pictureUrl = pictureUrl;
  }

  @action
  resetState() {}
}
