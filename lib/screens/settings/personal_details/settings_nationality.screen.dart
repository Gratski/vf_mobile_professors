import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/constants/nationality.constants.dart';
import 'package:professors/localization/constants/settings/personal_details/settings_personal_details.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class SettingsNationalityScreen extends StatelessWidget {

  final GeneralConstants generalConstants = GeneralConstants();
  final NationalityScreenConstants screenConstants = NationalityScreenConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomAppBar([],),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            AppHeaderWidget(AppLocalizations.of(context)
                .translate(screenConstants.topHeader)),
            SliverToBoxAdapter(
              key: Key('form_box'),
              child: Container(
                padding: AppPaddings.regularPadding(context),
                child: Form(
                  key: Key('personal_details_form'),
                  child: ListView(
                    shrinkWrap: true,
                    key: Key('list_view_key'),
                    children: <Widget>[
                      /// FIRSTNAME
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            key: Key('input_firstname'),
                            decoration: InputDecoration(
                              hintText: 'write your first name',
                              labelText: 'First Name',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
