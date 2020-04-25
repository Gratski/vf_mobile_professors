import 'package:mobx/mobx.dart';
import 'package:professors/models/notifications/class_feed_notification_list_item.model.dart';
import 'package:professors/models/notifications/feed_class_notification_list_item.mode..dart';
import 'package:professors/models/notifications/feed_message_notification_list_item.model.dart';
import 'package:professors/models/notifications/feed_notification_type.model.dart';
import 'package:professors/models/notifications/feed_system_notification_list_item.model.dart';
import 'package:professors/models/notifications/notifications.model.dart';

part 'notifications_state.g.dart';

// to watch updates : flutter packages pub run build_runner watch
// This is the class used by rest of your codebase
class NotificationsState extends _NotificationsState with _$NotificationsState {
  NotificationsState() {}
}

// The store-class
abstract class _NotificationsState with Store {

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
  ObservableList<NotificationsModel> notifications = ObservableList.of(
    [
      NotificationsModel.complete(
        1,
        FeedNotificationTypeEnum.CLASS_NOTIFICATION,
        false,
        DateTime.now(),
        'https://www.terrainhopperusa.com/wp-content/uploads/2019/01/avatar-woman.png',
        1,
        'Rebeka',
        ClassFeedNotificationListItem.complete(
          'Rebeka',
          'UK',
          'https://www.terrainhopperusa.com/wp-content/uploads/2019/01/avatar-woman.png',
          'Yoga Relax',
          'English',
          FeedClassNotificationTypeModel.RESERVATION,
          ''
        ),
        null,
        null
      ),

      NotificationsModel.complete(
          1,
          FeedNotificationTypeEnum.CLASS_NOTIFICATION,
          false,
          DateTime.now(),
          'https://www.terrainhopperusa.com/wp-content/uploads/2019/01/avatar-woman.png',
          1,
          'Rebeka',
          ClassFeedNotificationListItem.complete(
              'Rebeka',
              'UK',
              'https://www.terrainhopperusa.com/wp-content/uploads/2019/01/avatar-woman.png',
              'Yoga Relax',
              'English',
              FeedClassNotificationTypeModel.CANCELLATION,
              'Sorry to have to cancel but I had to.'
          ),
          null,
          null
      ),

      NotificationsModel.complete(
          1,
          FeedNotificationTypeEnum.MESSAGE_NOTIFICATION,
          false,
          DateTime.now(),
          'https://www.terrainhopperusa.com/wp-content/uploads/2019/01/avatar-woman.png',
          1,
          'Rebeka',
          null,
          MessageFeedNotificationListItem.complete(
            1, 1, 'Rebeka', 'https://www.terrainhopperusa.com/wp-content/uploads/2019/01/avatar-woman.png', 'Hello sorry for this but I have to cancel.. Hope to see you soon!', 'UK'
          ),
          null
      ),

      NotificationsModel.complete(
          1,
          FeedNotificationTypeEnum.SYSTEM_NOTIFICATION,
          false,
          DateTime.now(),
          'https://www.terrainhopperusa.com/wp-content/uploads/2019/01/avatar-woman.png',
          1,
          'Rebeka',
          null,
          null,
          SystemFeedNotificationListItem.complete(
            'New Category',
            'Nutrition category is out!',
            'Create your own nutrition workshops and classes.'
          )
      ),
    ],
  );

  @action
  setMessageNotificationsActive(List<NotificationsModel> newNotifications){
    this.notifications.addAll(newNotifications);
  }

}