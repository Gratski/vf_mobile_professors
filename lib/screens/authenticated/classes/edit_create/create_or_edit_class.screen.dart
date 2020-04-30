import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/models/language_context/language_context.model.dart';
import 'package:professors/screens/authenticated/classes/edit_create/pages/class_details.page.dart';
import 'package:professors/screens/authenticated/classes/edit_create/pages/select_category.page.dart';
import 'package:professors/screens/authenticated/classes/edit_create/pages/select_sub_category.page.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';

class CreateOrEditClassScreen extends StatelessWidget {
  // constants for localization
  final GeneralConstants generalConstants = GeneralConstants();

  // page related attributes
  PageController pageController;

  // store

  // form controllers
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController designationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController equipmentController = TextEditingController();
  TextEditingController goalsController = TextEditingController();

  // labels
  String title;
  int classId;
  ClassModel cm;

  CreateOrEditClassScreen(LanguageContextModel lcm, {ClassModel cd}) {
    editOrCreateClassStore.setLanguageContext(lcm);

    if (cd != null) {
      cm = cd;
      classId = cd.id;
      editOrCreateClassStore.setId(cd.id);
      editOrCreateClassStore.setDesignation(cd.designation);
      editOrCreateClassStore.setDescription(cd.description);
      editOrCreateClassStore.setGoals(cd.goals);
      editOrCreateClassStore.setCalories(cd.calories);
      editOrCreateClassStore.setDuration(cd.duration);
      editOrCreateClassStore.setSubCategory(cd.category);

      title = 'Editing class';
      pageController = PageController(initialPage: 2);
    } else {
      title = 'Creating class';
      pageController = PageController(initialPage: 0);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
      padding: AppPaddings.regularPadding(context),
      child: CustomScrollView(
        slivers: <Widget>[
          buildAppBar(context),

          /// Pages
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: buildPageView(),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  PageView buildPageView() {
    return PageView(
      physics:new NeverScrollableScrollPhysics(),
      controller: pageController,
      children: <Widget>[
        SelectCategoryPage(
          (CategoryModel category) {
            editOrCreateClassStore.setParentCategory(category);
            editOrCreateClassStore.setParentCategory(category);
            editOrCreateClassStore.setCurrentPageNumber(1);
            pageController.animateToPage(1,
                duration: Duration(milliseconds: 300),
                curve: Cubic(1, 1, 1, 1));
          },
        ),
        SelectSubCategoryPage(
          (CategoryModel category) {
            editOrCreateClassStore.setSubCategory(category);
            editOrCreateClassStore.setSubCategory(category);
            editOrCreateClassStore.setCurrentPageNumber(2);
            pageController.animateToPage(2,
                duration: Duration(milliseconds: 300),
                curve: Cubic(1, 1, 1, 1));
          },
        ),
        ClassDetailsPage(cm, () {}, (BuildContext context){
          editOrCreateClassStore.setCurrentPageNumber(0);
          pageController.animateToPage(0,
              duration: Duration(milliseconds: 300),
              curve: Cubic(1, 1, 1, 1));
        },)
      ],
    );
  }

  buildAppBar(BuildContext context) {
    return Observer(
      builder: (_) {

        // hide back button to parent catgory selection page and to Class Details Page
        bool hideBackButton = editOrCreateClassStore.currentPageNumber == 0 || editOrCreateClassStore.currentPageNumber == 2;
        List<Widget> actions = List.of([]);
        actions.add(
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(FontAwesomeIcons.times),
          ),
        );

        return CustomAppBar(
          actions,
          hideBackButton: hideBackButton,
          customBackCallback: (BuildContext context) {
            if (editOrCreateClassStore.currentPageNumber == 1) {
              editOrCreateClassStore.setCurrentPageNumber(0);
              pageController.animateToPage(0,
                  duration: Duration(milliseconds: 300),
                  curve: Cubic(1, 1, 1, 1));
            } else if (editOrCreateClassStore.currentPageNumber == 2) {
              editOrCreateClassStore.setCurrentPageNumber(1);
              pageController.animateToPage(1,
                  duration: Duration(milliseconds: 300),
                  curve: Cubic(1, 1, 1, 1));
            }
          },
        );
      },
    );
  }
}
