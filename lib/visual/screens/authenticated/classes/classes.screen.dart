import 'dart:async';

import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/models/language.model.dart';
import 'package:professors/utils/classes.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/classes/class_details.screen.dart';
import 'package:professors/visual/screens/authenticated/classes/create_class_select_language.screen.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/create_or_edit_class.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
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
          child: Column(
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(top: 40),
                child: TextsBuilder.regularText("Test"),
              ),

              Observer(
                builder: (_) {
                  return Expanded(
                    child: ListView.builder(
                      controller: widget.scrollController,
                      itemCount: classesStore.classes.length,
                      itemBuilder: (context, index) {
                        return _buildClassItem(context, index);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
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
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: ClassesUtils().getChipByDifficultyLevel(
                  context, classesStore.classes[index].difficultyLevel),
            ),
            Positioned(
                top: 10,
                right: 10,
                child: ButtonsBuilder.transparentCustomButton(
                    Icon(
                      FontAwesomeIcons.edit,
                      color: AppColors.fontColor,
                      size: 20,
                    ), () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateOrEditClassScreen(
                            LanguageModel(
                                classesStore.classes[index].languageId, null),
                            classId: classesStore.classes[index].id,
                          )));
                })),
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
                    classesStore.classes[index].languageCode.toUpperCase(),
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
                            child: ClassesUtils().getChipByStatus(
                                context, classesStore.classes[index].status)),

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
    classesStore.resetOffset();
    restServices
        .getClassService()
        .getUserClasses(
            context, classesStore.offset, classesStore.itemsPerPage)
        .then((resp) {
      classesStore.setClasses(resp.items, resp.total);
    }).catchError((error) {
      ToasterBuilder.buildErrorToaster(context, error.cause);
    }).whenComplete(() => classesStore.setIsLoading(false));
    return;
  }

  @override
  void didInitState() {
    widget.scrollController.addListener(() {
      if ( widget.scrollController.position.pixels == widget.scrollController.position.maxScrollExtent
          && classesStore.totalClasses > classesStore.offset && !classesStore.isLoadingNext) {
        classesStore.setIsLoadingNext(true);
        restServices.getClassService().getUserClasses(context, classesStore.offset, 10)
        .then((resp) => classesStore.addNextClasses(resp.items, resp.total))
        .catchError((e) => ToasterBuilder.buildErrorToaster(context, "Something went wrong"))
        .whenComplete(() => classesStore.setIsLoadingNext(false));
      }
    });

    refreshOperation();
  }
}
