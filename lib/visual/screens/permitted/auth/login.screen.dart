import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/auth/authentication.constants.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/permitted/auth/abstract_auth.screen.dart';
import 'package:professors/visual/screens/permitted/auth/password_recovery.screen.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class LoginScreen extends AbstractAuthScreen {
  AuthenticationConstants screenConstants = AuthenticationConstants();

  // form controllers
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  BuildContext context;

  @override
  getHideBackButton() => true;

  @override
  getSlivers(BuildContext context) {
    this.context = context;
    return <Widget>[
      SliverToBoxAdapter(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Logo
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 80),
                child: AspectRatio(
                  aspectRatio: 2.5,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),

              // Title
              Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: AppPaddings.regularPadding(context),
                  child: TextsBuilder.h1Bold(
                      AppLocalizations.of(context)
                          .translate(screenConstants.loginTopHeader),
                      color: Colors.white)),

              // Email
              Container(
                  padding: AppPaddings.regularPadding(context),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: _emailValidator,
                    controller: emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: AppLocalizations.of(context)
                            .translate(screenConstants.loginEmailLabel)),
                  )),

              // Password
              Container(
                  padding: AppPaddings.regularPadding(context),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40),
                  child: TextFormField(
                    obscureText: true,
                    validator: _passwordValidator,
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: AppLocalizations.of(context)
                            .translate(screenConstants.loginPasswordLabel)),
                  )),

              // Loader
              Observer(
                builder: (_) {
                  if (authStore.loginIsLoading) {
                    return DefaultLoaderWidget();
                  }
                  return Container();
                },
              ),

              // Button
              Container(
                  padding: AppPaddings.regularPadding(context),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 40),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 10,
                        child: Observer(
                          builder: (_) {
                            if (!authStore.loginIsLoading) {
                              return ButtonsBuilder.redFlatButton(
                                AppLocalizations.of(context).translate(
                                    screenConstants.loginButtonLabel),
                                () async {
                                  // validate fields and perform call to auth API
                                  _authenticate();
                                },
                              );
                            }
                            return Container();
                          },
                        ),
                      )
                    ],
                  )),

              // forgot password
              Container(
                padding: AppPaddings.regularPadding(context),
                margin: EdgeInsets.only(top: 20),
                child: GestureDetector(
                  child: TextsBuilder.regularText(
                      AppLocalizations.of(context)
                          .translate(screenConstants.loginForgotPasswordText),
                      color: Colors.white),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PasswordRecoveryScreen(emailController.text)),
                    );
                  },
                ),
              ),

              // register
              Container(
                  padding: AppPaddings.regularPadding(context),
                  margin: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    child: TextsBuilder.regularText(AppLocalizations.of(context)
                        .translate(screenConstants.loginRegisterText), color: Colors.white),
                    onTap: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                  )),
            ],
          ),
        ),
      ),
    ];
  }

  String _emailValidator(String value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)
          .translate(formConstants.emailIsRequired);
    }
    return null;
  }

  String _passwordValidator(String value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)
          .translate(formConstants.currentPasswordIsRequired);
    }
    return null;
  }

  _authenticate() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    authStore.setLoginIsLoading(true);
    restServices
        .getAuthRestService()
        .signIn(context, emailController.text.trim().toLowerCase(),
            passwordController.text)
        .then((rsp) {
      authStore.reset();
      emailController.clear();
      passwordController.clear();
      Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
    }).catchError(
      (e) {
        ToasterBuilder.buildErrorToaster(context, e.cause);
      },
    ).whenComplete(() => authStore.setLoginIsLoading(false));
  }

  @override
  onBackButtonTap() {
    authStore.reset();
  }
}
