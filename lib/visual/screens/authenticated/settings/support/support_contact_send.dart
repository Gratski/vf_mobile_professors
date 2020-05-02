import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/support/support_contact_constants.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class SupportContactSendScreen extends StatelessWidget {

  SupportContactConstants screenConstants = SupportContactConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

          CustomAppBar([]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.contactSendTopHeader)),

          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.regularPadding(context),
              margin: EdgeInsets.only(top: 20),
              child: TextsBuilder.regularText(
                  AppLocalizations.of(context).translate(screenConstants.contactSendSubTitleOne)
              ),
            ),
          ),

          /// TEXT AREA
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.regularPadding(context),
              margin: EdgeInsets.only(top: 10),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
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
                      maxLength: 1000,
                    ),

                    /// BUTTON
                    ButtonsBuilder.redFlatButton(AppLocalizations.of(context)
                        .translate(screenConstants.contactSendButtonLabel),
                            () {  }
                            ),
                  ],
                ),
              ),
            ),
          ),

          /// BUTTON

        ],
      ),
    );
  }

}
