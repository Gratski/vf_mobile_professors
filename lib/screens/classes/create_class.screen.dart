import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/create_class.constants.dart';
import 'package:professors/store/classes/create_class_state.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/notifications/notification_details_user_details.widget.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class CreateClassScreen extends StatelessWidget {

  CreateClassScreenConstants screenConstants = CreateClassScreenConstants();
  CreateClassState store = CreateClassState();

  CreateClassScreen(int languageContextId) {
    store.setLanguageContextId(languageContextId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppPaddings.regularPadding(context),
        child: CustomScrollView(
          slivers: <Widget>[

            CustomAppBar([]),
            AppHeaderWidget('Create new Class'),

            /// Input Text Area
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 2.0, color: Colors.grey[300]
                        )
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  maxLength: 150,
                ),
              ),
            ),

            /// MESSAGE HINT
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: TextsBuilder.textSmall('',),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: ButtonsBuilder.redFlatButton('',
                      () { },),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
