import 'package:mobx/mobx.dart';
import 'package:professors/models/support/support_contact_type.dart';

part 'support_contact_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class SupportContactState extends _SupportContactState with _$SupportContactState {
  SupportContactState();
}

// The store-class
abstract class _SupportContactState with Store {

  @observable
  bool isLoading = false;

  @observable
  SupportContactTypeModel supportType = SupportContactTypeModel.OTHER;

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setContactType(SupportContactTypeModel type){
    supportType = type;
  }

}