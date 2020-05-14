import 'package:mobx/mobx.dart';
import 'package:professors/models/country.model.dart';
import 'package:professors/models/profile/nationality_list_item.model.dart';

part 'nationalities_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class NationalitiesState extends _NationalitiesState with _$NationalitiesState {
  NationalitiesState() {
    this.resetState();
  }
}

// The store-class
abstract class _NationalitiesState with Store {
  @observable
  bool isLoading = true;

  @observable
  ObservableList<CountryModel> nationalities = ObservableList.of([],);

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setNationalities(List<CountryModel> list) {
    this.nationalities.clear();
    this.nationalities.addAll(list);
  }

  @action
  clearNationalities() {
    this.nationalities.clear();
  }

  @action
  resetState() {}
}
