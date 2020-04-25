import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/notifications/notifications_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/notifications/notification_details_user_details.widget.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/title_widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class CancelledClassNotificationScreen extends StatelessWidget {
  NotificationsScreenConstants screenConstants = NotificationsScreenConstants();

  int notificationId;
  int studentId;
  String studentUsername;
  String studentPictureUrl;
  String messageBody;

  CancelledClassNotificationScreen(this.notificationId, this.studentId,
      this.studentUsername, this.studentPictureUrl, this.messageBody);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.appBarWithTitle(context, ''),
      body: Padding(
        padding: PaddingsBuilder.regularPadding(context),
        child: CustomScrollView(
          slivers: <Widget>[
            TopTitleWidget(
                AppLocalizations.of(context).translate(
                    screenConstants.cancellationNotificationTopHeader),
                'CancellationNotificationTitleKey'),

            /// USER DETAILS
            SliverToBoxAdapter(
              child: NotificationDetailsUserDetailsWidget(
                  this.studentId,
                  this.studentUsername,
                  this.studentPictureUrl,
                  AppLocalizations.of(context).translate(screenConstants.cancellationNotificationLabel)
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
                  AppLocalizations.of(context).translate(screenConstants.cancellationNotificationMessageLabel),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: ButtonsBuilder.redFlatButton(
                    AppLocalizations.of(context).translate(screenConstants.cancellationNotificationSendButtonLabel),
                        () { },),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
