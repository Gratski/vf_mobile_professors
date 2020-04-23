import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/buttons/buttons_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';
import 'package:professors/localization/constants/general_constants.dart'
as GENERAL_TRANSLATIONS;

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

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

  static AppBar appBarWithSaveButton(BuildContext context, VoidCallback callBack) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back_ios, color: Colors.black,),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        ButtonsBuilder.whiteFlatButton(
            AppLocalizations.of(context).translate(
                GENERAL_TRANSLATIONS.GeneralConstants.BUTTON_SAVE_LABEL),
                callBack)
      ],
    );
  }

  static AppBar appBarWithTitle(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back_ios, color: Colors.black,),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: Text(title, style: TextStyle(color: Colors.black),),
      centerTitle: false,
      /**
      bottom: TabBar(
        isScrollable: true,
        tabs: choices.map((Choice choice) {
          return Tab(
            text: choice.title,
            icon: Icon(choice.icon),
          );
        }).toList(),
      ),
      **/
    );
  }

}