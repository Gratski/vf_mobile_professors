import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/notifications/notifications_constants.dart';
import 'package:professors/styles/padding.dart';
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
        padding: PaddingsBuilder.regularPadding(context),
        child: CustomScrollView(
          slivers: <Widget>[
            TopTitleWidget(
              AppLocalizations.of(context).translate(screenConstants.topHeader),
              'FeedNotificationsTitleKey'
            ),

            
          ],
        ),
      ),
    );
  }

}
