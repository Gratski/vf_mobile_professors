import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/notifications/settings_notifications_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/title_widget.dart';
import 'package:professors/widgets/text/text.builder.dart';
import 'package:professors/globals/global_vars.dart';

class SettingsNotificationsScreen extends StatelessWidget {

  SettingsNotificationsConstants screenConstants = SettingsNotificationsConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBuilder.appBarWithTitle(
            context,
            null),
        body: CustomScrollView(
          slivers: <Widget>[
            TopTitleWidget(
              AppLocalizations.of(context).translate(screenConstants.topHeader),
              'SettingsNotificationsTitleKey'
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: PaddingsBuilder.regularPadding(context),
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
                                          onChanged: (newValue) => notificationsStore.setMessageNotificationsActive(newValue),
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
                                            onChanged: (newValue) => notificationsStore.setReminderNotificationsActive(newValue),
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
                                            onChanged: (newValue) => notificationsStore.setSupportNotificationsActive(newValue),
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
            )
          ],
        ));
  }
}
