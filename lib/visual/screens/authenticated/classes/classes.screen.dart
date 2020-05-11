import 'dart:async';

import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
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
import 'package:professors/visual/widgets/text/text.builder.dart';

class ClassesScreen extends StatefulWidget {
  ClassConstants screenConstants = ClassConstants();
  GeneralConstants generalConstants = GeneralConstants();
  ScrollController scrollController = ScrollController();
  BuildContext buildContext;

  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen>
    with AfterInitMixin<ClassesScreen> {
  @override
  Widget build(BuildContext context) {
    double sectionTopMargin = MediaQuery.of(context).size.height / 20;
    widget.buildContext = context;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshOperation,
        backgroundColor: AppColors.bgMainColor,
        color: AppColors.regularRed,
        child: Container(
          padding: AppPaddings.regularPadding(context),

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/classes_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
          child: CustomScrollView(
            controller: widget.scrollController,
            slivers: [

              ////////////////////////////////////////////////////////
              // If is loading content
              ////////////////////////////////////////////////////////
              Observer(
                builder: (_) {
                  return SliverToBoxAdapter(
                    child: ( classesStore.isLoading ) ? Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3),
                      child: DefaultLoaderWidget(),
                    ) : Container(),
                  );
                },
              ),

              ////////////////////////////////////////////////////////
              // If has no classes yet
              ////////////////////////////////////////////////////////
              Observer(builder: (_) {
                return SliverToBoxAdapter(
                  child: (classesStore.classes.length == 0 &&
                          !classesStore.isLoading)
                      ? Container(
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
                                    top: MediaQuery.of(context).size.height /
                                        20),
                                child: ButtonsBuilder.redFlatButton(
                                  "CREATE CLASS",
                                  () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            CreateClassSelectLanguageScreen()));
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                );
              }),

              ////////////////////////////////////////////////////////
              // If classes have been found
              ////////////////////////////////////////////////////////
              Observer(
                builder: (_){
                  return SliverToBoxAdapter(
                    child: (classesStore.classes.length > 0 && !classesStore.isLoading )
                        ? Container(child: Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonsBuilder.transparentCustomButton(
                              TextsBuilder.h4Bold("ADD CLASS"), () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      CreateClassSelectLanguageScreen()));
                            },)
                          ],
                        )
                    ),)
                        : Container(),
                  );
                },
              ),
              _buildTitle(context),
              Observer(
                builder: (_) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _buildClassItem(context, index);
                      },
                      childCount: classesStore.classes.length,
                    ),
                  );
                },
              ),

              /// Loading next classes
              Observer(
                builder: (_) {
                  if ( classesStore.isLoadingNext ) {
                    return SliverToBoxAdapter(
                      child: DefaultLoaderWidget(),
                    );
                  } else {
                    if ( classesStore.totalClasses > classesStore.offset ) {
                      return SliverToBoxAdapter(
                        child: ButtonsBuilder.redFlatButton(
                        AppLocalizations.of(context).translate(widget.generalConstants.loadMoreButtonLabel), () {
                          _loadMore(context);
                        }),
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: Container(),
                      );
                    }
                  }
                }
              ),
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
            MaterialPageRoute(builder: (context) => ClassDetailsScreen(classesStore.classes[index].id)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 3 / 2,
                child: (classesStore.classes[index].pictureUrl != null)
                    ? Image.network(
                  classesStore.classes[index].pictureUrl,
                  fit: BoxFit.cover,
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
                          colors: [Color.fromRGBO(3, 3, 3, 0.4), Color.fromRGBO(3, 3, 3, 0.01)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: ClassesUtils().getDifficultyLevelSquares(classesStore.classes[index].difficultyLevel),
                    ),
                    TextsBuilder.textSmall(ClassesUtils().getDifficultyLevelText(context, classesStore.classes[index].difficultyLevel).toUpperCase(), color: Colors.white),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateOrEditClassScreen(
                          LanguageModel(
                              classesStore.classes[index].languageId, null, null),
                          classId: classesStore.classes[index].id,
                        )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      FontAwesomeIcons.edit,
                      color: AppColors.fontColor,
                      size: 20,
                    ),
                  ),
                )
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
                                    TextsBuilder.h4Bold(
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
                                                '${classesStore.classes[index].duration} ${AppLocalizations.of(context).translate(widget.generalConstants.wordMinutes)}'),
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
      ),
    );
  }

  _buildTitle(BuildContext context) {
    return Observer(
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
                        TextsBuilder.h2Bold(AppLocalizations.of(context).translate(widget.screenConstants.classesAllWord)),
                        TextsBuilder.h2Bold(AppLocalizations.of(context).translate(widget.screenConstants.classesYourWord), color: Colors.red),
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
                          TextsBuilder.jumboBold(context, AppLocalizations.of(context).translate(widget.screenConstants.classesClassesWord).toUpperCase())
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
    );
  }

  Future<void> refreshOperation() async {
    classesStore.resetOffset();
    restServices
        .getClassService()
        .getUserClasses(context, classesStore.offset, classesStore.itemsPerPage)
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
      if (widget.scrollController.position.pixels >
              widget.scrollController.position.maxScrollExtent - 50 &&
          classesStore.totalClasses > classesStore.offset &&
          !classesStore.isLoadingNext &&
          classesStore.classes.length > 0) {
        _loadMore(context);
      }
    });

    refreshOperation();
  }

  _loadMore(BuildContext context) {
    classesStore.setIsLoadingNext(true);
    restServices
        .getClassService()
        .getUserClasses(widget.buildContext, classesStore.offset, 10)
        .then((resp) => classesStore.addNextClasses(resp.items, resp.total))
        .catchError((e) => ToasterBuilder.buildErrorToaster(
        context, "Something went wrong"))
        .whenComplete(() => classesStore.setIsLoadingNext(false));
  }
}
