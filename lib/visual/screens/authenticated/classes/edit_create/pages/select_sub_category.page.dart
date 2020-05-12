import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class SelectSubCategoryPage extends StatefulWidget {

  // store
  Function onTapCallback, backCallback;
  PageController pageController;
  CreateClassState store;
  SelectSubCategoryPage(this.backCallback, this.onTapCallback, this.store);

  @override
  _SelectSubCategoryPageState createState() => _SelectSubCategoryPageState();
}

class _SelectSubCategoryPageState extends State<SelectSubCategoryPage> with AfterInitMixin<SelectSubCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        _buildAppbar(),

        AppHeaderWidget(
          'What is your class about',
        ),
        // fields to edit

        Observer(
          builder: (_) {
            if ( !widget.store.isLoadingSubCategories ) {
              return SliverPadding(
                padding: AppPaddings.sliverListPadding(context),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          widget.store.setSubCategoryId(widget.store.subCategoriesList[index].id);
                          widget.store.setSubCategoryName(widget.store.subCategoriesList[index].designation);
                          widget.onTapCallback(widget.store.subCategoriesList[index]);
                        },
                        child: RegularListTile(
                          label: widget.store.subCategoriesList[index].designation,
                        ),
                      );
                    },
                    childCount: widget.store.subCategoriesList.length,
                  ),
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                    child: DefaultLoaderWidget(),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  void didInitState() {
    widget.store.setIsLoadingSubCategories(true);
    restServices.getCategories().getSubCategories(context, widget.store.categoryId)
        .then((categories) {
      widget.store.setSubCategories(categories);
    }).catchError((e) {
      ToasterBuilder.buildErrorToaster(context, e.cause);
    }).whenComplete(() => widget.store.setIsLoadingSubCategories(false));
  }

  _buildAppbar() {
    return CustomAppBar(
        [],
        customBackButton: ButtonsBuilder.transparentCustomButton(Icon(FontAwesomeIcons.arrowLeft), () {
          widget.backCallback();
        })
    );
  }

}

