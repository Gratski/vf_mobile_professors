import 'package:mobx/mobx.dart';
import 'package:professors/models/classes/class.model.dart';

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
  bool isLoadingNext;

  /// When already scrolled a lot and is going back up
  @observable
  bool isLoadingPrevious;

  @observable
  int page = 0;

  @observable
  int size = 20;

  @observable
  ObservableList<ClassModel> classes = ObservableList.of(
    [
      ClassModel(
        1,
        'Class Title Here',
        'Class description is going here',
        'https://image.shutterstock.com/image-photo/fitness-sport-training-gym-lifestyle-260nw-238400998.jpg',
        true,
        30,
        'PT'
      ),
      ClassModel(
          1,
          'Class Title Here',
          'Class description is going here',
          'https://images.pexels.com/photos/1954524/pexels-photo-1954524.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          true,
          30,
          'PT'
      ),
      ClassModel(
          1,
          'Class Title Here',
          'Class description is going here',
          'https://yourdailywire.com/wp-content/uploads/2019/02/6-Reasons-You-Should-Never-Open-a-Gym.jpg',
          true,
          30,
          'PT'
      ),
      ClassModel(
          1,
          'Class Title Here',
          'Class description is going here',
          'https://image.shutterstock.com/image-photo/fitness-sport-training-gym-lifestyle-260nw-238400998.jpg',
          true,
          30,
          'PT'
      ),
      ClassModel(
          1,
          'Class Title Here',
          'Class description is going here',
          'https://image.shutterstock.com/image-photo/fitness-sport-training-gym-lifestyle-260nw-238400998.jpg',
          false,
          45,
          'EN'
      )
    ],
  );

  @action
  addClasses(List<ClassModel> newClasses){
    this.classes.addAll(newClasses);
  }

}