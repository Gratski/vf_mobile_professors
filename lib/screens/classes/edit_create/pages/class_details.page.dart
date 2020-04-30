import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/store/classes/edit_class_state.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/sizes.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class ClassDetailsPage extends StatelessWidget {

  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController designationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController equipmentController = TextEditingController();
  TextEditingController goalsController = TextEditingController();

  Function onNextCallback;
  Function editCategoryCallBack;
  ClassDetailsPage(this.onNextCallback, this.editCategoryCallBack);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        AppHeaderWidget(
          'Class Details',
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
                                TextsBuilder.textHint('Category'),
                                GestureDetector(
                                  onTap: () {
                                    editCategoryCallBack(context);
                                  },
                                  child: Container(
                                    child: TextsBuilder.regularText(
                                      '${editOrCreateClassStore.subCategory.parent.designation} | ${editOrCreateClassStore.subCategory.designation}',
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

                    /// Designation
                    Container(
                      child: TextFormField(
                        style: TextStyle(color: AppColors.fontColor),
                        controller: designationController,
                        onChanged: (value) => editOrCreateClassStore.setDesignation(value),
                        decoration: InputDecoration(
                          hintText: 'Class title',
                          labelText: 'Class title',
                        ),
                      ),
                    ),

                    /// Description
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                      child: TextFormField(
                        style: TextStyle(color: AppColors.fontColor),
                        controller: descriptionController,
                        onChanged: (value) => editOrCreateClassStore.setDescription(value),
                        decoration: InputDecoration(
                          hintText: 'Description',
                          labelText: 'Description',
                        ),
                      ),
                    ),

                    /// Equipment
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                      child: TextFormField(
                        style: TextStyle(color: AppColors.fontColor),
                        controller: descriptionController,
                        onChanged: (value) => editOrCreateClassStore.setDescription(value),
                        decoration: InputDecoration (
                          hintText: 'Required Equipment',
                          labelText: 'Required equipment',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        maxLength: 255,
                      ),
                    ),

                    /// Goals
                    Container(
                      child: TextFormField(
                        style: TextStyle(color: AppColors.fontColor),
                        controller: descriptionController,
                        onChanged: (value) => editOrCreateClassStore.setDescription(value),
                        decoration: InputDecoration(
                          fillColor: AppColors.bgInputColor,
                          filled: true,
                          hintText: 'Goals',
                          labelText: 'What are the class goals',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        maxLength: 255,
                      ),
                    ),

                    /// Duration
                    Container(
                      child: Column(
                        children: <Widget>[
                          // label

                          // options
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: AppColors.fontColor,
                                  border: Border.all(
                                      color: AppColors.regularRed,
                                      width: 1.0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                ),
                                child: Text('25'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// Max students
                    Container(
                      child: TextFormField(
                        style: TextStyle(color: AppColors.fontColor),
                        controller: descriptionController,
                        onChanged: (value) => editOrCreateClassStore.setDescription(value),
                        decoration: InputDecoration(
                          hintText: 'Description',
                          labelText: 'Description',
                        ),
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

}
