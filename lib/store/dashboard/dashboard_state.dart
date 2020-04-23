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
  bool isNextClassesLoading = false;

  @observable
  double score = 0.0;

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
  ObservableList<ClassListItem> nextClasses = ObservableList.of(
    [
      ClassListItem(
        designation: 'Class 1',
        description: 'Description of class 1',
        pictureUrl:
            'https://www.active.com/Assets/Fitness/group-fitness-benefits.jpg',
      ),
    ],
  );

  @action
  setLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setNextClassesLoading(bool isLoading) {
    this.isNextClassesLoading = isLoading;
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
