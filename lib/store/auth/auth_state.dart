import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class AuthState extends _AuthState with _$AuthState {
  AuthState();
}

abstract class _AuthState with Store {

  // session token
  @observable
  String authToken;

  // login vars
  @observable
  bool loginIsLoading = false;

  // password recovery vars
  @observable
  bool passwordRecoveryIsLoading = false;

  // regist form vars
  @observable
  bool registerIsLoading = false;

  @action
  setAuthToken(String authToken) {
    this.authToken = authToken;
  }

  @action
  setLoginIsLoading(bool isLoading) {
    this.loginIsLoading = isLoading;
  }

  @action
  setPasswordRecoveryIsLoading(bool isLoading) {
    this.passwordRecoveryIsLoading = isLoading;
  }

  @action
  setRegisterIsLoading(bool isLoading) {
    this.registerIsLoading = isLoading;
  }

  @action
  reset() {
    this.loginIsLoading = false;
    this.passwordRecoveryIsLoading = false;
    this.registerIsLoading = false;
  }

}