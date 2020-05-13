import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/settings/support/support_contact_constants.dart';
import 'package:professors/models/support/support_contact_type.dart';
import 'package:professors/visual/screens/authenticated/settings/support/support_contact_send.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/structural/header/app_header.widget.dart';
import 'package:professors/visual/widgets/structural/header/custom_app_bar.widget.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class SupportTypeScreen extends StatelessWidget {

  final SupportContactConstants screenConstants = SupportContactConstants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          CustomAppBar([]),
          AppHeaderWidget(AppLocalizations.of(context)
              .translate(screenConstants.topHeader)),

          SliverGrid.count(
            
            crossAxisCount: 2,
            children: [
              listItem(
                  context,
                  'account_icon',
                  AppLocalizations.of(context)
                      .translate(screenConstants.accountLabel), () {
                navigateToNextScreen(
                    context, SupportContactTypeModel.CALENDAR);
              }),
              listItem(
                  context,
                  'classes_icon',
                  AppLocalizations.of(context)
                      .translate(screenConstants.classesLabel), () {
                navigateToNextScreen(
                    context, SupportContactTypeModel.CALENDAR);
              }),
              listItem(
                  context,
                  'payments_icon',
                  AppLocalizations.of(context)
                      .translate(screenConstants.paymentsLabel), () {
                navigateToNextScreen(
                    context, SupportContactTypeModel.CALENDAR);
              }),
              listItem(
                  context,
                  'calendar_icon',
                  AppLocalizations.of(context)
                      .translate(screenConstants.calendarLabel), () {
                navigateToNextScreen(
                    context, SupportContactTypeModel.CALENDAR);
              }),
            ],
          ),
        ],
      ),
    );
  }

  navigateToNextScreen(
      BuildContext context, SupportContactTypeModel contactType) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SupportContactSendScreen(contactType)),
    );
  }

  Widget listItem(
      BuildContext context, String img, String label, VoidCallback callback) {
    return Center(
      child: GestureDetector(
        onTap: callback,
        child: Container(
          padding: AppPaddings.regularPadding(context),
          margin: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: AppPaddings.regularAllPadding(context),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.regularRed),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image(
                        image: AssetImage('assets/icons/$img.png'),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: TextsBuilder.regularText(label),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
