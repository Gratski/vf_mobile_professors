import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/dividers/dividers_builder.dart';
import 'package:professors/visual/widgets/structural/icons/icons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:professors/localization/constants/dashboard/dashboard_constants.dart'
    as TRANSLATIONS;
import 'package:professors/globals/global_vars.dart';

class DashboardScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.regularPadding(context),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              key: Key('sliver_app_bar'),
              backgroundColor: Colors.transparent,
              title: RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextsBuilder.h1BoldSpan(AppLocalizations.of(context)
                          .translate(TRANSLATIONS.DashboardConstants.HEADER)),
                      TextsBuilder.h3LightSpan('\n' + 'Hello' + ' User Name!'),
                    ]),
              ),
              centerTitle: false,
            ),
            SliverToBoxAdapter(
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    DividersBuilder.dividerWithCenteredText('Overview'),

                    /// STATISTICS TOTAL
                    Observer(builder: (_) {
                      if (dashboardStore.isLoading) {
                        return CircularProgressIndicator();
                      } else {
                        return Container(
                          child: Row(
                            children: <Widget>[
                              // evaluation item
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Observer(
                                          builder: (_) {
                                            return TextsBuilder.h3Bold(
                                                '${dashboardStore.score}');
                                          },
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        )
                                      ],
                                    ),
                                    TextsBuilder.regularText(
                                        AppLocalizations.of(context).translate(
                                            TRANSLATIONS
                                                .DashboardConstants.STATS_RATE))
                                  ],
                                ),
                              ),

                              /// total reviews
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Observer(
                                          builder: (_) {
                                            return TextsBuilder.h3Bold(
                                                '${dashboardStore.totalComments}');
                                          },
                                        ),
                                      ],
                                    ),
                                    TextsBuilder.regularText(
                                        AppLocalizations.of(context).translate(
                                            TRANSLATIONS.DashboardConstants
                                                .STATS_NUMBER_OF_COMMENTS))
                                  ],
                                ),
                              ),

                              /// total of students
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Observer(
                                          builder: (_) {
                                            return TextsBuilder.h3Bold(
                                                '${dashboardStore.totalNumberOfStudents}');
                                          },
                                        ),
                                      ],
                                    ),
                                    TextsBuilder.regularText(
                                        AppLocalizations.of(context).translate(
                                            TRANSLATIONS.DashboardConstants
                                                .STATS_NUMBER_OF_STUDENTS))
                                  ],
                                ),
                              ),

                              /// total classes created
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Observer(
                                          builder: (_) {
                                            return TextsBuilder.h3Bold(
                                                '${dashboardStore.totalNumberOfClasses}');
                                          },
                                        ),
                                      ],
                                    ),
                                    TextsBuilder.regularText(
                                        AppLocalizations.of(context).translate(
                                            TRANSLATIONS.DashboardConstants
                                                .STATS_NUMBER_OF_CLASSES))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    }),

                    /// STATISTICS CURRENT MONTH
                    DividersBuilder.dividerWithCenteredText('This Month'),
                    Observer(
                      builder: (_) {
                        if (dashboardStore.isLoading) {
                          return CircularProgressIndicator();
                        } else {
                          return Container(
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.02),
                            child: Row(
                              children: <Widget>[
                                /// NUMBER OF STUDENTS
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Observer(
                                            builder: (_) {
                                              return TextsBuilder.h3Bold(
                                                  '${dashboardStore.currentMonthNumberOfStudents}');
                                            },
                                          ),
                                        ],
                                      ),
                                      TextsBuilder.regularText(
                                          AppLocalizations.of(context)
                                              .translate(TRANSLATIONS
                                                  .DashboardConstants
                                                  .STATS_NUMBER_OF_STUDENTS))
                                    ],
                                  ),
                                ),

                                /// INCOME
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Observer(
                                            builder: (_) {
                                              return TextsBuilder.h3Bold(
                                                  '${dashboardStore.currentMonthIncome} €');
                                            },
                                          ),
                                        ],
                                      ),
                                      TextsBuilder.regularText(
                                          AppLocalizations.of(context)
                                              .translate(TRANSLATIONS
                                                  .DashboardConstants
                                                  .STATS_INCOME))
                                    ],
                                  ),
                                ),

                                /// total of students
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Observer(
                                            builder: (_) {
                                              return TextsBuilder.h3Bold(
                                                  '${dashboardStore.currentMonthNumberOfStudents}');
                                            },
                                          ),
                                        ],
                                      ),
                                      TextsBuilder.regularText(
                                          AppLocalizations.of(context)
                                              .translate(TRANSLATIONS
                                                  .DashboardConstants
                                                  .STATS_CANCELLATIONS_NUMBER))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),

                    /// NEXT CLASSES
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              if (dashboardStore.isClassesLoading) {
                                return Text('');
                              } else {
                                return TextsBuilder.h1Bold(
                                    AppLocalizations.of(context).translate(
                                        TRANSLATIONS.DashboardConstants
                                            .HEADER_NEXT_CLASSES));
                              }
                            },
                          ),
                          Observer(
                            builder: (_) {
                              if (!dashboardStore.isClassesLoading) {
                                // show next classes list if there any
                                if (dashboardStore.classes.length > 0) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        dashboardStore.classes.length,
                                    itemBuilder: (_, int index) {
                                      return Text(
                                          '${dashboardStore.classes[index].designation}');
                                    },
                                  );
                                } else {
                                  return Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 15.0),
                                        child: TextsBuilder.regularText(
                                          AppLocalizations.of(context)
                                              .translate(TRANSLATIONS
                                                  .DashboardConstants
                                                  .NEXT_CLASSES_NOT_FOUND_TEXT),
                                        ),
                                      ),

                                      ///BUTTON TO ADD CLASS
                                      Container(
                                        margin: EdgeInsets.only(top: 15.0),
                                        child: ButtonsBuilder.redFlatButton(
                                            AppLocalizations.of(context)
                                                .translate(TRANSLATIONS
                                                    .DashboardConstants
                                                    .NEXT_CLASSES_CREATE_CLASS_BUTTON),
                                            () {}),
                                      ),
                                    ],
                                  );
                                }
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    /// YOUR CLASSIFICATION
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              if (dashboardStore.isLoading) {
                                return CircularProgressIndicator();
                              } else {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    /// TITLE
                                    TextsBuilder.h1Bold(
                                      AppLocalizations.of(context).translate(
                                          TRANSLATIONS.DashboardConstants
                                              .HEADER_CLASSIFICATIONS),
                                    ),
                                    Row(
                                        children:
                                            IconsBuilder.startListBasedOnScore(
                                                dashboardStore.score)),
                                    Container(
                                      margin: EdgeInsets.only(top: 15.0),
                                      child: (dashboardStore.score < 3)
                                          ? TextsBuilder.regularText(
                                              AppLocalizations.of(context)
                                                  .translate(TRANSLATIONS
                                                      .DashboardConstants
                                                      .CLASSIFICATION_LOW_TEXT),
                                            )
                                          : (dashboardStore.score < 4.5)
                                              ? TextsBuilder.regularText(
                                                  AppLocalizations.of(context)
                                                      .translate(TRANSLATIONS
                                                          .DashboardConstants
                                                          .CLASSIFICATION_AVERAGE_TEXT),
                                                )
                                              : TextsBuilder.regularText(
                                                  AppLocalizations.of(context)
                                                      .translate(TRANSLATIONS
                                                          .DashboardConstants
                                                          .CLASSIFICATION_HIGH_TEXT),
                                                ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(Color color, String title) => Container(
        height: 100.0,
        color: color,
        child: Center(
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter'),
          ),
        ),
      );
}
