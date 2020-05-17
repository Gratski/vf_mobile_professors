import 'package:mobx/mobx.dart';
import 'package:professors/models/support/support_contact_type.dart';

part 'change_password_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class ChangePasswordState extends _ChangePasswordState with _$ChangePasswordState {}

// The store-class
abstract class _ChangePasswordState with Store {

  @observable
  bool isLoading = false;

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

}