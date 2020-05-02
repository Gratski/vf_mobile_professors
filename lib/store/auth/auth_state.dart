import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class AuthState extends _AuthState with _$AuthState {
  AuthState();
}

abstract class _AuthState with Store {

  @observable
  bool loginIsLoading = false;
  @observable
  bool loginHasError = false;
  @observable
  String loginErrorMsg = "";

  @observable
  bool passwordRecoveryIsLoading = false;
  @observable
  bool passwordRecoveryHasError = false;
  @observable
  String passwordRecoveryErrorMsg = "";
  @observable
  bool passwordRecoveryHasSucceeded = false;

  @action
  setLoginIsLoading(bool isLoading) {
    this.loginIsLoading = isLoading;
  }
  @action
  setLoginHasError(bool hasError) {
    this.loginHasError = hasError;
  }
  @action
  setLoginErrorMsg(String errorMsg) {
    this.loginErrorMsg = errorMsg;
  }

  @action
  setPasswordRecoveryIsLoading(bool isLoading) {
    this.passwordRecoveryIsLoading = isLoading;
  }
  @action
  setPasswordRecoveryHasError(bool hasError) {
    this.passwordRecoveryHasError = hasError;
  }
  @action
  setPasswordRecoveryErrorMsg(String errorMsg) {
    this.passwordRecoveryErrorMsg = errorMsg;
  }
  @action
  setPasswordRecoveryHasSucceeded(bool hasSucceeded) {
    this.passwordRecoveryHasSucceeded = hasSucceeded;
  }

  @action
  reset() {
    this.loginHasError = false;
    this.loginIsLoading = false;
    this.loginErrorMsg = "";
    this.passwordRecoveryHasError = false;
    this.passwordRecoveryIsLoading = false;
    this.passwordRecoveryErrorMsg = "";
    this.passwordRecoveryHasSucceeded = false;
  }

}