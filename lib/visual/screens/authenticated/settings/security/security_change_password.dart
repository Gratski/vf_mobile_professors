import 'package:flutter/material.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/security/settings_security_constants.dart';
import 'package:professors/store/security/change_password_state.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/inputs/input_text_widget.dart';
import 'package:professors/visual/widgets/structural/lists/list_tile_model.dart';

/// Screen where a list of security definitions is presented
class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  /// Constants for translations
  final SettingsSecurityConstants screenConstants = SettingsSecurityConstants();

  /// store
  final ChangePasswordState store = ChangePasswordState();

  /// controllers
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordRepeatController = TextEditingController();

  List<ListTileModel> listItems;

  @override
  Widget build(BuildContext context) {
    List<ListTileModel> listItems = [
      ListTileModel(
        AppLocalizations.of(context)
            .translate(screenConstants.mainChangePasswordLabel),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
          );
        },
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

          CustomAppBar([]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.changePasswordTopHeader)),

                SliverToBoxAdapter(
                  child: Container(
                    padding: AppPaddings.regularPadding(context),
                    child: Form(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          /// Old Password
                          InputTextWidget(AppLocalizations.of(context)
                              .translate(screenConstants.changePasswordOldLabel), oldPasswordController),

                          /// New Password
                          InputTextWidget(AppLocalizations.of(context)
                              .translate(screenConstants.changePasswordNewLabel), newPasswordController),

                          /// New Password Repeat
                          InputTextWidget(AppLocalizations.of(context).translate(
                              screenConstants.changePasswordNewRepeatLabel), newPasswordRepeatController),

                          /// Change Button
                          ButtonsBuilder.redFlatButton(
                            AppLocalizations.of(context)
                                .translate(screenConstants.changePasswordButtonLabel),
                                () {
                              store.setIsLoading(true);
                              restServices.getSecurityService().changePassword(
                                  context,
                                  oldPasswordController.text,
                                  newPasswordController.text).then((_){
                                ToasterBuilder.buildSuccessToaster(context, "Password Changed");
                                setState(() {
                                  oldPasswordController.text = "";
                                  newPasswordController.text = "";
                                  newPasswordRepeatController.text = "";
                                });
                              }).catchError((e) {
                                ToasterBuilder.buildErrorToaster(context, e.cause);
                              }).whenComplete((){
                                store.setIsLoading(false);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

        ],
      ),
    );
  }

  _changePassword() {
    restServices.getSecurityService().changePassword(context,
        oldPasswordController.text,
        newPasswordController.text).then((value) {
          ToasterBuilder.buildSuccessToaster(context, "Password Changed");
          setState(() {
            oldPasswordController.text = "";
            newPasswordController.text = "";
          });
    }).catchError((e) {
      ToasterBuilder.buildErrorToaster(context, e.cause);
    });
  }
}
