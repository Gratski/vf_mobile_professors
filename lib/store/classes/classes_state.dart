import 'package:mobx/mobx.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/models/classes/class_list_item.dart';
import 'package:professors/models/language_context/language_context.model.dart';

part 'classes_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class ClassesState extends _ClassesState with _$ClassesState {
  ClassesState();
}

// The store-class
abstract class _ClassesState with Store {

  /// When scrolling down
  @observable
  bool isLoading = true;

  /// When already scrolled a lot and is going back up
  @observable
  bool isLoadingPrevious = false;

  @observable
  bool isLoadingNext = false;

  @observable
  int pageNumber = 0;

  @observable
  int itemsPerPage = 10;

  @observable
  int size = 20;

  @observable
  ObservableList<ClassListItemModel> classes = ObservableList.of([]);

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setIsLoadingPrevious(bool isLoading) {
    this.isLoadingPrevious = isLoading;
  }

  @action
  setIsLoadingNext(bool isLoading) {
    this.isLoadingNext = isLoading;
  }

  @action
  addNextPageClasses(List<ClassListItemModel> page){
    this.classes.addAll(page);
    this.pageNumber++;
  }

  @action
  addPreviousPageClasses(List<ClassListItemModel> page) {
    this.classes.addAll(page);
  }

}