import 'package:professors/models/notifications/class_feed_notification_list_item.model.dart';
import 'package:professors/models/notifications/feed_message_notification_list_item.model.dart';
import 'package:professors/models/notifications/feed_notification_type.model.dart';
import 'package:professors/models/notifications/feed_system_notification_list_item.model.dart';

class NotificationsModel {

  int id;
  FeedNotificationTypeEnum type;
  bool seen;
  DateTime date;
  String pictureUrl;
  int sentFromId;
  String sentFromName;
  ClassFeedNotificationListItem classObj;
  MessageFeedNotificationListItem messageObj;
  SystemFeedNotificationListItem systemObj;

  NotificationsModel();
  NotificationsModel.complete(
      this.id,
      this.type,
      this.seen,
      this.date,
      this.pictureUrl,
      this.sentFromId,
      this.sentFromName,
      this.classObj,
      this.messageObj,
      this.systemObj
      );

}