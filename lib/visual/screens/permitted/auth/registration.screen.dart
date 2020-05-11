import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/auth/authentication.constants.dart';
import 'package:professors/utils/form.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/screens/permitted/auth/abstract_auth.screen.dart';
import 'package:professors/visual/screens/permitted/auth/login.screen.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';
import 'package:url_launcher/url_launcher.dart';

class RegistrationScreen extends AbstractAuthScreen {

  AuthenticationConstants screenConstants = AuthenticationConstants();

  // form controllers
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController accessCodeController = TextEditingController();

  BuildContext context;

  @override
  getHideBackButton() => false;

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
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),

              // Title
              Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                  child: TextsBuilder.jumboBold(context, AppLocalizations.of(context)
                      .translate(screenConstants.registrationTopHeader), color: Colors.white)
              ),
              // Sub Title
              GestureDetector(
                onTap: () {
                  _launchRegistrationURL();
                },
                child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                    child: TextsBuilder.regularText(AppLocalizations.of(context)
                        .translate(screenConstants.registrationSubTitle), color: Colors.white)
                ),
              ),

              // Email
              Container(
                  padding: AppPaddings.regularPadding(context),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).translate(screenConstants.registrationEmailLabel)
                    ),
                  )
              ),

              // Password
              Container(
                  padding: AppPaddings.regularPadding(context),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                  child: TextFormField(
                    obscureText: true,
                    validator: _passwordValidator,
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).translate(screenConstants.registrationPasswordLabel)
                    ),
                  )
              ),

              // Access Code
              Container(
                  padding: AppPaddings.regularPadding(context),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                  child: TextFormField(
                    validator: _accessCodeValidator,
                    style: TextStyle(color: Colors.white),
                    controller: accessCodeController,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).translate(screenConstants.registrationAccessCodeLabel)
                    ),
                  )
              ),

              // Loader
              Observer(
                builder: (_) {
                  if ( authStore.registerIsLoading ) {
                    return DefaultLoaderWidget();
                  } else {
                    return Container();
                  }
                },
              ),

              // Button
              Observer(
                builder: (_) {

                  if ( !authStore.registerIsLoading ) {
                    return Container(
                        padding: AppPaddings.regularPadding(context),
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 10,
                              child: ButtonsBuilder.redFlatButton(AppLocalizations.of(context).translate(screenConstants.registrationButtonLabel), () {
                                _sendRequest();
                              }),
                            )
                          ],
                        )
                    );
                  } else {
                    return Container();
                  }

                },
              ),

              // Already have an account text
              Container(
                  padding: AppPaddings.regularPadding(context),
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                  child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(screenConstants.registrationAlreadyHaveAccount), () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => LoginScreen()
                    ),);
                  }, color: Colors.white)
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

    authStore.setRegisterIsLoading(true);
    String email = emailController.text;
    String password = passwordController.text;
    String accessCode = accessCodeController.text;
    restServices.getAuthRestService().registration(context, email, password, accessCode)
        .then((rsp) {
      authStore.reset();
      restServices.getAuthRestService().signIn(context, email, password)
          .then((value){
        emailController.clear();
        passwordController.clear();
        accessCodeController.clear();
        authStore.reset();
        Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
      }).catchError((e) {
        authStore.setRegisterIsLoading(false);
        ToasterBuilder.buildErrorToaster(context, e.cause);
      });
    }).catchError((e) {
      authStore.setRegisterIsLoading(false);
      ToasterBuilder.buildErrorToaster(context, e.cause);
    });
  }

  _launchRegistrationURL() async {
    const url = 'https://vfit.app';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //throw 'Could not launch $url';
    }
  }

  String _validateEmail(String value) {
    if ( value == null || value.trim().isEmpty ) {
      return AppLocalizations.of(context).translate(formConstants.emailIsRequired);
    } else if (!FormUtils().validateEmail(value)) {
      return AppLocalizations.of(context).translate(formConstants.invalidInput);
    }
    return null;
  }

  String _passwordValidator(String value) {
    if ( value == null || value.trim().isEmpty ) {
      return AppLocalizations.of(context).translate(formConstants.currentPasswordIsRequired);
    }
    return null;
  }

  String _accessCodeValidator(String value) {
    if ( value == null || value.trim().isEmpty ) {
      return AppLocalizations.of(context).translate(formConstants.accessCodeIsRequired);
    }
    return null;
  }

  @override
  onBackButtonTap() {}

}
