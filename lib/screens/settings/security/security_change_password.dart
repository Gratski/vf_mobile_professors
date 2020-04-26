import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/security/settings_security_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/structural/inputs/input_text_widget.dart';
import 'package:professors/widgets/structural/lists/list_tile_model.dart';

/// Screen where a list of security definitions is presented
class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  /// Constants for translations
  final SettingsSecurityConstants screenConstants = SettingsSecurityConstants();

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
                        .translate(screenConstants.changePasswordOldLabel)),

                    /// New Password
                    InputTextWidget(AppLocalizations.of(context)
                        .translate(screenConstants.changePasswordNewLabel)),

                    /// New Password Repeat
                    InputTextWidget(AppLocalizations.of(context).translate(
                        screenConstants.changePasswordNewRepeatLabel)),

                    /// Change Button
                    ButtonsBuilder.redFlatButton(
                      AppLocalizations.of(context)
                          .translate(screenConstants.changePasswordButtonLabel),
                      () {},
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
}
