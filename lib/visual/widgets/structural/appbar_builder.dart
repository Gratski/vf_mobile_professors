import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike)
];

class AppBarBuilder {
  static SliverAppBar sliverAppBarWithSaveButton(
      BuildContext context, String title) {
    GeneralConstants generalConstants = GeneralConstants();

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
        ButtonsBuilder.transparentButton(
            AppLocalizations.of(context)
                .translate(generalConstants.buttonSaveLabel),
            () {})
      ],
      flexibleSpace: Center(
        child: Container(
          padding: AppPaddings.regularPadding(context),
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

  static AppBar appBarWithSaveButton(
      BuildContext context, VoidCallback callBack) {

    GeneralConstants generalConstants = GeneralConstants();

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        ButtonsBuilder.transparentButton(
            AppLocalizations.of(context).translate(generalConstants.buttonSaveLabel),
            callBack)
      ],
    );
  }

  static AppBar appBarWithTitle(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        (title != null) ? title : '',
        style: TextStyle(color: Colors.black),
      ),
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

  static AppBar appBarWithTitleAndSaveButton(BuildContext context, String title, VoidCallback callback) {

    GeneralConstants generalConstants = new GeneralConstants();

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: false,
      actions: <Widget>[
        ButtonsBuilder.transparentButton(
            AppLocalizations.of(context).translate(generalConstants.buttonSaveLabel),
            callback)
      ],
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

  static appBarWithTitleAndTabs(BuildContext context, String title) {
    TabController tabController = new TabController(length: 2);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: false,
      bottom: TabBar(
        isScrollable: true,
        tabs: <Widget>[
          Tab(
            child: Text('This month'),
          ),
          Tab(
            child: Text('Total'),
          ),
        ],
      ),
    );
  }
}
