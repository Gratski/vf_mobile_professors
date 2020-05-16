import 'dart:async';

import 'package:after_init/after_init.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/store/classes/classes_state.dart';
import 'package:professors/utils/classes.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/classes/class_details.screen.dart';
import 'package:professors/visual/screens/authenticated/classes/create_class_select_language.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/icons/icons_builder.dart';
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

  final classesStore = ClassesState();

  @override
  Widget build(BuildContext context) {
    double sectionTopMargin = MediaQuery.of(context).size.height / 20;
    widget.buildContext = context;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: refreshOperation,
        backgroundColor: Colors.white,
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
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [

              ////////////////////////////////////////////////////////
              // If is loading content
              ////////////////////////////////////////////////////////
              Observer(
                builder: (_) {
                  if ( classesStore.isLoading && !classesStore.isRefreshing ) {
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

              ////////////////////////////////////////////////////////
              // If has no classes yet
              ////////////////////////////////////////////////////////
              Observer(builder: (_) {
                if (classesStore.classes.length == 0 &&
                    !classesStore.isLoading && !classesStore.isRefreshing) {
                  return SliverToBoxAdapter(
                    child: Container(
                      color: Colors.white,
                      padding: AppPaddings.regularAllPadding(context),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextsBuilder.h1Bold(
                              "${AppLocalizations.of(context).translate(widget.generalConstants.welcomeTopHeader)} ${userStore.firstName}!"),
                          TextsBuilder.h4Bold("${AppLocalizations.of(context).translate(widget.generalConstants.welcomeSubTitle)}"),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height /
                                    20),
                            child: ButtonsBuilder.redFlatButton(
                              "${AppLocalizations.of(context).translate(widget.generalConstants.welcomeCreateClassBtnLabel)}",
                                  () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CreateClassSelectLanguageScreen()));
                              },
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
              }),

              ////////////////////////////////////////////////////////
              // If classes have been found
              ////////////////////////////////////////////////////////
              // ADD CLASS BUTTON
              Observer(
                builder: (_){
                  if (classesStore.classes.length > 0 && !classesStore.isLoading ) {
                    return SliverToBoxAdapter(
                      child: Container(child: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ButtonsBuilder.flatButton(
                                AppLocalizations.of(context).translate(widget.screenConstants.classesAddClassButtonLabel).toUpperCase(), () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CreateClassSelectLanguageScreen()));
                              }, color: Colors.white)
                            ],
                          )
                      ),)
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: Container()
                    );
                  }
                },
              ),
              // TITLE
              _buildTitle(context),

              Observer(
                builder: (_) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _buildClassItem(context, index,
                            classesStore.classes[index].id,
                            classesStore.classes[index].designation,
                            classesStore.classes[index].difficultyLevel,
                            (classesStore.classes[index].pictureUrl != null),
                            classesStore.classes[index].pictureUrl,
                            classesStore.classes[index].status,
                            classesStore.classes[index].languageCode
                        );
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
                    if ( classesStore.totalClasses > classesStore.offset && !classesStore.isLoading && !classesStore.isRefreshing ) {
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

  _buildClassItem(BuildContext context, int index, int id, String designation, int difficultyLevel, bool hasPicture, String pictureUrl, int status, String languageCode) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ClassDetailsScreen(id)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          //border: Border.all(color: AppColors.bgGreyColor)
        ),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              // top bar
              Container(
                padding: EdgeInsets.all(8),
                color: AppColors.bgGreyColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: IconsBuilder.difficultyIcons(difficultyLevel),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: TextsBuilder.textSmall(ClassesUtils().getDifficultyLevelText(context, difficultyLevel).toUpperCase(), color: AppColors.bgMainColor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      color: AppColors.dividerColor
                                  ),
                                )
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                  color: AppColors.regularRed,
                                  borderRadius: BorderRadius.circular(2)),
                              child: TextsBuilder.regularText(
                                  languageCode.toUpperCase(),
                                  color: Colors.white),
                            ),
                          ),
                          TextsBuilder.h4Bold("5", color: AppColors.bgMainColor),
                          Icon(Icons.star, color: AppColors.regularRed,),
                        ],
                      )
                    ),
                  ],
                ),
              ),

              // picture
              Container(
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: (hasPicture)
                          ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: pictureUrl,
                        placeholder: (context, value)=> DefaultLoaderWidget(),
                      )
                          : Container(),
                    ),

                    /// STATUS
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: ClassesUtils().getChipByStatus(
                          context, status),
                    ),

                  ],
                ),
              ),

              // bottom bar
              Container(
                padding: EdgeInsets.all(8),
                color: AppColors.bgGreyColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextsBuilder.h4Bold(designation, color: AppColors.bgMainColor)
                    ),
                    Expanded(
                        flex: 3,
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          children: [
                            TextsBuilder.h4Bold('${classesStore.classes[index].duration}'),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Icon(FontAwesomeIcons.clock, size: 20, color: AppColors.bgMainColor,),
                            ),
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ],
          )
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
              color: Colors.white,
              padding: AppPaddings.topTitlePadding(context).copyWith(top: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  /// Left
                  Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.h3Bold(AppLocalizations.of(context).translate(widget.screenConstants.classesAllWord).toUpperCase()),
                        TextsBuilder.h3Bold(AppLocalizations.of(context).translate(widget.screenConstants.classesYourWord).toUpperCase(), color: AppColors.regularRed),
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
    classesStore.setIsRefreshing(true);
    classesStore.resetOffset();
    return restServices
        .getClassService()
        .getUserClasses(context, classesStore.offset, classesStore.itemsPerPage)
        .then((resp) {
      classesStore.setClasses(resp.items, resp.total);
    }).catchError((error) {
      ToasterBuilder.buildErrorToaster(context, error.cause);
    }).whenComplete(() {
      classesStore.setIsRefreshing(false);
    });
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

    restServices
        .getClassService()
        .getUserClasses(context, classesStore.offset, classesStore.itemsPerPage)
        .then((resp) {
      classesStore.setClasses(resp.items, resp.total);
    }).catchError((error) {
      ToasterBuilder.buildErrorToaster(context, error.cause);
    }).whenComplete(() {
      classesStore.setIsLoading(false);
    });
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
