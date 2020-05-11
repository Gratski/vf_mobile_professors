import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/form_validation.constants.dart';
import 'package:professors/localization/constants/settings/support/support_contact_constants.dart';
import 'package:professors/models/support/support_contact_type.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class SupportContactSendScreen extends StatelessWidget {
  SupportContactConstants screenConstants = SupportContactConstants();
  final formConstants = FormValidationConstants();
  TextEditingController msgController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  BuildContext context;
  SupportContactTypeModel contactType;
  SupportContactSendScreen(this.contactType);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar([]),
          AppHeaderWidget(
            AppLocalizations.of(context)
                .translate(screenConstants.contactSendTopHeader),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.regularPadding(context),
              margin: EdgeInsets.only(top: 20),
              child: RichText(
                text: TextsBuilder.subTitleSpan(
                  AppLocalizations.of(context)
                      .translate(screenConstants.contactSendSubTitleOne),
                ),
              ),
            ),
          ),

          /// TEXT AREA
          SliverToBoxAdapter(
            child: Container(
              padding: AppPaddings.regularPadding(context),
              margin: EdgeInsets.only(top: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: _validateMessage,
                      controller: msgController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 2.0, color: Colors.grey[300])),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      maxLength: 250,
                    ),

                    /// BUTTON
                    ButtonsBuilder.redFlatButton(
                        AppLocalizations.of(context)
                            .translate(screenConstants.contactSendButtonLabel),
                        () {
                      _send(context);
                    }),
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

  String _validateMessage(String value) {
    if ( value == null || value.trim().isEmpty ) {
      return AppLocalizations.of(context).translate(formConstants.contactMessageIsRequired);
    }
    return null;
  }

  _send(BuildContext context) {
    if ( !_formKey.currentState.validate()) {
      return;
    }
    restServices
        .getSupportService()
        .sendSupportMessage(
        context, this.contactType, msgController.text)
        .then((value) {
      ToasterBuilder.buildSuccessToaster(
          context,
          AppLocalizations.of(context).translate(
              screenConstants.contactSendSuccessTextLabel));
      Navigator.pop(context);
    }).catchError((e) {
      ToasterBuilder.buildSuccessToaster(context, e.cause);
    });
  }
}
