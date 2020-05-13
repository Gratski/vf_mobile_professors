import 'package:mobx/mobx.dart';
import 'package:professors/models/gender.dart';

part 'edit_profile_details_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class EditProfileDetailsState extends _EditProfileDetailsState with _$EditProfileDetailsState {
  EditProfileDetailsState() {
    this.resetState();
  }
}

// The store-class
abstract class _EditProfileDetailsState with Store {
  @observable
  bool isLoading = false;

  @observable
  String firstName = "";

  @observable
  String lastName = "";

  @observable
  String email = "";

  @observable
  String phoneNumber = "";

  @observable
  String countryLabel = "";
  @observable
  int countryId;

  @observable
  String livingInLabel = "";
  @observable
  int livingInId;

  @observable
  DateTime birthday;

  @observable
  Gender gender = Gender.MALE;

  @action
  setIsLoading(bool isLoading){
    this.isLoading = isLoading;
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
  resetState() {}
}
