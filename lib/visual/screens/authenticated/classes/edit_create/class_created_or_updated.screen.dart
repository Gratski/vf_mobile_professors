import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/localization/constants/settings/notifications/settings_notifications_constants.dart';
import 'package:professors/models/notification_preference_type.model.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:professors/globals/global_vars.dart';

class ClassCreatedOrUpdatedScreen extends StatelessWidget {

  ClassConstants screenConstants = ClassConstants();

  // false if updated, true if a new class has been created
  bool hasCreated;
  ClassCreatedOrUpdatedScreen(this.hasCreated);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[

            CustomAppBar([], hideBackButton: true,),

            SliverToBoxAdapter(
              child: Column(
                children: [

                  // TITLE
                  Container(
                    child: TextsBuilder.h2Bold(AppLocalizations.of(context).translate(screenConstants.classCreatedOrUpdatedTopHeader)),
                  ),

                  // SUB TITLE
                  Container(
                    padding: AppPaddings.regularPadding(context),
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
                    child: TextsBuilder.h4Bold(
                  (hasCreated) ?
                        AppLocalizations.of(context).translate(screenConstants.classCreatedOrUpdatedSubTitleCreated) :
                        AppLocalizations.of(context).translate(screenConstants.classCreatedOrUpdatedSubTitleUpdated),)
                  ),

                  // BUTTON BACK HOME
                  Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
                      child: ButtonsBuilder.redFlatButton(AppLocalizations.of(context).translate(screenConstants.classCreatedOrUpdatedOkButtonLabel), () {
                        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                      })
                  ),

                ],
              ),
            ),

          ],
        ),);
  }
}
