import 'package:mobx/mobx.dart';
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
  bool isLoading = false;

  @observable
  ObservableList<NationalityListItemModel> nationalities = ObservableList.of(
    [
      NationalityListItemModel(
        1,
        'Portuguese',
        ''
      )
    ],
  );

  @action
  setNationalities(List<NationalityListItemModel> list) {
    this.nationalities.clear();
    this.nationalities.addAll(list);
  }

  @action
  resetState() {}
}
