import 'package:mobx/mobx.dart';
import 'package:professors/models/payments/accounts/PaymentAccountListItem.dart';
import 'package:professors/services/dto/payments/currency.model.dart';

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
  bool isUpdating = false;

  @observable
  double balance = 0;

  @observable
  CurrencyModel currency = CurrencyModel(1, 'EUR', '€');

  @observable
  ObservableList<PaymentAccountListItem> accounts = ObservableList.of([]);

  @observable
  ObservableList<CurrencyModel> availableCurrencies = ObservableList.of([],);

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setIsUpdating(bool isUpdating) {
    this.isUpdating = isUpdating;
  }

  @action
  setBalance(double balance) {
    this.balance = balance;
  }

  @action
  setCurrency(CurrencyModel currency) {
    this.currency = currency;
  }

  @action
  setCurrencies(List<CurrencyModel> currencies) {
    this.availableCurrencies = currencies;
  }

  @action
  setAccounts(List<PaymentAccountListItem> accounts) {
    accounts.clear();
    accounts.addAll(accounts);
  }

  @action
  addAccount(PaymentAccountListItem account) {
    accounts.add(account);
  }

  @action
  resetState() {}
}
