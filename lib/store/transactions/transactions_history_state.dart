import 'package:mobx/mobx.dart';
import 'package:professors/models/payments/transactions/transaction_type.dart';
import 'package:professors/models/payments/transactions/transactions_list_item.dart';

part 'transactions_history_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class TransactionsHistoryState extends _TransactionsHistoryState with _$TransactionsHistoryState {
  TransactionsHistoryState() {

  }
}

// The store-class
abstract class _TransactionsHistoryState with Store {

  @observable
  int tabIndex = 0;

  @observable
  bool isLoading = false;

  @observable
  int pageNumber = 0;

  @observable
  int pageSize = 0;

  @observable
  ObservableList<TransactionListItem> transactions = ObservableList.of(
    [
      TransactionListItem(
        transactionType: TransactionType.PAYMENT,
        date: DateTime.now(),
        amount: 153.0
      ),
      TransactionListItem(
          transactionType: TransactionType.PAYMENT,
          date: DateTime.now(),
          amount: 153.0
      ),
    ],
  );

  @action
  setTransactions(List<TransactionListItem> newTransactions) {
    this.transactions = newTransactions;
  }

  @action
  setIsLoading(bool newIsLoading){
    this.isLoading = newIsLoading;
  }

}