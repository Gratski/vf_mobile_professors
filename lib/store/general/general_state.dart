import 'package:mobx/mobx.dart';
import 'package:professors/models/category/category.model.dart';

part 'general_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class GeneralState extends _GeneralState with _$GeneralState {
  GeneralState();
}

// The store-class
abstract class _GeneralState with Store {

  /// True when the app is ready
  @observable
  bool isReady = true;

  /// First Level Categories list always available
  @observable
  ObservableList<CategoryModel> categories = ObservableList.of(
    [
      CategoryModel(
        1,
        null,
        'Mind',
        'Mindfullness Category'
      ),
      CategoryModel(
          2,
          null,
          'HIIT',
          'High Intensity Training'
      ),
      CategoryModel(
          3,
          null,
          'Dance',
          'All about dance'
      )
    ],
  );

  @action
  setCategories(List<CategoryModel> categories){
    this.categories.addAll(categories);
  }

  @action
  setIsReady(bool isReady){
    this.isReady = isReady;
  }

}