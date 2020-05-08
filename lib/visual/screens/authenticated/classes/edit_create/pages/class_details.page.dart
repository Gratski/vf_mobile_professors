import 'dart:io';

import 'package:after_init/after_init.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/utils/picture.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/sizes.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ClassDetailsPage extends StatefulWidget {

  Function onNextCallback;
  Function editCategoryCallBack;
  int classId;
  CreateClassState store;

  ClassDetailsPage(this.classId, this.onNextCallback, this.editCategoryCallBack,
      {CreateClassState store}) {
    if (store == null) {
      this.store = CreateClassState();
    } else {
      this.store = store;
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
          AppHeaderWidget(
            'Class Details',
            subTitle:
            'Language: ${widget.store.languageDesignation}',
          ),
          // fields to edit
          SliverList(
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
                                  TextsBuilder.h4Bold('Category'),
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
                        child: TextsBuilder.h4Bold('Picture'),
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
                      _buildTextField('Title', 'Class Title', (value) {
                        widget.store.setDesignation(value);
                      }, designationController, false),

                      /// Description
                      _buildTextField('Description', 'Describe this class',
                              (value) {
                            widget.store.setDescription(value);
                          }, descriptionController, true, maxChars: 255),

                      /// Equipment
                      _buildTextField('Equipment', 'Required equipment', (value) {
                        widget.store.setGoals(value);
                      }, goalsController, true, maxChars: 255),

                      /// Goals
                      _buildTextField('Goals', 'What are this class goals',
                              (value) {
                            widget.store.setEquipment(value);
                          }, equipmentController, true, maxChars: 255),

                      /// Burned Calories
                      _buildTextField('Expected KCal loss', '30,9', (value) {
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
                            _buildLabelContainer('Duration in minutes'),

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
                            _buildLabelContainer('Difficulty Level'),

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
                                              '${l.designation}'),
                                        ),
                                      );
                                    }).toList()),
                              );
                            })
                          ],
                        ),
                      ),

                      /// Submit
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.93,
                              child:
                              ButtonsBuilder.greenFlatButton('SUBMIT', () {

                                // validate fields here
                                restServices.getClassService().createClass(context,
                                    widget.store.subCategoryId,
                                    widget.store.languageId,
                                    widget.store.designation,
                                    widget.store.description,
                                    widget.store.equipment,
                                    widget.store.goals,
                                    widget.store.difficultyLevel,
                                    widget.store.calories,
                                    widget.store.duration)
                                    .then((value) {
                                  ToasterBuilder.buildSuccessToaster(context, "Class Created");
                                }).catchError((e) {
                                  ToasterBuilder.buildErrorToaster(context, e.cause);
                                });

                              }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

  @override
  void didInitState() {
    if (widget.classId != null) {
      restServices.getClassService().getClassById(context, widget.store.id);
    }
  }
}
