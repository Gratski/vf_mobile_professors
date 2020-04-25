import 'package:professors/models/notifications/feed_class_notification_list_item.mode..dart';

class ClassFeedNotificationListItem {
  String username;
  String userCountryCode;
  String userPictureUrl;
  String discipline;
  String disciplineLanguage;
  String message;
  FeedClassNotificationTypeModel notificationType;

  ClassFeedNotificationListItem();
  ClassFeedNotificationListItem.complete(
      this.username,
      this.userCountryCode,
      this.userPictureUrl,
      this.discipline,
      this.disciplineLanguage,
      this.notificationType,
      this.message
      );

}