import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/buttons/buttons_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';
import 'package:professors/localization/constants/general_constants.dart'
as GENERAL_TRANSLATIONS;

class AppBarBuilder {

  static SliverAppBar sliverAppBarWithSaveButton(BuildContext context, String title) {
    return SliverAppBar(
      key: Key('app_bar_key'),
      expandedHeight: 200,
      floating: true,
      pinned: true,
      snap: true,
      backgroundColor: Colors.white,
      leading: Icon(
        Icons.arrow_back,
        color: Colors.black,
        size: 30.0,
      ),
      actions: <Widget>[
        ButtonsBuilder.whiteFlatButton(
            AppLocalizations.of(context).translate(
                GENERAL_TRANSLATIONS.GeneralConstants.BUTTON_SAVE_LABEL),
                () {})
      ],
      flexibleSpace: Center(
        child: Container(
          padding: PaddingsBuilder.regularPadding(context),
          margin: EdgeInsets.only(top: 50.0),
          alignment: Alignment.centerLeft,
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextsBuilder.h1BoldSpan(title),
              ],
            ),
          ),
        ),
      ),
    );
  }

}