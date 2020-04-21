import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/buttons/buttons_builder.dart';
import 'package:professors/widgets/dividers/dividers_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';
import 'package:professors/localization/constants/dashboard_constants.dart' as TRANSLATIONS;

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: PaddingsBuilder.regularPadding(context),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                key: Key('sliver_app_bar'),
                backgroundColor: Colors.white,
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
                    Container(
                      child: Row(
                        children: <Widget>[
                          // evaluation item
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextsBuilder.h3Bold('5'),
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                                TextsBuilder.regularText(
                                    AppLocalizations.of(context).translate(
                                        TRANSLATIONS.DashboardConstants.STATS_RATE))
                              ],
                            ),
                          ),

                          // total reviews
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[TextsBuilder.h3Bold('30')],
                                ),
                                TextsBuilder.regularText(
                                    AppLocalizations.of(context).translate(
                                        TRANSLATIONS.DashboardConstants
                                            .STATS_NUMBER_OF_COMMENTS))
                              ],
                            ),
                          ),

                          // total of students
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[TextsBuilder.h3Bold('100')],
                                ),
                                TextsBuilder.regularText(
                                    AppLocalizations.of(context).translate(
                                        TRANSLATIONS.DashboardConstants
                                            .STATS_NUMBER_OF_STUDENTS))
                              ],
                            ),
                          ),

                          // total classes created
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[TextsBuilder.h3Bold('10')],
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
                    ),

                    /// STATISTICS CURRENT MONTH
                    DividersBuilder.dividerWithCenteredText('This Month'),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.02),
                      child: Row(
                        children: <Widget>[
                          // evaluation item
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[TextsBuilder.h3Bold('20')],
                                ),
                                TextsBuilder.regularText(
                                    AppLocalizations.of(context).translate(
                                        TRANSLATIONS.DashboardConstants
                                            .STATS_NUMBER_OF_STUDENTS))
                              ],
                            ),
                          ),

                          // total reviews
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[TextsBuilder.h3Bold('€100')],
                                ),
                                TextsBuilder.regularText(
                                    AppLocalizations.of(context).translate(
                                        TRANSLATIONS
                                            .DashboardConstants.STATS_INCOME))
                              ],
                            ),
                          ),

                          // total of students
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[TextsBuilder.h3Bold('5')],
                                ),
                                TextsBuilder.regularText(
                                    AppLocalizations.of(context).translate(
                                        TRANSLATIONS.DashboardConstants
                                            .STATS_CANCELLATIONS_NUMBER))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// NEXT CLASSES
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextsBuilder.h1BoldSpan(
                                      AppLocalizations.of(context).translate(
                                          TRANSLATIONS.DashboardConstants
                                              .HEADER_NEXT_CLASSES))
                                ]),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15.0),
                              child: TextsBuilder.regularText(
                                  AppLocalizations.of(context).translate(
                                      TRANSLATIONS.DashboardConstants
                                          .NEXT_CLASSES_NOT_FOUND_TEXT))),

                          ///BUTTON TO ADD CLASS
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: ButtonsBuilder.redFlatButton(
                                AppLocalizations.of(context).translate(TRANSLATIONS.DashboardConstants.NEXT_CLASSES_CREATE_CLASS_BUTTON),
                                    () { }
                                ),
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
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextsBuilder.h1BoldSpan(
                                        AppLocalizations.of(context).translate(
                                            TRANSLATIONS.DashboardConstants
                                                .HEADER_CLASSIFICATIONS))
                                  ]),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.red,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.red,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.red,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.red,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.red,
                                )
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 15.0),
                                child: TextsBuilder.regularText(
                                    AppLocalizations.of(context).translate(
                                        TRANSLATIONS.DashboardConstants
                                            .CLASSIFICATION_HIGH_TEXT))),
                          ],
                        ))
                  ],
                )),
              )
            ],
      ),
    ));
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
