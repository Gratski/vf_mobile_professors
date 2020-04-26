import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/screens/classes/class_details.screen.dart';
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
        child: CustomScrollView(
          slivers: <Widget>[
            CustomAppBar(
              [
                Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 20),
                    child: ButtonsBuilder.whiteFlatButton('Add Class', () {})),
              ],
              hideBackButton: true,
            ),
            AppHeaderWidget('Classes',
                subTitle: 'All your classes are listed here'),

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

            Observer(
              builder: (BuildContext context) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: AppPaddings.regularPadding(context),
                      child: Column(
                        children: <Widget>[
                          /// LABEL
                          Row(
                            children: <Widget>[
                              Flexible(
                                flex: 5,
                                child: Container(
                                  child: (classesStore.classes[index].isActive)
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
                              ),
                            ],
                          ),

                          /// DETAILS
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Row(
                              children: <Widget>[
                                /// TEXTUAL DETAILS
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    children: <Widget>[
                                      TextsBuilder.h3Bold(classesStore
                                          .classes[index].designation),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: TextsBuilder.regularText(''
                                            '${AppLocalizations.of(context).translate(screenConstants.classesDurationLabel)}: '
                                            '${classesStore.classes[index].duration} min'),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: TextsBuilder.h4Bold(
                                            classesStore
                                                .classes[index].languageCode,
                                            color: Colors.black54),
                                      ),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ),

                                /// IMAGE
                                Expanded(
                                  flex: 4,
                                  child: FadeInImage(
                                    image: NetworkImage(
                                        classesStore.classes[index].pictureUrl),
                                    fit: BoxFit.cover,
                                    placeholder:
                                        AssetImage('assets/images/loading.gif'),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// ACTIONS
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClassesDetailsScreen()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20),
                                      child: TextsBuilder.regularLink(
                                        AppLocalizations.of(context).translate(
                                            screenConstants.classesViewLabel),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width /
                                                20),
                                    child: TextsBuilder.regularLink(
                                      AppLocalizations.of(context).translate(
                                          screenConstants.classesEditLabel),
                                    ),
                                  ),
                                ),
                                /*
                                Expanded(
                                  flex: 3,
                                  child: TextsBuilder.regularLink(
                                    AppLocalizations.of(context).translate(
                                        screenConstants.classesShareLabel),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: TextsBuilder.regularLink(
                                    AppLocalizations.of(context).translate(
                                        screenConstants.classesAddDatesLabel),
                                  ),

                                ),*/
                              ],
                            ),
                          ),

                          ///DIVIDER
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child:
                                DividersBuilder.dividerWithCenteredText(null),
                          ),
                        ],
                      ),
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
