import 'package:mobx/mobx.dart';

part 'settings_notifications_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class SettingsNotificationsState extends _SettingsNotificationsState with _$SettingsNotificationsState {

}

// The store-class
abstract class _SettingsNotificationsState with Store {

  @observable
  bool isLoading = true;

  @observable
  bool messageNotificationsActive = false;

  @observable
  bool reminderNotificationsActive = false;

  @observable
  bool supportNotificationsActive = false;

  @action
  setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
  }

  @action
  setMessageNotificationsActive(bool newValue){
    messageNotificationsActive = newValue;
  }

  @action
  setReminderNotificationsActive(bool newValue){
    reminderNotificationsActive = newValue;
  }

  @action
  setSupportNotificationsActive(bool newValue){
    supportNotificationsActive = newValue;
  }

}