import 'package:mobx/mobx.dart';
import 'package:professors/models/support/support_contact_type.dart';

part 'profile_details_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class ProfileDetailsState extends _ProfileDetailsState with _$ProfileDetailsState {}

// The store-class
abstract class _ProfileDetailsState with Store {

  @observable
  bool isLoading = true;

  @observable
  int id = 0;

  @observable
  String designation = "";

  @observable
  String description = "";

  @observable
  String quote = "";

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setId(int id) {
    this.id = id;
  }

  @action
  setDesignation(String designation) {
    this.designation = designation;
  }

  @action
  setDescription(String description) {
    this.description = description;
  }

  @action
  setQuote(String quote) {
    this.quote = quote;
  }

}