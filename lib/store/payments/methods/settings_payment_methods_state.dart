import 'package:mobx/mobx.dart';
import 'package:professors/models/payments/accounts/PaymentAccountListItem.dart';

part 'settings_payment_methods_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class SettingsPaymentMethodsState extends _SettingsPaymentMethodsState
    with _$SettingsPaymentMethodsState {
  SettingsPaymentMethodsState();
}

// The store-class
abstract class _SettingsPaymentMethodsState with Store {

  @observable
  ObservableList<PaymentAccountListItem> accounts = ObservableList.of([
    PaymentAccountListItem(
        email: 'rodrigues.at.work@gmail.com', isDefault: true),
  ]);

  @action
  setAccounts(List<PaymentAccountListItem> accounts) {
    accounts.clear();
    accounts.addAll(accounts);
  }
}
