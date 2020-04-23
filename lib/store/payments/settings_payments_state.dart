import 'package:mobx/mobx.dart';

part 'settings_payments_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class SettingsPaymentsState extends _SettingsPaymentsState with _$SettingsPaymentsState {
  SettingsPaymentsState();
}

// The store-class
abstract class _SettingsPaymentsState with Store {

  @observable
  double balance = 0.0;

  @action
  setBalance(double newValue){
    balance = newValue;
  }

}