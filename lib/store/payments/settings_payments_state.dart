import 'package:mobx/mobx.dart';
import 'package:professors/services/dto/payments/payment_method.model.dart';

part 'settings_payments_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
class SettingsPaymentsState extends _SettingsPaymentsState with _$SettingsPaymentsState {}
abstract class _SettingsPaymentsState with Store {

  @observable
  bool isLoading = true;

  @observable
  double balance = 0;

  @observable
  ObservableList<PaymentMethodModel> paymentMethods = ObservableList.of([]);

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setBalance(double newValue){
    balance = newValue;
  }

  @action
  setPaymentMethods(List<PaymentMethodModel> payments) {
    this.paymentMethods.clear();
    this.paymentMethods.addAll(payments);
  }

}