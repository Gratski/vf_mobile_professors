import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/support/support_contact_constants.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/models/support/support_contact_type.dart';
import 'package:professors/screens/authenticated/settings/support/support_contact_send.dart';
import 'package:professors/widgets/structural/header/app_header.widget.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/widgets/text/text.builder.dart';

class SupportTypeScreen extends StatelessWidget {

  SupportContactConstants screenConstants = SupportContactConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[

          CustomAppBar([]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.topHeader)),

          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                listItem('payments_icon', AppLocalizations.of(context).translate(screenConstants.paymentsLabel), () {
                  navigateToNextScreen(context, SupportContactType.PAYMENTS);
                }),
                listItem('classes_icon', AppLocalizations.of(context).translate(screenConstants.classesLabel), () {
                  navigateToNextScreen(context, SupportContactType.CLASSES);
                }),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                listItem('account_icon', AppLocalizations.of(context).translate(screenConstants.accountLabel), () {
                  navigateToNextScreen(context, SupportContactType.ACCOUNT);
                }),
                listItem('calendar_icon', AppLocalizations.of(context).translate(screenConstants.calendarLabel), () {
                  navigateToNextScreen(context, SupportContactType.CALENDAR);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  navigateToNextScreen(BuildContext context, SupportContactType contactType) {
    supportStore.setContactType(contactType);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SupportContactSendScreen()),
    );
  }

  Widget listItem(String img, String label, VoidCallback callback) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: callback,
          child: Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300], width: 2.0),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 9,
                    child: Image.asset('assets/icons/$img.png'),
                  ),
                  TextsBuilder.regularLink(label)
                ],
              )
          ),
        );
      }
    );
  }

}
