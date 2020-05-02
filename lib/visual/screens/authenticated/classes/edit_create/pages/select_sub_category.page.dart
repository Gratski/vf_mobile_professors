import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class SelectSubCategoryPage extends StatelessWidget {

  // store
  Function onTapCallback;
  SelectSubCategoryPage(this.onTapCallback);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        AppHeaderWidget(
          'What is your class about',
        ),
        // fields to edit

        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  onTapCallback(editOrCreateClassStore.subCategoriesList[index]);
                },
                child: RegularListTile(
                  label: editOrCreateClassStore.subCategoriesList[index].designation,
                ),
              );
            },
            childCount: editOrCreateClassStore.subCategoriesList.length,
          ),
        ),
      ],
    );
  }

}
