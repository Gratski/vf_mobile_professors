import 'package:flutter/material.dart';
import 'package:professors/localization/constants/classes/create_class.constants.dart';
import 'package:professors/models/language_context/language_context.model.dart';
import 'package:professors/visual/screens/authenticated/classes/edit_create/create_or_edit_class.screen.dart';
import 'package:professors/visual/screens/authenticated/settings/profile/settings_add_profile_language_select.screen.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

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
            CustomAppBar(
              [
                ButtonsBuilder.transparentButton(
                  'Add language',
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EditProfileAddNewLanguageScreen()));
                  },
                ),
              ],
            ),
            AppHeaderWidget(
              'This class will be given in...',
              subTitle: 'Select the language of this class',
            ),

            /// Language Options List
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  RegularListTile(
                    label: 'Portuguese',
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateOrEditClassScreen(
                                LanguageContextModel(1, 10, 'PT'))),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
