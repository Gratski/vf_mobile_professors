import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class SelectCategoryScreen extends StatefulWidget {

  // store
  Function onTapCallback;
  CreateClassState store;
  SelectCategoryScreen(this.onTapCallback, this.store);

  @override
  _SelectCategoryScreenState createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> with AfterInitMixin<SelectCategoryScreen>{
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        AppHeaderWidget(
          'Select Category',
        ),
        // fields to edit
        Observer(
          builder: (_) {
            if ( !widget.store.isLoadingCategories ) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        widget.onTapCallback(widget.store.categoriesList[index]);
                      },
                      child: RegularListTile(
                        label: widget.store.categoriesList[index].designation,
                      ),
                    );
                  },
                  childCount: widget.store.categoriesList.length,
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: DefaultLoaderWidget(),
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

}