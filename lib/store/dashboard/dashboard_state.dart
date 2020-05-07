import 'package:mobx/mobx.dart';
import 'package:professors/models/classes/class_list_item.dart';

part 'dashboard_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class DashboardState extends _DashboardState with _$DashboardState {
  DashboardState() {
    this.resetState();
  }
}

// The store-class
abstract class _DashboardState with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isClassesLoading = false;

  @observable
  double score = 2.7;

  @observable
  int totalComments = 0;

  @observable
  int totalNumberOfStudents = 0;

  @observable
  int currentMonthNumberOfStudents = 0;

  @observable
  int totalNumberOfClasses = 0;

  @observable
  double currentMonthIncome = 0.0;

  @observable
  int currentMonthCancellations = 0;

  @observable
  ObservableList<ClassListItemModel> classes = ObservableList.of([]);

  @action
  setLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setClassesLoading(bool isLoading) {
    this.isClassesLoading = isLoading;
  }

  @action
  setClasses(List<ClassListItemModel> classes) {
    this.classes.clear();
    this.classes.addAll(classes);
  }

  @action
  setScore(double newScore) {
    this.score = newScore;
  }

  @action
  setTotalComments(int newTotalComments) {
    this.totalComments = newTotalComments;
  }

  @action
  setTotalNumberOfStudents(int newTotalNumberOfStudents) {
    this.totalNumberOfStudents = newTotalNumberOfStudents;
  }

  @action
  setCurrentMonthNumberOfStudents(int newCurrentMonthNumberOfStudents) {
    this.currentMonthNumberOfStudents = newCurrentMonthNumberOfStudents;
  }

  @action
  setTotalClasses(int newTotalNumberOfClasses) {
    this.totalNumberOfClasses = newTotalNumberOfClasses;
  }

  @action
  setCurrentMonthIncome(double newIncome) {
    this.currentMonthIncome = newIncome;
  }

  @action
  setCurrentMonthCancellations(int cancellations) {
    this.currentMonthCancellations = cancellations;
  }

  @action
  resetState() {}
}
