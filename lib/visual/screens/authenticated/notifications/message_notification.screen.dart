import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/notifications/notifications_constants.dart';
import 'package:professors/visual/widgets/notifications/notification_details_user_details.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class MessageClassNotificationScreen extends StatelessWidget {
  NotificationsScreenConstants screenConstants = NotificationsScreenConstants();

  int notificationId;
  int studentId;
  String studentUsername;
  String studentPictureUrl;
  String messageBody;

  MessageClassNotificationScreen(this.notificationId, this.studentId,
      this.studentUsername, this.studentPictureUrl, this.messageBody);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        child: CustomScrollView(
          slivers: <Widget>[

            CustomAppBar([]),

            AppHeaderWidget(AppLocalizations.of(context).translate(
                screenConstants.messageNotificationTopHeader)),

            /// USER DETAILS
            SliverToBoxAdapter(
              child: NotificationDetailsUserDetailsWidget(
                  this.studentId,
                  this.studentUsername,
                  this.studentPictureUrl,
                  AppLocalizations.of(context).translate(screenConstants.messageNotificationLabel)
              ),
            ),

            /// CANCELLATION MESSAGE
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: TextsBuilder.regularText(messageBody),
              ),
            ),

            /// MESSAGE INPUT FIELD
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2.0, color: Colors.grey[300]
                        )
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  maxLength: 150,
                ),
              ),
            ),

            /// MESSAGE HINT
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: TextsBuilder.textSmall(
                  AppLocalizations.of(context).translate(screenConstants.messageNotificationMessageLabel),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: ButtonsBuilder.redFlatButton(
                  AppLocalizations.of(context).translate(screenConstants.messageNotificationSendButtonLabel),
                      () { },),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
