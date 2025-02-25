import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/constants/form_validation.constants.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AbstractAuthScreen extends StatelessWidget {

  FormValidationConstants formConstants = FormValidationConstants();

  getSlivers(BuildContext context);
  getHideBackButton();
  onBackButtonTap();

  @override
  Widget build(BuildContext context) {

    _redirectIfAuthenticated(context);

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/auth_bg.png'),
                fit: BoxFit.cover
            ),
          ),
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [CustomAppBar([], hideBackButton: getHideBackButton(), customBackCallback: () {
                onBackButtonTap();
                Navigator.pop(context);
              }, leadingColor: Colors.white )];
            },
            body: CustomScrollView(
              slivers: getSlivers(context)
            ),
          ),
        )
    );
  }

  _redirectIfAuthenticated(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString("authToken");
    if ( authToken != null && authToken.isNotEmpty ) {
      restServices.getLanguageProfileService().getAvailableProfileLanguages(context);
      restServices.getLanguageProfileService().getExistingProfileLanguages(context);
      restServices.getUserService().getUserPersonalDetails(context);
      //restServices.getUserService().getUserNotificationPreferences(context);
      Navigator.pushNamedAndRemoveUntil(context, "/home", (r) => false);
    }
  }

}
