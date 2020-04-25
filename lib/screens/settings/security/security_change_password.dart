import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/security/settings_security_constants.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/buttons/buttons_builder.dart';
import 'package:professors/widgets/inputs/input_text_widget.dart';
import 'package:professors/widgets/lists/list_tile_model.dart';
import 'package:professors/widgets/structural/appbar_builder.dart';
import 'package:professors/widgets/structural/title_widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

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
        appBar: AppBarBuilder.appBarWithTitle(context, ''),
        body: CustomScrollView(
          slivers: <Widget>[
            /// Title
            TopTitleWidget(
                AppLocalizations.of(context)
                    .translate(screenConstants.changePasswordTopHeader),
                'ChangePasswordTitleKey'),

            SliverToBoxAdapter(
              child: Container(
                padding: PaddingsBuilder.regularPadding(context),
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

                      /// Change Button
                      ButtonsBuilder.redFlatButton(
                        AppLocalizations.of(context).translate(
                            screenConstants.changePasswordButtonLabel),
                        () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
