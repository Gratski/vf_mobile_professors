import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class AuthState extends _AuthState with _$AuthState {
  AuthState();
}

abstract class _AuthState with Store {

  @observable
  bool isLoading = false;

  @observable
  bool hasError = false;

  @observable
  String errorMsg = "";

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setHasError(bool hasError) {
    this.hasError = hasError;
  }

  @action
  setErrorMsg(String errorMsg) {
    this.errorMsg = errorMsg;
  }

}