import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/store/classes/edit_class_state.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/sizes.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class ClassDetailsPage extends StatelessWidget {
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController designationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController equipmentController = TextEditingController();
  TextEditingController goalsController = TextEditingController();
  TextEditingController caloriesController = TextEditingController();

  Function onNextCallback;
  Function editCategoryCallBack;
  ClassModel cm;

  ClassDetailsPage(this.cm, this.onNextCallback, this.editCategoryCallBack) {
    if (cm != null) {
      designationController.text = cm.designation;
      descriptionController.text = cm.description;
      equipmentController.text = cm.equipment;
      goalsController.text = cm.goals;
      caloriesController.text = (cm.calories != null) ? '${cm.calories}' : '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        AppHeaderWidget(
          'Class Details',
          subTitle:
              'Language: ${editOrCreateClassStore.languageContext.languageCode}',
        ),
        // fields to edit
        SliverList(
          key: GlobalKey(),
          delegate: SliverChildListDelegate(
            [
              Form(
                key: _formKey,
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
                                    editCategoryCallBack(context);
                                  },
                                  child: Container(
                                    child: Row(
                                      children: <Widget>[
                                        // parent category
                                        _buildBadge(TextsBuilder.regularText(
                                            '${editOrCreateClassStore.subCategory.parent.designation}')),

                                        // class category
                                        _buildBadge(TextsBuilder.regularText(
                                            '${editOrCreateClassStore.subCategory.designation}')),

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

                    /// Title
                    _buildTextField('Title', 'Class Title', (value) {
                      editOrCreateClassStore.setDesignation(value);
                    }, designationController, false),

                    /// Description
                    _buildTextField('Description', 'Describe this class',
                        (value) {
                      editOrCreateClassStore.setDescription(value);
                    }, descriptionController, true, maxChars: 255),

                    /// Equipment
                    _buildTextField('Equipment', 'Required equipment', (value) {
                      editOrCreateClassStore.setGoals(value);
                    }, equipmentController, true, maxChars: 255),

                    /// Goals
                    _buildTextField('Goals', 'What are this class goals',
                        (value) {
                      editOrCreateClassStore.setEquipment(value);
                    }, equipmentController, true, maxChars: 255),

                    /// Burned Calories
                    _buildTextField('Expected KCal loss', '30,9', (value) {
                      editOrCreateClassStore.setCalories(value);
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
                                  children: editOrCreateClassStore
                                      .possibleDurations
                                      .map((d) {
                                    return Flexible(
                                        flex: 5,
                                        child: GestureDetector(
                                          onTap: () {
                                            editOrCreateClassStore
                                                .setDuration(d);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5, right: 5),
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: (editOrCreateClassStore
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
                                  children: editOrCreateClassStore
                                      .possibleDifficultyLevels
                                      .map((l) {
                                    return GestureDetector(
                                          onTap: () {
                                            editOrCreateClassStore.setDifficultyLevel(l);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5, right: 5, bottom: 10),
                                            padding: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: (editOrCreateClassStore.difficultyLevel != null &&
                                                      editOrCreateClassStore.difficultyLevel.id == l.id)
                                                  ? AppColors.regularGreen
                                                  : AppColors.bgMainColor,
                                              border: Border.all(
                                                  color: AppColors.regularGreen,
                                                  width: 1.0),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(25),
                                              ),
                                            ),
                                            child: TextsBuilder.h4Bold('${l.designation}'),
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
                                ButtonsBuilder.greenFlatButton('SUBMIT', () {}),
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
}
