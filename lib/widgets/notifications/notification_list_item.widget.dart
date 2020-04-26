import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/notifications/notifications_constants.dart';
import 'package:professors/models/notifications/feed_class_notification_list_item.mode..dart';
import 'package:professors/models/notifications/feed_notification_type.model.dart';
import 'package:professors/models/notifications/notifications.model.dart';
import 'package:professors/screens/notifications/cancelled_class_notification.screen.dart';
import 'package:professors/screens/notifications/message_notification.screen.dart';
import 'package:professors/screens/notifications/reservation_class_notification.screen.dart';
import 'package:professors/widgets/text/badges.builder.dart';
import 'package:professors/widgets/text/text.builder.dart';

class NotificationListItemWidget extends StatelessWidget {
  NotificationsScreenConstants constants;
  NotificationsModel notification;

  NotificationListItemWidget(this.constants, this.notification);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        /// if is a class related notification
        if (notification.type == FeedNotificationTypeEnum.CLASS_NOTIFICATION) {

          /// If is a cancellation notification
          if (notification.classObj.notificationType ==
              FeedClassNotificationTypeModel.CANCELLATION) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CancelledClassNotificationScreen(
                    notification.id,
                    notification.sentFromId,
                    notification.sentFromName,
                    notification.pictureUrl,
                    notification.classObj.message),
              ),
            );
          }
          /// if is a reservation notification
          else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReservationClassNotificationScreen(
                    notification.id,
                    notification.sentFromId,
                    notification.sentFromName,
                    notification.pictureUrl),
              ),
            );
          }
        }

        /// If is a message related notification
        else if ( notification.type == FeedNotificationTypeEnum.MESSAGE_NOTIFICATION ) {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessageClassNotificationScreen(
                  notification.id,
                  notification.sentFromId,
                  notification.sentFromName,
                  notification.pictureUrl,
                  notification.messageObj.body
              ),
            ),
          );

        }

      },
      child: Container(
        child: Row(
          children: <Widget>[
            /// Picture
            Flexible(
              flex: 2,
              child: CircleAvatar(
                maxRadius: MediaQuery.of(context).size.width / 10,
                backgroundImage: NetworkImage(notification.pictureUrl),
              ),
            ),

            /// Middle Column
            Expanded(
              flex: 6,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Notification Type Badge
                    getLabelBasedOnNotificationType(context, notification),

                    /// Notification Title
                    getTitleBasedOnNotificationType(context, notification),

                    /// Notification Sub Title
                    getSubTitleBasedOnNotificationType(notification)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getLabelBasedOnNotificationType(
      BuildContext context, NotificationsModel n) {
    String label = '';
    Color color = Colors.teal;

    if (n.type == FeedNotificationTypeEnum.MESSAGE_NOTIFICATION) {
      label = constants.messageLabel;
      color = Colors.amber;
    } else if (n.type == FeedNotificationTypeEnum.CLASS_NOTIFICATION) {
      if (n.classObj.notificationType ==
          FeedClassNotificationTypeModel.RESERVATION) {
        label = constants.bookedLabel;
        color = Colors.teal;
      } else {
        label = constants.cancelledLabel;
        color = Colors.red;
      }
    } else {
      label = constants.systemLabel;
      color = Colors.grey;
    }
    return Row(
      children: <Widget>[
        Expanded(
            flex: 8,
            child: Container(
              child: BadgesBuilder.label(
                  AppLocalizations.of(context).translate(label), color),
            )),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 5),
                child: Icon(FontAwesomeIcons.clock),
              ),
              TextsBuilder.regularText(
                  '${notification.date.hour}:${notification.date.minute}')
            ],
          ),
        ),
      ],
    );
  }

  Widget getTitleBasedOnNotificationType(
      BuildContext context, NotificationsModel n) {
    String title = '';
    if (n.type == FeedNotificationTypeEnum.MESSAGE_NOTIFICATION) {
      return TextsBuilder.h4Bold(title = '${n.sentFromName}');
    }

    // considered to be class related notification
    else if (n.type == FeedNotificationTypeEnum.CLASS_NOTIFICATION) {
      title = '${n.classObj.username}';
    } else {
      title = n.systemObj.title;
    }

    return TextsBuilder.h4Bold(title);
  }

  Widget getSubTitleBasedOnNotificationType(NotificationsModel n) {
    String subTitle = '';
    if (n.type == FeedNotificationTypeEnum.MESSAGE_NOTIFICATION) {
      String body = n.messageObj.body;
      if (body != null) {
        if (body.length > 20) {
          subTitle = '${body.substring(0, 19)}...';
        } else {
          subTitle = '$body';
        }
      } else {
        subTitle = '';
      }
    } else if (n.type == FeedNotificationTypeEnum.CLASS_NOTIFICATION) {
      subTitle = '${n.classObj.discipline}, 17th April, 16:50';
    } else {
      subTitle = '${n.systemObj.subTitle}';
    }
    return TextsBuilder.regularText(subTitle);
  }
}
