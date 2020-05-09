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

class ClassDeletedScreen extends StatelessWidget {

  ClassConstants screenConstants = ClassConstants();

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
                  child: TextsBuilder.h2Bold(AppLocalizations.of(context).translate(screenConstants.classDeletedTopHeader)),
                ),

                // SUB TITLE
                Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
                    child: TextsBuilder.h2Bold(
                      AppLocalizations.of(context).translate(screenConstants.classDeletedSubTitle),)
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
