import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/auth/authentication.constants.dart';
import 'package:professors/utils/form.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/permitted/auth/abstract_auth.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class PasswordRecoveryScreen extends AbstractAuthScreen {
  // translation constants
  AuthenticationConstants screenConstants = AuthenticationConstants();

  // form controllers
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  BuildContext context;
  String email;
  PasswordRecoveryScreen(this.email);

  @override
  getHideBackButton() => false;

  @override
  getSlivers(BuildContext context) {
    this.context = context;
    return <Widget>[
      AppHeaderWidget(
        AppLocalizations.of(context)
            .translate(screenConstants.passwordRecoveryTopHeader),
        subTitle: AppLocalizations.of(context)
            .translate(screenConstants.passwordRecoverySubTitle),
        padding: AppPaddings.regularPadding(context),
      ),
      SliverToBoxAdapter(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Email
              Container(
                padding: AppPaddings.regularPadding(context),
                margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                  style: TextStyle(color: AppColors.fontColor),
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)
                          .translate(screenConstants.passwordRecoveryEmailLabel)),
                ),
              ),

              // Loader
              Observer(
                builder: (_) {
                  return authStore.passwordRecoveryIsLoading
                      ? DefaultLoaderWidget()
                      : Container();
                },
              ),

              // Button
              Observer(
                builder: (_) {
                  if (!authStore.passwordRecoveryIsLoading) {
                    return Container(
                      padding: AppPaddings.regularPadding(context),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 40),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: ButtonsBuilder.redFlatButton(
                              AppLocalizations.of(context).translate(
                                  screenConstants.passwordRecoveryButtonLabel),
                                  () {
                                _sendRequest();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ];
  }

  _sendRequest() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    authStore.setPasswordRecoveryIsLoading(true);
    restServices
        .getAuthRestService()
        .passwordRecovery(
        context, emailController.text)
        .then(
          (value) {
        ToasterBuilder.buildSuccessToaster(context, AppLocalizations.of(context).translate(screenConstants.passwordRecoverySuccessText));
        authStore.setPasswordRecoveryIsLoading(false);
        emailController.clear();
      },
    ).catchError(
          (e) {
        ToasterBuilder.buildErrorToaster(context, e.cause);
        authStore.setPasswordRecoveryIsLoading(false);
      },
    );
  }

  String _validateEmail(String value) {
    if ( value == null || value.trim().isEmpty ) {
      return AppLocalizations.of(context).translate(formConstants.emailIsRequired);
    } else if (!FormUtils().validateEmail(value)) {
      return AppLocalizations.of(context).translate(formConstants.invalidInput);
    }
    return null;
  }


  @override
  onBackButtonTap() {
    authStore.reset();
  }
}
