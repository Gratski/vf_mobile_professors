import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

class SelectCategoryPage extends StatelessWidget {

  // store
  Function onTapCallback;
  SelectCategoryPage(this.onTapCallback);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        AppHeaderWidget(
          'Select Category',
        ),
        // fields to edit

        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  onTapCallback(generalStore.categories[index]);
                },
                child: RegularListTile(
                  label: generalStore.categories[index].designation,
                ),
              );
            },
            childCount: generalStore.categories.length,
          ),
        ),
      ],
    );
  }

}
