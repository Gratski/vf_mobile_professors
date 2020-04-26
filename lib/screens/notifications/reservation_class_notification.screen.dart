import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/notifications/notifications_constants.dart';
import 'package:professors/widgets/notifications/notification_details_user_details.widget.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class ReservationClassNotificationScreen extends StatelessWidget {
  NotificationsScreenConstants screenConstants = NotificationsScreenConstants();

  int notificationId;
  int studentId;
  String studentUsername;
  String studentPictureUrl;

  ReservationClassNotificationScreen(this.notificationId, this.studentId,
      this.studentUsername, this.studentPictureUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        child: CustomScrollView(
          slivers: <Widget>[

            CustomAppBar([]),

            AppHeaderWidget(AppLocalizations.of(context).translate(
                screenConstants.bookedNotificationTopHeader)),

            /// USER DETAILS
            SliverToBoxAdapter(
              child: NotificationDetailsUserDetailsWidget(
                  this.studentId,
                  this.studentUsername,
                  this.studentPictureUrl,
                  AppLocalizations.of(context).translate(screenConstants.bookedNotificationLabel)
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
                  AppLocalizations.of(context).translate(screenConstants.bookedNotificationMessageLabel),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: ButtonsBuilder.redFlatButton(
                  AppLocalizations.of(context).translate(screenConstants.bookedNotificationSendButtonLabel),
                      () { },),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
