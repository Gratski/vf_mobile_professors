import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/form_validation.constants.dart';
import 'package:professors/localization/constants/settings/security/settings_security_constants.dart';
import 'package:professors/store/security/change_password_state.dart';
import 'package:professors/utils/form.utils.dart';
import 'package:professors/visual/builders/toaster.builder.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/loaders/default.loader.widget.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/inputs/input_text_widget.dart';
import 'package:professors/visual/widgets/structural/lists/list_tile_model.dart';

/// Screen where a list of security definitions is presented
class ChangePasswordScreen extends StatefulWidget {
  final formConstants = FormValidationConstants();
  final store = ChangePasswordState();
  final _formKey = GlobalKey<FormState>();

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
  final TextEditingController newPasswordRepeatController =
      TextEditingController();

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

          Observer(
            builder: (_) {

              if (!widget.store.isLoading) {
                return SliverToBoxAdapter(
                  child: Container(
                    padding: AppPaddings.regularPadding(context).copyWith(top: 10),
                    child: Form(
                      key: widget._formKey,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          /// Old Password
                          InputTextWidget(
                            AppLocalizations.of(context)
                                .translate(screenConstants.changePasswordOldLabel)
                                .toUpperCase(),
                            oldPasswordController, validator: _validateCurrentPassword, obscureText: true,),

                          /// New Password
                          InputTextWidget(
                              AppLocalizations.of(context)
                                  .translate(screenConstants.changePasswordNewLabel)
                                  .toUpperCase(),
                              newPasswordController, validator:_validateNewPassword, obscureText: true),

                          /// New Password Repeat
                          InputTextWidget(
                              AppLocalizations.of(context)
                                  .translate(
                                  screenConstants.changePasswordNewRepeatLabel)
                                  .toUpperCase(),
                              newPasswordRepeatController, validator: _validateRepeatNewPassword, obscureText: true),

                          /// Change Button
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: ButtonsBuilder.redFlatButton(
                              AppLocalizations.of(context).translate(
                                  screenConstants.changePasswordButtonLabel),
                                  () {
                                _changePassword();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
                    child: DefaultLoaderWidget(),
                  ),
                );
              }

            },
          )

        ],
      ),
    );
  }

  _changePassword() {
    if (!widget._formKey.currentState.validate()) {
      return;
    }

    widget.store.setIsLoading(true);
    restServices
        .getSecurityService()
        .changePassword(
            context, oldPasswordController.text, newPasswordController.text)
        .then((_) {
      ToasterBuilder.buildSuccessToaster(
          context,
          AppLocalizations.of(context)
              .translate(screenConstants.confirmationText));
      Navigator.pop(context);
      Navigator.pop(context);
    }).catchError((e) {
      ToasterBuilder.buildErrorToaster(context, e.cause);
    }).whenComplete(() {
      widget.store.setIsLoading(false);
    });
  }

  String _validateCurrentPassword(String value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)
          .translate(widget.formConstants.currentPasswordIsRequired);
    }
    return null;
  }

  String _validateNewPassword(String value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)
          .translate(widget.formConstants.newPasswordIsRequired);
    } else if (!FormUtils().validatePasswordStrength(value)) {
      return AppLocalizations.of(context)
          .translate(widget.formConstants.passwordIsTooWeak);
    }
    return null;
  }

  String _validateRepeatNewPassword(String value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)
          .translate(widget.formConstants.newPasswordRepeatIsRequired);
    } else if (newPasswordController.text != newPasswordRepeatController.text) {
      return AppLocalizations.of(context)
          .translate(widget.formConstants.passwordsDontMatch);
    }
    return null;
  }
}
