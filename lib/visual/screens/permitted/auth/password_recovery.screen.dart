import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/auth/authentication.constants.dart';
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
  TextEditingController emailController = TextEditingController();

  String email;

  PasswordRecoveryScreen(this.email);

  @override
  getHideBackButton() => false;

  @override
  getSlivers(BuildContext context) {

    return <Widget>[
      AppHeaderWidget(
        AppLocalizations.of(context)
            .translate(screenConstants.passwordRecoveryTopHeader),
        subTitle: AppLocalizations.of(context)
            .translate(screenConstants.passwordRecoverySubTitle),
        padding: AppPaddings.regularPadding(context),
      ),
      SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            
            // error message
            Observer(
              builder: (_) {
                if ( authStore.passwordRecoveryHasError ) {
                  return Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                    child: Center(
                      child: TextsBuilder.regularText(authStore.passwordRecoveryErrorMsg),
                    ),
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
                    child: Center(
                      child: TextsBuilder.regularText(''),
                    ),
                  );
                }
              }
            ),

            // Email
            Observer(
              builder: (_) {
                
                if ( !authStore.passwordRecoveryHasSucceeded ) {
                  return Container(
                    padding: AppPaddings.regularPadding(context),
                    margin:
                    EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                    child: TextFormField(
                      style: TextStyle(color: AppColors.fontColor),
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)
                              .translate(screenConstants.passwordRecoveryEmailLabel)),
                    ),
                  );
                } else {
                  return Container(
                      child: Center(
                        child: TextsBuilder.regularText(AppLocalizations.of(context).translate(screenConstants.passwordRecoverySuccessText)),
                      ),
                  );
                }
                
              },
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
                if (!authStore.passwordRecoveryIsLoading && !authStore.passwordRecoveryHasSucceeded ) {
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
                              authStore.setPasswordRecoveryIsLoading(true);
                              authStore.setPasswordRecoveryHasError(false);

                              restServices
                                  .getAuthRestService()
                                  .passwordRecovery(
                                      context, emailController.text)
                                  .then(
                                (value) {
                                  authStore
                                      .setPasswordRecoveryHasSucceeded(true);
                                  authStore.setPasswordRecoveryIsLoading(false);
                                  emailController.clear();
                                },
                              ).catchError(
                                (e) {
                                  authStore
                                      .setPasswordRecoveryErrorMsg(e.cause);
                                  authStore.setPasswordRecoveryIsLoading(false);
                                  authStore.setPasswordRecoveryHasError(true);
                                },
                              );
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
    ];
  }

  @override
  onBackButtonTap() {
    authStore.reset();
  }
}
