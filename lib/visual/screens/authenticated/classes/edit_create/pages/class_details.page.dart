import 'dart:io';

import 'package:after_init/after_init.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/create_class.constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/utils/compression.utils.dart';
import 'package:professors/utils/picture.utils.dart';
import 'package:professors/visual/builders/dialog.builder.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/class_created_or_updated.screen.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/class_deleted.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/styles/sizes.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ClassDetailsPage extends StatefulWidget {

  Function onNextCallback;
  Function editCategoryCallBack;
  int classId;
  CreateClassState store;

  GeneralConstants generalConstants = GeneralConstants();
  CreateClassScreenConstants screenConstants = CreateClassScreenConstants();

  ClassDetailsPage(this.classId, this.onNextCallback, this.editCategoryCallBack,
      {CreateClassState store}) {
    if (store == null) {
      this.store = CreateClassState();
    } else {
      this.store = store;
    }
    if (classId != null) {
      this.store.setId(this.classId);
      this.store.setCurrentPageNumber(2);
    } else {
      this.store.setIsLoadingContext(false);
    }
  }

  @override
  _ClassDetailsPageState createState() => _ClassDetailsPageState();
}

class _ClassDetailsPageState extends State<ClassDetailsPage>
    with AfterInitMixin<ClassDetailsPage> {
  static GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  static TextEditingController designationController = TextEditingController();
  static TextEditingController descriptionController = TextEditingController();
  static TextEditingController equipmentController = TextEditingController();
  static TextEditingController goalsController = TextEditingController();
  static TextEditingController caloriesController = TextEditingController();

  File imageFile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: CustomScrollView(
        slivers: <Widget>[

          _buildAppbar(),

          AppHeaderWidget(
            AppLocalizations.of(context).translate(widget.screenConstants.classDetailsLabel),
            subTitle:
            '${AppLocalizations.of(context).translate(widget.generalConstants.languageLabel)}: ${widget.store.languageDesignation}',
          ),

          // Loader And Content
          Observer(
            builder: (_){
              if ( widget.store.isLoadingContext ) {
                return SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                      child: DefaultLoaderWidget(),
                  )
                );
              } else {
                // fields to edit
                return SliverPadding(
                  padding: AppPaddings.regularPadding(context),
                  sliver: SliverList(
                    key: GlobalKey(),
                    delegate: SliverChildListDelegate(
                      [
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              /// Category
                              Container(
                                margin: EdgeInsets.only(
                                  top: AppSizes.inputTopMargin(context),
                                ),
                                child: Observer(
                                  builder: (_) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          TextsBuilder.h4Bold(
                                            AppLocalizations.of(context).translate(widget.generalConstants.categoryLabel)
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              widget.editCategoryCallBack(context);
                                            },
                                            child: Container(
                                              child: Row(
                                                children: <Widget>[
                                                  // class category
                                                  _buildBadge(TextsBuilder.regularText(
                                                      '${widget.store.categoryName}')),
                                                  _buildBadge(TextsBuilder.regularText(
                                                      '${widget.store.subCategoryName}')),

                                                  Container(
                                                    margin: EdgeInsets.only(left: 10),
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: AppColors.fontColor,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              margin: EdgeInsets.only(top: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                              /// Class Picture Preview
                              Container(
                                margin: EdgeInsets.only(
                                  top: AppSizes.inputTopMargin(context),
                                  bottom: 10,
                                ),
                                child: TextsBuilder.h4Bold(
                                    AppLocalizations.of(context).translate(widget.generalConstants.pictureLabel)
                                ),
                              ),
                              Observer(builder: (_) {
                                if (widget.store.pictureUrl != null &&
                                    imageFile == null) {
                                  return GestureDetector(
                                    onTap: () async {
                                      File file = await PictureUtils().getImage(context);
                                      if (file != null) {
                                        setState(() {
                                          imageFile = file;
                                        });
                                      }
                                    },
                                    child: Container(
                                      child: Image(
                                        image: CachedNetworkImageProvider(
                                            widget.store.pictureUrl),
                                      ),
                                    ),
                                  );
                                } else {
                                  return GestureDetector(
                                    onTap: () async {
                                      File file = await PictureUtils().getImage(context);
                                      if (file != null) {
                                        setState(() {
                                          imageFile = file;
                                        });
                                      }
                                    },
                                    child: (imageFile == null)
                                        ? DottedBorder(
                                      borderType: BorderType.RRect,
                                      dashPattern: [6, 6, 6, 6],
                                      strokeWidth: 2.0,
                                      color: AppColors.fontColor,
                                      radius: Radius.circular(12),
                                      padding: EdgeInsets.all(6),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context).size.width *
                                              0.9,
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context).size.height /
                                                  10),
                                          child: Icon(
                                            FontAwesomeIcons.camera,
                                            color: AppColors.bgGreyColor,
                                          ),
                                        ),
                                      ),
                                    )
                                        : AspectRatio(
                                      aspectRatio: 3 / 2,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          imageFile,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),


                              /// Title
                              _buildTextField(
                                  AppLocalizations.of(context).translate(widget.screenConstants.classTitleLabel)
              , AppLocalizations.of(context).translate(widget.screenConstants.classTitleHint), (value) {
                                widget.store.setDesignation(value);
                              }, designationController, false),

                              /// Description
                              _buildTextField(AppLocalizations.of(context).translate(widget.screenConstants.classDescriptionLabel),
                                  AppLocalizations.of(context).translate(widget.screenConstants.classDescriptionHint),
                                      (value) {
                                    widget.store.setDescription(value);
                                  }, descriptionController, true, maxChars: 255),

                              /// Equipment
                              _buildTextField(
                                  AppLocalizations.of(context).translate(widget.screenConstants.classEquipmentLabel)
                              , AppLocalizations.of(context).translate(widget.screenConstants.classEquipmentHint), (value) {
                                widget.store.setGoals(value);
                              }, goalsController, true, maxChars: 255),

                              /// Goals
                              _buildTextField(
                                  AppLocalizations.of(context).translate(widget.screenConstants.classGoalsLabel),
                                  AppLocalizations.of(context).translate(widget.screenConstants.classGoalsHint),
                                      (value) {
                                    widget.store.setEquipment(value);
                                  }, equipmentController, true, maxChars: 255),

                              /// Burned Calories
                              _buildTextField(AppLocalizations.of(context).translate(widget.screenConstants.classCaloriesLabel),
                                  AppLocalizations.of(context).translate(widget.screenConstants.classCaloriesHint), (value) {
                                if (value != null && (value as String).isNotEmpty)
                                  widget.store.setCalories(double.parse(value));
                              }, caloriesController, false,
                                  inputFormat: TextInputType.number),

                              /// Duration
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // label
                                    _buildLabelContainer(
                                        AppLocalizations.of(context).translate(widget.screenConstants.classDurationLabel)),

                                    // options
                                    Observer(builder: (_) {
                                      return Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: widget.store
                                                .possibleDurations
                                                .map((d) {
                                              return Flexible(
                                                  flex: 5,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      widget.store
                                                          .setDuration(d);
                                                    },
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      padding: EdgeInsets.all(20),
                                                      decoration: BoxDecoration(
                                                        color: (widget.store
                                                            .duration ==
                                                            d)
                                                            ? AppColors.regularGreen
                                                            : AppColors.bgMainColor,
                                                        border: Border.all(
                                                            color: AppColors.regularGreen,
                                                            width: 1.0),
                                                        borderRadius: BorderRadius.all(
                                                          Radius.circular(25),
                                                        ),
                                                      ),
                                                      child: TextsBuilder.h4Bold('$d'),
                                                    ),
                                                  ));
                                            }).toList()),
                                      );
                                    })
                                  ],
                                ),
                              ),

                              /// Difficulty Level
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // label
                                    _buildLabelContainer(
                                        AppLocalizations.of(context).translate(widget.screenConstants.classDifficultyLevelLabel)
                                    ),

                                    // options
                                    Observer(builder: (_) {
                                      return Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: widget.store
                                                .possibleDifficultyLevels
                                                .map((l) {
                                              return GestureDetector(
                                                onTap: () {
                                                  widget.store
                                                      .setDifficultyLevel(l.id);
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5, right: 5, bottom: 10),
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: (widget.store
                                                        .difficultyLevel !=
                                                        null &&
                                                        (widget.store
                                                            .difficultyLevel ==
                                                            l.id || widget.store
                                                            .difficultyLevel > widget.store.possibleDifficultyLevels.length))
                                                        ? AppColors.regularGreen
                                                        : AppColors.bgMainColor,
                                                    border: Border.all(
                                                        color: AppColors.regularGreen,
                                                        width: 1.0),
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(25),
                                                    ),
                                                  ),
                                                  child: TextsBuilder.h4Bold(
                                                      '${AppLocalizations.of(context).translate(l.designation)}'),
                                                ),
                                              );
                                            }).toList()),
                                      );
                                    })
                                  ],
                                ),
                              ),

                              Container(
                                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlatButton(
                                        padding: EdgeInsets.all(15.0),
                                        color: AppColors.bgGreyColor,
                                        textColor: AppColors.regularRed,
                                        onPressed: () {
                                          _delete(context);
                                        },
                                        child: TextsBuilder.h4Bold(
                                            AppLocalizations.of(context).translate(widget.screenConstants.deleteClassButtonLabel)
                                        , color: AppColors.bgMainColor),
                                      )
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  _buildLabelContainer(String label) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 30),
      child: TextsBuilder.h4Bold(label),
    );
  }

  _buildTextField(String label, String hintText, Function onChange,
      TextEditingController controller, bool isMultiline,
      {int maxChars, TextInputType inputFormat = TextInputType.text}) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // label
          _buildLabelContainer(label),
          // input field
          TextFormField(
            style: TextStyle(color: AppColors.fontColor),
            controller: controller,
            onChanged: (value) => onChange(value),
            decoration: InputDecoration(
              hintText: hintText,
            ),
            maxLines: (isMultiline) ? 10 : 1,
            maxLength: (maxChars != null) ? maxChars : 100,
            keyboardType: (isMultiline) ? TextInputType.multiline : inputFormat,
          ),
        ],
      ),
    );
  }

  _buildBadge(Text text) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Chip(
        label: text,
        padding: EdgeInsets.all(0),
        backgroundColor: AppColors.regularGreen,
      ),
    );
  }

  _toggleIsActive(BuildContext context) {
    widget.store.setIsLoadingContext(true);
    restServices.getClassService().toggleIsActive(context, widget.store.id, widget.store.isActive)
    .then((value) => widget.store.setIsActive(!widget.store.isActive))
    .catchError((e) => ToasterBuilder.buildErrorToaster(context, e.cause))
    .whenComplete(() => widget.store.setIsLoadingContext(false));
  }

  ///
  /// Show Delete Dialog
  ///
  _delete(BuildContext context) {

    DialogsBuilder(context).confirmationDialog(
        "Are you sure?",
        "You will all the data related to this class.",
            () {
              widget.store.setIsLoadingContext(true);
              restServices.getClassService().deleteClass(context, widget.store.id)
                  .then((v) {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ClassDeletedScreen()
                ));
              })
                  .catchError((e) => ToasterBuilder.buildErrorToaster(context, e.cause))
                  .whenComplete(() => widget.store.setIsLoadingContext(false));
            },
            () {},
    );
  }

  ///
  /// Submits either for save an existing Class
  ///
  _save(BuildContext context) {
    // validate fields here

    // validate the image size after compression
    if ( imageFile != null ) {
      CompressionUtils().compressAndGetFileSize(imageFile)
          .then((size) {
         if ( size > 80000 ) {
           ToasterBuilder.buildErrorToaster(context, "Please choose a smaller file");
         } else {
           _sendCreateOrUpdate();
         }
      }).catchError((e) {

      });
    } else {
      _sendCreateOrUpdate();
    }


  }

  _sendCreateOrUpdate() {
    widget.store.setIsLoadingContext(true);
    restServices.getClassService().createOrUpdateClass(context, widget.classId,
        widget.store.subCategoryId,
        widget.store.languageId,
        widget.store.designation,
        widget.store.description,
        widget.store.equipment,
        widget.store.goals,
        widget.store.difficultyLevel,
        widget.store.calories,
        widget.store.duration)
        .then((id) {
      if (imageFile != null) {
        restServices.getClassService().changeClassPicture(context, id, imageFile)
            .then((value) {
          _navigateToSuccessUpdateScreen(context);
        })
            .catchError((e) {
          _showCreationErrorMessage(context, e.cause);
        })
            .whenComplete(() {
              widget.store.setIsLoadingContext(false);
              _navigateToSuccessUpdateScreen(context);
            });
      } else {
        _navigateToSuccessUpdateScreen(context);
      }

    }).catchError((e) {
      ToasterBuilder.buildErrorToaster(context, e.cause);
    }).whenComplete(() {
      if (imageFile == null) {
        widget.store.setIsLoadingContext(false);
        _navigateToSuccessUpdateScreen(context);
      }
    });
  }

  @override
  void didInitState() {
    if (widget.classId != null) {
      widget.store.setIsLoadingContext(true);
      restServices.getClassService().getClassById(context, widget.store.id)
          .then((d) {
        widget.store.setLanguageId(d.languageId);
         widget.store.setCategoryId(d.parentCategoryId);
         widget.store.setCategoryName(d.parentCategoryName);

        widget.store.setSubCategoryId(d.categoryId);
         widget.store.setSubCategoryName(d.categoryName);

         designationController.text = d.designation;
        widget.store.setDesignation(d.designation);

        descriptionController.text = d.description;
        widget.store.setDescription(d.description);

        widget.store.setDuration(d.duration);

        equipmentController.text = d.equipment;
        widget.store.setEquipment(d.equipment);

        goalsController.text = d.goals;
        widget.store.setGoals(d.goals);

        widget.store.setDifficultyLevel(d.difficultyLevel);

        caloriesController.text = '${d.calories}';
        widget.store.setCalories(d.calories);

        widget.store.setPictureUrl(d.imageUrl);
        widget.store.setStatus(d.status);
        widget.store.setIsActive(d.isActive);
      })
          .catchError((e) {
        ToasterBuilder.buildErrorToaster(context, e.cause);
      }).whenComplete((){
        widget.store.setIsLoadingContext(false);
      });
    }
  }

  _buildAppbar() {
    return CustomAppBar(
      [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: ButtonsBuilder.transparentButton(
          (widget.classId != null) ?
              AppLocalizations.of(context).translate(widget.generalConstants.buttonSaveLabel).toUpperCase() :
          AppLocalizations.of(context).translate(widget.generalConstants.buttonAddLabel).toUpperCase(), () {
            _save(context);
          },),
        )
      ],
      customBackButton: ButtonsBuilder.transparentCustomButton(Icon(FontAwesomeIcons.times), () {
        Navigator.pop(context);
      })
    );
  }

  _navigateToSuccessUpdateScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ClassCreatedOrUpdatedScreen(widget.classId == null)
    ));
  }

  _showCreationErrorMessage(BuildContext context, String msg) {
    ToasterBuilder.buildErrorToaster(context, msg);
  }

}
