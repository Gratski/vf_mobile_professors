import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/models/language.model.dart';
import 'package:professors/store/classes/class_details_state.dart';
import 'package:professors/utils/classes.utils.dart';
import 'package:professors/visual/builders/dialog.builder.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/create_or_edit_class.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/styles/sizes.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/notifications/notification_details_user_details.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/icons/icons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ClassDetailsScreen extends StatefulWidget {

  ClassConstants screenConstants = ClassConstants();
  ClassDetailsState store = ClassDetailsState();

  int classId;
  ClassDetailsScreen(this.classId);

  @override
  _ClassDetailsScreenState createState() => _ClassDetailsScreenState();
}

class _ClassDetailsScreenState extends State<ClassDetailsScreen> with AfterInitMixin<ClassDetailsScreen> {

  @override
  Widget build(BuildContext context) {

    double sectionTopMargin = MediaQuery.of(context).size.height / 20;

    return Scaffold(
      backgroundColor: AppColors.bgMainColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context) => CreateOrEditClassScreen(
                       LanguageModel(
                           widget.store.languageId, null, null),
                       classId: widget.classId,
                     )
                   ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
                    child: Icon(Icons.edit, color: Colors.white, size: AppSizes.iconRegular(context)),
                  ),
                ),
              ],
              expandedHeight: MediaQuery.of(context).size.height / 2,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Observer(
                  builder: (_) {
                    if ( widget.store.isLoading ) {
                      return DefaultLoaderWidget();
                    } else {
                      return Container(
                        foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [AppColors.bgMainColor, Colors.transparent])),
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: 'assets/images/loading.gif',
                          image: widget.store.imageUrl,
                        ),
                      );
                    }
                  }
                )
              ),
            ),
          ];
        },
        body: Column(
          children: <Widget>[

            Observer(
              builder: (_) {
                if ( widget.store.isLoading ) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    child: DefaultLoaderWidget(),
                  );
                } else {
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TextsBuilder.regularText('${widget.store.categoryName}, ${widget.store.subCategoryName}'.toUpperCase(), color: Colors.white),
                                      TextsBuilder.h2Bold('${widget.store.designation}', color: Colors.white),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextsBuilder.h4Bold('${widget.store.rate}', color: Colors.white),
                                      Icon(Icons.star, color: AppColors.regularRed,)
                                    ],
                                  ),
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
                              children: <Widget>[

                                TextsBuilder.textSmallBold(AppLocalizations.of(context).translate(widget.screenConstants.classDetailsLevelLabel).toUpperCase(), color: Colors.white),
                                TextsBuilder.regularText(ClassesUtils().getDifficultyLevelText(context, widget.store.difficultyLevel)),


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

                                TextsBuilder.textSmallBold(AppLocalizations.of(context).translate(widget.screenConstants.classDetailsDescriptionLabel).toUpperCase(), color: Colors.white),
                                TextsBuilder.regularText('${widget.store.description}'),


                              ],
                            ),
                          ),
                        ),

                        /// CLASS DETAILS
                        SliverToBoxAdapter(
                          child: Container(
                            padding: EdgeInsets.only(bottom: sectionTopMargin),
                            margin: EdgeInsets.only(
                              top: sectionTopMargin,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                /// EQUIPMENT
                                Container(
                                  padding: AppPaddings.regularPadding(context),
                                  margin: EdgeInsets.only(top: 20),
                                  child: TextsBuilder.textSmallBold(AppLocalizations.of(context).translate(widget.screenConstants.classDetailsEquipmentLabel).toUpperCase()),
                                ),

                                Container(
                                  padding: AppPaddings.regularPadding(context),
                                  child: TextsBuilder.regularText('${widget.store.equipment}'),
                                ),

                                /// CLASS GOALS
                                Container(
                                  padding: AppPaddings.regularPadding(context),
                                  margin: EdgeInsets.only(top: sectionTopMargin),
                                  child: TextsBuilder.textSmallBold('Class Objectives'.toUpperCase()),
                                ),

                                Container(
                                  padding: AppPaddings.regularPadding(context),
                                  child: TextsBuilder.regularText('${widget.store.goals}'),
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
                                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 40, top: MediaQuery.of(context).size.height / 30),
                                  child: TextsBuilder.h4Bold(AppLocalizations.of(context).translate(widget.screenConstants.classDetailsInstructorLabel).toUpperCase(), color: AppColors.bgMainColor),
                                ),

                                CircleAvatar(
                                    maxRadius: MediaQuery.of(context).size.width * 0.20,
                                    backgroundColor: AppColors.bgMainColor,
                                    backgroundImage: NetworkImage(
                                      widget.store.instructorPictureUrl,
                                    )
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: TextsBuilder.h4Bold('${widget.store.instructorName}', color: AppColors.bgMainColor),
                                ),

                                Container(
                                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: IconsBuilder.startListBasedOnScore(widget.store.instructorRate),
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
                                    margin: EdgeInsets.only(top: sectionTopMargin),
                                    child: TextsBuilder.h1Bold(AppLocalizations.of(context).translate(widget.screenConstants.classDetailsCommentsLabel)),
                                  ),

                                  Container(
                                    margin: EdgeInsets.only(top: sectionTopMargin, bottom: sectionTopMargin ),
                                    child: Center(
                                      child: TextsBuilder.regularText(AppLocalizations.of(context).translate(widget.screenConstants.classDetailsNoCommentsYetText)),
                                    )
                                  ),

                                ],
                              )
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),

            // bottom fixed book button
            /*
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width / 20,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextsBuilder.regularText('Yoga Relax'.toUpperCase(), color: AppColors.bgMainColor),
                        TextsBuilder.textSmall('17th April'),
                        TextsBuilder.textSmall('13:30 - 14:00'),
                      ],
                    ),
                  ),

                  Flexible(
                    flex: 4,
                    child: ButtonsBuilder.redFlatButton(AppLocalizations.of(context).translate(widget.screenConstants.classDetailsBookButtonLabel).toUpperCase(), () { }),
                  ),
                ],
              ),
            )
             */

          ],
        ),
      ),
    );
  }

  @override
  void didInitState() {
    // load class here
    restServices.getClassService().getClassById(context, widget.classId)
        .then((resp){
          widget.store.setImageUrl(resp.imageUrl);
          widget.store.setId(resp.id);
          widget.store.setLanguageId(resp.languageId);
          widget.store.setCategoryName(resp.parentCategoryName);
          widget.store.setSubCategoryName(resp.categoryName);
          widget.store.setRate(resp.rate);
          widget.store.setDifficultyLevel(resp.difficultyLevel);
          widget.store.setGoals(resp.goals);
          widget.store.setEquipment(resp.equipment);
          widget.store.setDescription(resp.description);
          widget.store.setDesignation(resp.designation);
          widget.store.setCalories(resp.calories);
          widget.store.setInstructorId(resp.instructorId);
          widget.store.setInstructorName(resp.instructorName);
          widget.store.setInstructorRate(resp.instructorRate);
          widget.store.setInstructorPictureUrl(resp.instructorPictureUrl);
    }).catchError((e) {
      ToasterBuilder.buildErrorToaster(context, "Someething went wrong");
    }).whenComplete(() => widget.store.setIsLoading(false));
  }
  
}
