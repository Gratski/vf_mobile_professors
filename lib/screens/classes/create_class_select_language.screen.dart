import 'package:flutter/material.dart';
import 'package:professors/localization/constants/classes/create_class.constants.dart';
import 'package:professors/screens/classes/create_class.screen.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/structural/lists/regular_list_tile.dart';
import 'package:professors/widgets/text/text.builder.dart';

class CreateClassSelectLanguageScreen extends StatelessWidget {

  CreateClassScreenConstants screenConstants = CreateClassScreenConstants();
  CreateClassState store = CreateClassState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppPaddings.regularPadding(context),
        child: CustomScrollView(
          slivers: <Widget>[

            CustomAppBar([]),
            AppHeaderWidget('This class will be given in...', subTitle: 'Select the language of this class',),

            /// Language Options List
            SliverList(
              delegate: SliverChildListDelegate([

                RegularListTile(
                  label: 'Portuguese',
                  callback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateClassScreen(1)),
                    );
                  },
                )

              ]),
            ),
          ],
        ),
      ),
    );
  }
}
