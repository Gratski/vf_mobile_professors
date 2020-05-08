import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/models/category/category.model.dart';
import 'package:professors/models/classes/class.model.dart';
import 'package:professors/models/language.model.dart';
import 'package:professors/models/language_context/language_context.model.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/pages/class_details.page.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/pages/select_category.page.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/pages/select_sub_category.page.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

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
  String title;
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
        SelectCategoryScreen(
          (CategoryModel category) {
            pageController.animateToPage(1,
                duration: Duration(milliseconds: 300),
                curve: Cubic(1, 1, 1, 1));
          }, store
        ),
        SelectSubCategoryPage(
          (CategoryModel category) {
            pageController.animateToPage(2,
                duration: Duration(milliseconds: 300),
                curve: Cubic(1, 1, 1, 1));
          }, store
        ),
        ClassDetailsPage(this.classId, () {}, (BuildContext context){
          pageController.animateToPage(0,
              duration: Duration(milliseconds: 300),
              curve: Cubic(1, 1, 1, 1));
        }, store: store,)
      ],
    );
  }

  buildAppBar(BuildContext context) {
    return Observer(
      builder: (_) {

        // hide back button to parent catgory selection page and to Class Details Page
        bool hideBackButton = store.currentPageNumber == 0 || store.currentPageNumber == 2;
        List<Widget> actions = List.of([]);

        if ( store.currentPageNumber != 2 ) {
          actions.add(
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: (store.currentPageNumber != 2) ?
              Icon(FontAwesomeIcons.times) :
              TextsBuilder.regularText("SAVE"),
            ),
          );
        } else {
          actions.addAll([
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: (store.currentPageNumber != 2) ?
              Icon(FontAwesomeIcons.times) :
              ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(generalConstants.buttonSaveLabel), () { }),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: (store.currentPageNumber != 2) ?
              Icon(FontAwesomeIcons.times) :
              TextsBuilder.regularText("SAVE"),
            ),
          ]

          );
        }

        return CustomAppBar(
          actions,

          hideBackButton: hideBackButton,
          customBackCallback: (BuildContext context) {
            if (store.currentPageNumber == 1) {
              store.setCurrentPageNumber(0);
              pageController.animateToPage(0,
                  duration: Duration(milliseconds: 300),
                  curve: Cubic(1, 1, 1, 1));
            } else if (store.currentPageNumber == 2) {

            }
          },
        );
      },
    );
  }
}
