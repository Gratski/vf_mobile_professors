import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/screens/classes/class_details.screen.dart';
import 'package:professors/screens/classes/create_class.screen.dart';
import 'package:professors/screens/classes/create_class_select_language.screen.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/dividers/dividers_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/text/badges.builder.dart';
import 'package:professors/widgets/text/text.builder.dart';

class ClassesScreen extends StatelessWidget {
  ClassConstants screenConstants = ClassConstants();

  @override
  Widget build(BuildContext context) {
    double sectionTopMargin = MediaQuery.of(context).size.height / 20;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/classes_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(
              [
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 20),
                  child: ButtonsBuilder.transparentButton(
                    'ADD CLASS'.toUpperCase(),
                    () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => CreateClassSelectLanguageScreen()
                      ));
                    },
                  ),
                ),
              ],
              hideBackButton: true,
            ),

            /// CUSTOM SCREEN TITLE
            SliverToBoxAdapter(
              child: Container(
                padding: AppPaddings.topTitlePadding(context),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    /// Left
                    Flexible(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextsBuilder.h2Bold('ALL'),
                          TextsBuilder.h2Bold('YOUR', color: Colors.red),
                        ],
                      ),
                    ),

                    Flexible(
                      flex: 10,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[TextsBuilder.jumboBold('CLASSES')],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /*
            SliverToBoxAdapter(
              child: Container(
                padding: AppPaddings.regularPadding(context),
                child: Row(
                  children: <Widget>[
                    /// CALENDAR
                    Expanded(
                      flex: 6,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.bgGreyColor, width: 2.0)),
                          child: TextsBuilder.h4Bold(
                              AppLocalizations.of(context).translate(
                                  screenConstants.classesCalendarLabel),
                              color: AppColors.regularGreen),
                        ),
                      ),
                    ),

                    /// SCHEDULE
                    Expanded(
                      flex: 6,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.bgGreyColor, width: 2.0)),
                          child: TextsBuilder.h4Bold(
                              AppLocalizations.of(context).translate(
                                  screenConstants.classesScheduleLabel),
                              color: AppColors.regularGreen),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            */

            /// Classes list
            Observer(
              builder: (BuildContext context) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClassesDetailsScreen()));
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                              bottom:
                                  MediaQuery.of(context).size.height * 0.03),
                          child: Stack(
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 3 / 2,
                                child: Image.network(
                                  classesStore.classes[index].pictureUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              AspectRatio(
                                aspectRatio: 3 / 2,
                                child: Opacity(
                                  opacity: 0.65,
                                  child: Container(
                                    foregroundDecoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.black, Colors.black],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.solidSquare,
                                        color: AppColors.regularRed,
                                        size: 15,
                                      ),
                                      Icon(FontAwesomeIcons.solidSquare,
                                          color: Colors.white, size: 15),
                                      Icon(FontAwesomeIcons.solidSquare,
                                          color: Colors.white, size: 15)
                                    ],
                                  )),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    FontAwesomeIcons.edit,
                                    color: Colors.grey[500],
                                    size: 20,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(top: 5),
                                  decoration: BoxDecoration(
                                      color: AppColors.regularRed,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: TextsBuilder.regularText(
                                      classesStore.classes[index].languageCode,
                                      color: Colors.white),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child:

                                    /// LABEL
                                    Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height / 6,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          /// STATUS LABEL
                                          Container(
                                            child: (classesStore
                                                    .classes[index].isActive)
                                                ? BadgesBuilder.label(
                                                    AppLocalizations.of(context)
                                                        .translate(screenConstants
                                                            .classesActiveLabel)
                                                        .toUpperCase(),
                                                    AppColors.regularGreen)
                                                : BadgesBuilder.label(
                                                    AppLocalizations.of(context)
                                                        .translate(screenConstants
                                                            .classesInactiveLabel)
                                                        .toUpperCase(),
                                                    AppColors.regularRed),
                                          ),

                                          /// DETAILS
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Row(
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    TextsBuilder.h3Bold(
                                                        classesStore
                                                            .classes[index]
                                                            .designation),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5),
                                                      child: TextsBuilder.regularText(
                                                          ''
                                                          '${AppLocalizations.of(context).translate(screenConstants.classesDurationLabel)}: '
                                                          '${classesStore.classes[index].duration} min'),
                                                    ),
                                                  ],
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        /// DIFFICULTY
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );
                  }, childCount: classesStore.classes.length),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
