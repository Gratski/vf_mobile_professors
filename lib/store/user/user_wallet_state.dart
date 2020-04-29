import 'package:mobx/mobx.dart';
import 'package:professors/models/payments/currency.model.dart';

part 'user_wallet_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class UserWalletState extends _UserWalletState with _$UserWalletState {
  UserWalletState() {
    this.resetState();
  }
}

// The store-class
abstract class _UserWalletState with Store {
  @observable
  bool isLoading = false;

  @observable
  double balance = 0.0;

  @observable
  CurrencyModel currency = CurrencyModel(1, 'EUR', '€');

  @observable
  ObservableList<CurrencyModel> availableCurrencies = ObservableList.of([
    CurrencyModel(1, 'EUR', '€'),
    CurrencyModel(2, 'USD', '\$'),
    CurrencyModel(3, 'AUD', '\$'),
    CurrencyModel(4, 'UK', '£'),
  ],);

  @action
  setBalance(double balance) {
    this.balance = balance;
  }

  @action
  setCurrency(CurrencyModel currency) {
    this.currency = currency;
  }

  @action
  resetState() {}
}
