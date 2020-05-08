import 'dart:async';

import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/models/language.model.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/classes/class_details.screen.dart';
import 'package:professors/visual/screens/authenticated/classes/create_class_select_language.screen.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/create_or_edit_class.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/badges.builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ClassesScreen extends StatefulWidget {
  ClassConstants screenConstants = ClassConstants();
  ScrollController scrollController = ScrollController();

  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen>
    with AfterInitMixin<ClassesScreen> {
  @override
  Widget build(BuildContext context) {
    double sectionTopMargin = MediaQuery.of(context).size.height / 20;

    return Scaffold(
        body: RefreshIndicator(
      onRefresh: refreshOperation,
      backgroundColor: AppColors.bgMainColor,
      color: AppColors.bgMainColor,
      child: Container(
        /*
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/classes_bg.png"),
            fit: BoxFit.cover,
          ),
        ),*/
        child: CustomScrollView(
          slivers: <Widget>[
            Observer(
              builder: (_) {
                return CustomAppBar(
                  (classesStore.classes.length != 0 && !classesStore.isLoading)
                      ? [
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 20),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateClassSelectLanguageScreen()));
                              },
                              child: Row(
                                children: <Widget>[
                                  //Icon(FontAwesomeIcons.plus, color: AppColors.fontColor,),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: TextsBuilder.h4Bold(
                                        'ADD CLASS'.toUpperCase()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                      : [],
                  hideBackButton: true,
                );
              },
            ),

            /// LOAD
            Observer(
              builder: (_) {
                if (classesStore.isLoading) {
                  return SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      child: DefaultLoaderWidget(),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Container(),
                  );
                }
              },
            ),

            /// CUSTOM SCREEN TITLE
            Observer(
              builder: (_) {
                if (classesStore.classes.length != 0 &&
                    !classesStore.isLoading) {
                  return SliverToBoxAdapter(
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
                                children: <Widget>[
                                  TextsBuilder.jumboBold('CLASSES')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Container(),
                  );
                }
              },
            ),

            /// Add button if no classes were found
            Observer(
              builder: (_) {
                if (classesStore.classes.length == 0 &&
                    !classesStore.isLoading) {
                  return SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextsBuilder.h1Bold(
                              "Welcome ${userStore.firstName}!"),
                          TextsBuilder.h4Bold("Create your first class"),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 20),
                            child: ButtonsBuilder.redFlatButton("CREATE CLASS",
                                () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CreateClassSelectLanguageScreen()));
                            }),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _buildClassItem(context, index);
                      },
                      childCount: classesStore.classes.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }

  _buildClassItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ClassesDetailsScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            bottom: MediaQuery.of(context).size.height * 0.03),
        child: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 3 / 2,
              child: (classesStore.classes[index].pictureUrl != null)
                  ? Image.network(
                      classesStore.classes[index].pictureUrl,
                      fit: BoxFit.fill,
                    )
                  : Container(),
            ),
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Opacity(
                opacity: 0.65,
                child: Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [AppColors.bgMainColor, Colors.transparent],
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
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateOrEditClassScreen(LanguageModel(classesStore.classes[index].languageId, null), classId: classesStore.classes[index].id,)
                  ));
                },
                child: Icon(
                  FontAwesomeIcons.edit,
                  color: AppColors.fontColor,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// STATUS LABEL
                        Container(
                          child: (classesStore.classes[index].isActive)
                              ? BadgesBuilder.label(
                                  AppLocalizations.of(context)
                                      .translate(widget
                                          .screenConstants.classesActiveLabel)
                                      .toUpperCase(),
                                  AppColors.regularGreen)
                              : BadgesBuilder.label(
                                  AppLocalizations.of(context)
                                      .translate(widget
                                          .screenConstants.classesInactiveLabel)
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
                                      classesStore.classes[index].designation),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.clock,
                                          color: AppColors.fontColor,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: TextsBuilder.regularText(
                                              '${classesStore.classes[index].duration} min'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> refreshOperation() async {
    classesStore.setIsLoading(true);
    restServices
        .getClassService()
        .getUserClasses(
            context, classesStore.pageNumber, classesStore.itemsPerPage)
        .then((classes) {
      classesStore.setPageNumber(0);
      classesStore.setClasses(classes);
    }).catchError((error) {
      ToasterBuilder.buildErrorToaster(context, error.cause);
    }).whenComplete(() => classesStore.setIsLoading(false));
    return;
  }

  @override
  void didInitState() {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        print("Get More Data");
      }
    });

    refreshOperation();
  }
}
