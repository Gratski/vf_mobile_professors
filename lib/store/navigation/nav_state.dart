import 'package:mobx/mobx.dart';

part 'nav_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class NavState extends _NavState with _$NavState {
  NavState() {
    this.resetBottomNavigationIndex();
  }
}

// The store-class
abstract class _NavState with Store {
  @observable
  int bottomNavigationIndex = 1;

  @action
  bottomNavigationTabIndexChangedAction(int value) {
    this.bottomNavigationIndex = value;
  }

  @action
  resetBottomNavigationIndex() {
    this.bottomNavigationIndex = 1;
  }

}