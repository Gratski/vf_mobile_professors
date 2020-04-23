import 'package:professors/models/transactions/transaction_type.dart';

class TransactionListItem {

  final DateTime date;
  final TransactionType transactionType;
  final double amount;

  TransactionListItem({this.date, this.transactionType, this.amount});

}