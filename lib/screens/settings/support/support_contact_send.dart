import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/support/support_contact_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/title_widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class SupportContactSendScreen extends StatelessWidget {

  SupportContactConstants screenConstants = SupportContactConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBuilder.appBarWithTitle(context, null),
      body: CustomScrollView(
        slivers: <Widget>[
          TopTitleWidget(
            AppLocalizations.of(context)
                .translate(screenConstants.contactSendTopHeader),
            'SettingsContactSendTitleKey'
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: PaddingsBuilder.regularPadding(context),
              margin: EdgeInsets.only(top: 20),
              child: TextsBuilder.regularText(
                  AppLocalizations.of(context).translate(screenConstants.contactSendSubTitleOne)
              ),
            ),
          ),

          /// TEXT AREA
          SliverToBoxAdapter(
            child: Container(
              padding: PaddingsBuilder.regularPadding(context),
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
