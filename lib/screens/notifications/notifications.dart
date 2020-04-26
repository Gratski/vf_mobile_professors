import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/notifications/notifications_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/notifications/notification_list_item.widget.dart';
import 'package:professors/widgets/structural/title_widget.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  NotificationsScreenConstants screenConstants = NotificationsScreenConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.regularPadding(context),
        child: CustomScrollView(
          slivers: <Widget>[
            TopTitleWidget(
              AppLocalizations.of(context).translate(screenConstants.topHeader),
              'FeedNotificationsTitleKey'
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: NotificationListItemWidget(
                          screenConstants,
                          feedNotificationsStore.notifications[index]
                      ),
                    );
                  },
                  childCount: feedNotificationsStore.notifications.length
              ),
            ),
          ],
        ),
      ),
    );
  }

}
