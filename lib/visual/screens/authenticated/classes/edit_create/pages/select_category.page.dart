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

class SelectCategoryScreen extends StatefulWidget {

  // store
  Function onTapCallback, onBackCallback;
  CreateClassState store;
  SelectCategoryScreen(this.onBackCallback, this.onTapCallback, this.store);

  @override
  _SelectCategoryScreenState createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> with AfterInitMixin<SelectCategoryScreen>{
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        _buildAppbar(),

        AppHeaderWidget(
          'Select Category',
        ),
        // fields to edit
        Observer(
          builder: (_) {
            if ( !widget.store.isLoadingCategories ) {
              return SliverPadding(
                padding: AppPaddings.sliverListPadding(context),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          widget.store.setCategoryId(widget.store.categoriesList[index].id);
                          widget.store.setCategoryName(widget.store.categoriesList[index].designation);
                          widget.onTapCallback(widget.store.categoriesList[index]);
                        },
                        child: RegularListTile(
                          label: widget.store.categoriesList[index].designation,
                        ),
                      );
                    },
                    childCount: widget.store.categoriesList.length,
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
        )
      ],
    );
  }

  @override
  void didInitState() {
    widget.store.setIsLoadingCategories(true);
    restServices.getCategories().getCategories(context)
    .then((categories) {
      widget.store.setIsLoadingCategories(false);
      widget.store.setCategories(categories);
    }).catchError((e) {
      ToasterBuilder.buildErrorToaster(context, e.cause);
    }).whenComplete(() => widget.store.setIsLoadingCategories(false));
  }

  _buildAppbar() {
    return CustomAppBar(
        [],
        customBackButton: ButtonsBuilder.transparentCustomButton(Icon(FontAwesomeIcons.times), () {
          widget.onBackCallback();
        })
    );
  }

}