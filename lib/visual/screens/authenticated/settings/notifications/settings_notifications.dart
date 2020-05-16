import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/notifications/settings_notifications_constants.dart';
import 'package:professors/models/notification_preference_type.model.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:professors/globals/global_vars.dart';

class SettingsNotificationsScreen extends StatelessWidget {

  SettingsNotificationsConstants screenConstants = SettingsNotificationsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[

            CustomAppBar([]),

            AppHeaderWidget(AppLocalizations.of(context).translate(screenConstants.topHeader)),

            Observer(
              builder: (_) {
                if ( notificationsStore.isLoading ) {
                  return SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
                      child: DefaultLoaderWidget(),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Container(
                        padding: AppPaddings.regularPadding(context),
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            /// MESSAGES NOTIFICATIONS
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: TextsBuilder.h2Bold(AppLocalizations.of(context).translate(screenConstants.messagesLabel)),
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Observer(
                                              builder: (_) {
                                                return CupertinoSwitch(
                                                  value: notificationsStore.messageNotificationsActive,
                                                  onChanged: (newValue) => _toggleNotification(context, NotificationPreferenceTypeModel.GENERAL,notificationsStore.messageNotificationsActive),
                                                );
                                              },
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 15.0),
                                          child: TextsBuilder.regularText(AppLocalizations.of(context).translate(screenConstants.messagesHint)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            /// REMINDERS NOTIFICATIONS
                            Container(
                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: TextsBuilder.h2Bold(AppLocalizations.of(context).translate(screenConstants.remindersLabel)),
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Observer(
                                              builder: (_) {
                                                return CupertinoSwitch(
                                                  value: notificationsStore.reminderNotificationsActive,
                                                  onChanged: (newValue) => _toggleNotification(context, NotificationPreferenceTypeModel.REMINDER,notificationsStore.reminderNotificationsActive),
                                                );
                                              },
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 15.0),
                                          child: TextsBuilder.regularText(AppLocalizations.of(context).translate(screenConstants.remindersHint),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            /// SUPPORT NOTIFICATIONS
                            Container(
                              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: TextsBuilder.h2Bold(AppLocalizations.of(context).translate(screenConstants.accountSupportLabel)),
                                      ),
                                      Expanded(
                                          flex: 4,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Observer(
                                              builder: (_) {
                                                return CupertinoSwitch(
                                                  value: notificationsStore.supportNotificationsActive,
                                                  onChanged: (newValue) => _toggleNotification(context, NotificationPreferenceTypeModel.SYSTEM,notificationsStore.supportNotificationsActive),
                                                );
                                              },
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 15.0),
                                          child: TextsBuilder.regularText(AppLocalizations.of(context).translate(screenConstants.accountSupportHint)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                }
              },
            ),
          ],
        ));
  }

  _toggleNotification(BuildContext context, NotificationPreferenceTypeModel type, bool state) {
    HapticFeedback.lightImpact();
    restServices.getUserService().toggleUserNotificationPreference(context, type, state);
  }
}
