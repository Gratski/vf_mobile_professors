import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/security/settings_security_constants.dart';
import 'package:professors/visual/screens/authenticated/settings/security/security_change_password.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/structural/lists/list_tile_model.dart';
import 'package:professors/visual/widgets/structural/lists/regular_list_tile.dart';

/// Screen where a list of security definitions is presented
class SecurityDefinitionsScreen extends StatefulWidget {
  @override
  _SecurityDefinitionsScreenState createState() =>
      _SecurityDefinitionsScreenState();
}

class _SecurityDefinitionsScreenState extends State<SecurityDefinitionsScreen> {
  /// Constants for translations
  final SettingsSecurityConstants screenConstants = SettingsSecurityConstants();

  List<ListTileModel> listItems;

  @override
  Widget build(BuildContext context) {

    List<ListTileModel> listItems = [
      ListTileModel(AppLocalizations.of(context).translate(
          screenConstants.mainChangePasswordLabel), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
        );
      },),
    ];

    return Scaffold(
      body: CustomScrollView(
        key: Key('security_definitions_list'),
        shrinkWrap: true,
        slivers: <Widget>[

          CustomAppBar([]),
          AppHeaderWidget(AppLocalizations.of(context).translate(
              screenConstants.mainTopHeader)),

          /// Change Password Option
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTap: listItems[index].callback,
                  child: RegularListTile(
                    label: listItems[index].label,
                  ),
                );
              },
              childCount: listItems.length,
            ),
          )

        ],
      ),
    );
  }
}