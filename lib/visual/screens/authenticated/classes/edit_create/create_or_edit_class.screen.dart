import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/models/language.model.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/pages/class_details.page.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/pages/select_category.page.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/pages/select_sub_category.page.dart';

class CreateOrEditClassScreen extends StatelessWidget {
  // constants for localization
  final GeneralConstants generalConstants = GeneralConstants();

  // page related attributes
  PageController pageController;

  // store
  CreateClassState store = CreateClassState();

  // form controllers
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController designationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController equipmentController = TextEditingController();
  TextEditingController goalsController = TextEditingController();

  // labels
  int classId;
  ClassModel cm;

  CreateOrEditClassScreen(LanguageModel language, {this.classId}) {
    store.setLanguageId(language.id);

    if ( language.designation == null ) {
      generalStore.existingLanguages.forEach((elem) {
        if(elem.id == language.id) {
          store.setLanguageDesignation(elem.designation);
        }
      });
    } else {
      store.setLanguageDesignation(language.designation);
    }

    store.setId(classId);

    if (classId != null) {
      pageController = PageController(initialPage: 2);
    } else {
      pageController = PageController(initialPage: 0);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: CustomScrollView(
        slivers: <Widget>[

          /// Pages
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: buildPageView(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  PageView buildPageView(BuildContext context) {
    return PageView(
      physics:new NeverScrollableScrollPhysics(),
      controller: pageController,
      children: <Widget>[
        SelectCategoryScreen(
            () {
              if (store.previousPageNumber == null || store.previousPageNumber == 1) {
                Navigator.pop(context);
              } else {
                store.setCurrentPageNumber(store.previousPageNumber);
                store.setPreviousPageNumber(0);
                pageController.animateToPage(store.currentPageNumber,
                    duration: Duration(milliseconds: 300),
                    curve: Cubic(1, 1, 1, 1));
              }
            },
          (CategoryModel category) {
            store.setPreviousPageNumber(store.currentPageNumber);
            store.setCurrentPageNumber(1);
            pageController.animateToPage(1,
                duration: Duration(milliseconds: 300),
                curve: Cubic(1, 1, 1, 1));
          }, store
        ),
        SelectSubCategoryPage(
            () {
              store.setPreviousPageNumber(store.currentPageNumber);
              store.setCurrentPageNumber(0);
              pageController.animateToPage(0,
                  duration: Duration(milliseconds: 300),
                  curve: Cubic(1, 1, 1, 1));
            },
          (CategoryModel category) {
            store.setPreviousPageNumber(store.currentPageNumber);
            store.setCurrentPageNumber(2);
            pageController.animateToPage(2,
                duration: Duration(milliseconds: 300),
                curve: Cubic(1, 1, 1, 1));
          }, store
        ),
        ClassDetailsPage(this.classId, () {}, (BuildContext context){
          store.setPreviousPageNumber(store.currentPageNumber);
          store.setCurrentPageNumber(0);
          pageController.animateToPage(0,
              duration: Duration(milliseconds: 300),
              curve: Cubic(1, 1, 1, 1));
        }, store: store,)
      ],
    );
  }
}
