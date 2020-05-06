import 'package:mobx/mobx.dart';
import 'package:professors/services/dto/payments/payment_method.model.dart';

part 'add_payment_method_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
class AddPaymentMethodState extends _AddPaymentMethodState with _$AddPaymentMethodState {}
abstract class _AddPaymentMethodState with Store {

  @observable
  bool isLoading = false;

  @observable
  String email = "";

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setEmail(String email) {
    this.email = email;
  }

}