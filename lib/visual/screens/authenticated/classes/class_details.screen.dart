import 'package:after_init/after_init.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/models/language.model.dart';
import 'package:professors/store/classes/class_details_state.dart';
import 'package:professors/utils/classes.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/create_or_edit_class.screen.dart';
import 'package:professors/visual/screens/authenticated/profile/profile.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/styles/sizes.dart';
import 'package:professors/visual/widgets/custom.shimmer.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/icons/icons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ClassDetailsScreen extends StatefulWidget {
  GeneralConstants generalConstants = GeneralConstants();
  ClassConstants screenConstants = ClassConstants();
  ClassDetailsState store = ClassDetailsState();

  int classId;

  ClassDetailsScreen(this.classId);

  @override
  _ClassDetailsScreenState createState() => _ClassDetailsScreenState();
}

class _ClassDetailsScreenState extends State<ClassDetailsScreen>
    with AfterInitMixin<ClassDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double sectionTopMargin = MediaQuery.of(context).size.height / 20;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                snap: true,
                leading: ButtonsBuilder.transparentCustomButton(
              Stack(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: AppSizes.iconRegular(context) + 1,
                ),
                Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.bgMainColor,
                  size: AppSizes.iconRegular(context),
                )
              ],
              )
                    , () {
                  Navigator.pop(context);
                }),
                actions: <Widget>[
                  ButtonsBuilder.transparentCustomButton(
                      Stack(
                        children: [
                          Icon(Icons.edit,
                              color: Colors.white,
                              size: AppSizes.iconRegular(context) + 1),
                          Icon(Icons.edit,
                              color: AppColors.bgMainColor,
                              size: AppSizes.iconRegular(context))
                        ],
                      ), () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateOrEditClassScreen(
                              LanguageModel(
                                  widget.store.languageId, null, null),
                              classId: widget.classId,
                            )));
                  })
                ],
                expandedHeight: MediaQuery.of(context).size.height / 1.6,
                floating: true,
                pinned: true,
                flexibleSpace:
                FlexibleSpaceBar(background: Observer(builder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      (widget.store.isLoading) ?
                         Expanded(
                           flex: 10,
                           child: Container(
                             color: Colors.grey[100],
                             child: Image(
                               image: AssetImage('assets/images/vfit_logo_grey.png'),
                             ),
                           ),
                         ) : (widget.store.imageUrl != null) ?
                      Expanded(
                        flex: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.0],
                                  colors: [Color.fromRGBO(255, 255, 255, 0.3), Colors.transparent])),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            placeholder: (context, value) => Image(
                              image: AssetImage(
                                  'assets/images/vfit_logo_grey.png'),
                            ),
                            imageUrl: widget.store.imageUrl,
                          ),
                        ),
                      ) : Container()
                    ],
                  );
                })),
              ),
            ];
          },
          body: RefreshIndicator(
          onRefresh: _refreshOperation,
          backgroundColor: Colors.white,
    color: AppColors.regularRed,
    child: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Observer(
            builder: (_) {
              return Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    /// HEADER
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(top: sectionTopMargin),
                        padding: AppPaddings.regularPadding(context),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  _buildCategoryLabel(),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: _buildRateLabel(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// TITLE
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: AppPaddings.regularPadding(context),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 10,
                              child: _buildTitleLabel(),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// DIFFICULTY
                    SliverToBoxAdapter(
                      child: Container(
                        padding: AppPaddings.regularPadding(context),
                        margin: EdgeInsets.only(top: sectionTopMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildDifficultyLevelLabel(),
                        ),
                      ),
                    ),

                    /// DURATION
                    SliverToBoxAdapter(
                      child: Container(
                        padding: AppPaddings.regularPadding(context),
                        margin: EdgeInsets.only(top: sectionTopMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextsBuilder.textSmallBold(
                                AppLocalizations.of(context)
                                    .translate(widget.screenConstants
                                    .classDetailsDurationLabel)
                                    .toUpperCase(),
                                color: AppColors.bgMainColor),
                            _buildDurationLabel(),
                          ],
                        ),
                      ),
                    ),

                    /// CALORIES
                    SliverToBoxAdapter(
                      child: Container(
                        padding: AppPaddings.regularPadding(context),
                        margin: EdgeInsets.only(top: sectionTopMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextsBuilder.textSmallBold(
                                AppLocalizations.of(context)
                                    .translate(widget.screenConstants
                                    .classDetailsCaloriesLabel)
                                    .toUpperCase(),
                                color: AppColors.bgMainColor),
                            _buildCaloriesLabel(),
                          ],
                        ),
                      ),
                    ),

                    /// DESCRIPTION
                    SliverToBoxAdapter(
                      child: Container(
                        padding: AppPaddings.regularPadding(context),
                        margin: EdgeInsets.only(top: sectionTopMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextsBuilder.textSmallBold(
                                AppLocalizations.of(context)
                                    .translate(widget.screenConstants
                                    .classDetailsDescriptionLabel)
                                    .toUpperCase(),
                                color: AppColors.bgMainColor),
                            _buildTextAreaLabel(context, widget.store.description == null, widget.store.description),
                          ],
                        ),
                      ),
                    ),

                    /// CLASS DETAILS
                    SliverToBoxAdapter(
                      child: Container(
                        padding:
                        EdgeInsets.only(bottom: sectionTopMargin),
                        margin: EdgeInsets.only(
                          top: sectionTopMargin,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            /// EQUIPMENT
                            Container(
                              padding:
                              AppPaddings.regularPadding(context),
                              margin: EdgeInsets.only(top: 20),
                              child: TextsBuilder.textSmallBold(
                                  AppLocalizations.of(context)
                                      .translate(widget.screenConstants
                                      .classDetailsEquipmentLabel)
                                      .toUpperCase(),
                                  color: AppColors.bgMainColor),
                            ),

                            Container(
                              padding:
                              AppPaddings.regularPadding(context),
                              child: _buildTextAreaLabel(context, widget.store.equipment == null, widget.store.equipment),
                            ),

                            /// CLASS GOALS
                            Container(
                              padding:
                              AppPaddings.regularPadding(context),
                              margin:
                              EdgeInsets.only(top: sectionTopMargin),
                              child: TextsBuilder.textSmallBold(
                                  AppLocalizations.of(context)
                                      .translate(widget.screenConstants
                                      .classDetailsClassGoalsLabel)
                                      .toUpperCase(),
                                  color: AppColors.bgMainColor),
                            ),

                            Container(
                              padding:
                              AppPaddings.regularPadding(context),
                              child: _buildTextAreaLabel(context, widget.store.goals == null, widget.store.goals),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// INSTRUCTOR
                    SliverToBoxAdapter(
                      child: Container(
                        color: AppColors.bgGreyColor,
                        padding: AppPaddings.regularPadding(context),
                        margin: EdgeInsets.only(top: sectionTopMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  bottom:
                                  MediaQuery.of(context).size.height /
                                      40,
                                  top:
                                  MediaQuery.of(context).size.height /
                                      30),
                              child: TextsBuilder.h4Bold(
                                  AppLocalizations.of(context)
                                      .translate(widget.screenConstants
                                      .classDetailsInstructorLabel)
                                      .toUpperCase(),
                                  color: AppColors.bgMainColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileScreen(
                                              widget.store.languageId,
                                              widget.store.languageCode,
                                              widget.store.instructorId,
                                              hideLanguageChange: true,
                                            )));
                              },
                              child: CircleAvatar(
                                  maxRadius:
                                  MediaQuery.of(context).size.width *
                                      0.20,
                                  backgroundColor: AppColors.bgMainColor,
                                  backgroundImage: (widget.store
                                      .instructorPictureUrl !=
                                      null)
                                      ? CachedNetworkImageProvider(
                                    widget
                                        .store.instructorPictureUrl,
                                  )
                                      : AssetImage(
                                      "assets/images/logo.png")),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: _buildTextLabel(context, widget.store.instructorName == null, widget.store.instructorName, isBold: true),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  bottom:
                                  MediaQuery.of(context).size.height /
                                      30),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children:
                                IconsBuilder.startListBasedOnScore(5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// COMMENTS
                    SliverToBoxAdapter(
                      child: Container(
                          padding: AppPaddings.regularPadding(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              /// TITLE COMMENTS
                              Container(
                                margin: EdgeInsets.only(
                                    top: sectionTopMargin),
                                child: TextsBuilder.h1Bold(
                                    AppLocalizations.of(context)
                                        .translate(widget.screenConstants
                                        .classDetailsCommentsLabel),
                                    color: AppColors.bgMainColor),
                              ),

                              Container(
                                  margin: EdgeInsets.only(
                                      top: sectionTopMargin,
                                      bottom: sectionTopMargin),
                                  child: Center(
                                    child: TextsBuilder.regularText(
                                        AppLocalizations.of(context)
                                            .translate(widget
                                            .screenConstants
                                            .classDetailsNoCommentsYetText),
                                        color: AppColors.bgMainColor),
                                  )),
                            ],
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    )),
        ),
    );
  }

  @override
  void didInitState() {
    // load class here
    _refreshOperation();
  }

  Future<void> _refreshOperation() {
    return restServices
        .getClassService()
        .getClassById(context, widget.classId)
        .then((resp) {
      widget.store.setImageUrl(resp.imageUrl);
      widget.store.setId(resp.id);
      widget.store.setLanguageId(resp.languageId);
      widget.store.setLanguageCode(resp.languageCode);
      widget.store.setCategoryName(resp.parentCategoryName);
      widget.store.setSubCategoryName(resp.categoryName);
      widget.store.setRate(resp.rate);
      widget.store.setDifficultyLevel(resp.difficultyLevel);
      widget.store.setGoals(resp.goals);
      widget.store.setEquipment(resp.equipment);
      widget.store.setDescription(resp.description);
      widget.store.setDesignation(resp.designation);
      widget.store.setDuration(resp.duration);
      widget.store.setCalories(resp.calories);
      widget.store.setInstructorId(resp.instructorId);
      widget.store.setInstructorName(resp.instructorName);
      widget.store.setInstructorRate(resp.instructorRate);
      widget.store.setInstructorPictureUrl(resp.instructorPictureUrl);
    }).catchError((e) {
      ToasterBuilder.buildErrorToaster(
          context,
          AppLocalizations.of(context)
              .translate(widget.generalConstants.internetConnectionText));
    }).whenComplete(() => widget.store.setIsLoading(false));
  }

  _buildCategoryLabel() {
    if ( widget.store.categoryName == null ) {
      return CustomShimmer(20, 100);
    } else {
      return TextsBuilder.regularText(
          '${widget.store.categoryName}, ${widget.store.subCategoryName}'
              .toUpperCase(),
          color: AppColors.bgMainColor);
    }
  }

  _buildTitleLabel() {
    if ( widget.store.designation == null ) {
      return CustomShimmer(30, 100);
    } else {
      return TextsBuilder.h2Bold(
          '${widget.store.designation}',
          color: AppColors.bgMainColor);
    }
  }

  _buildRateLabel() {
    if ( widget.store.rate == null ) {
      return [CustomShimmer(20, 30)];
    } else {
      return [
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
                widget.store.languageCode.toUpperCase(),
                color: Colors.white),
          ),
        ),
        TextsBuilder.h3Bold(
          '${widget.store.rate >= 5 ? 5 : widget.store.rate}',
          color: AppColors.bgMainColor), Icon(
    Icons.star,
    color: AppColors.regularRed,
    )];
    }
  }

  _buildDifficultyLevelLabel() {
    if ( widget.store.difficultyLevel == null ) {
      return [CustomShimmer(20, 100)];
    } else {
      return [TextsBuilder.textSmallBold(
          '${ClassesUtils().getDifficultyLevelText(context, widget.store.difficultyLevel).toUpperCase()} '
              '${AppLocalizations.of(context).translate(widget.screenConstants.classDetailsLevelLabel).toUpperCase()}',
          color: AppColors.bgMainColor),
        Row(
            children: IconsBuilder.difficultyIcons(
            widget.store.difficultyLevel)),];
    }
  }

  _buildCaloriesLabel() {
    if ( widget.store.calories == null ) {
      return CustomShimmer(20, 100);
    } else {
      return TextsBuilder.regularText(
          '${widget.store.calories} ${AppLocalizations.of(context).translate(widget.screenConstants.classesKcalWord)}',
          color: AppColors.bgMainColor);
    }
  }

  _buildDurationLabel() {
    if ( widget.store.duration == null ) {
      return CustomShimmer(20, 100);
    } else {
      return TextsBuilder.regularText(
          '${widget.store.duration} ${AppLocalizations.of(context).translate(widget.screenConstants.classDetailsDurationMinutesLabel)}',
          color: AppColors.bgMainColor);
    }
  }

  _buildTextLabel(BuildContext context, bool expression, String txt, {bool isBold = false}) {
    if ( expression ) {
      return CustomShimmer(20, 100);
    } else {
      return !isBold ? TextsBuilder.regularText(
          '$txt',
          color: AppColors.bgMainColor) : TextsBuilder.h4Bold(
          '$txt',
          color: AppColors.bgMainColor);
    }
  }

  _buildTextAreaLabel(BuildContext context, bool expression, String txt) {
    if ( expression ) {
      return CustomShimmer(50, MediaQuery.of(context).size.width - 20);
    } else {
      return TextsBuilder.regularText(
          '$txt',
          color: AppColors.bgMainColor);
    }
  }
}
