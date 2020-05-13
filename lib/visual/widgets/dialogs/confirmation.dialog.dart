import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/styles/sizes.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ConfirmationDialog extends StatelessWidget {

  GeneralConstants constants = GeneralConstants();

  String title, subTitle;
  VoidCallback confirmationCallback;
  VoidCallback cancelCallback;
  ConfirmationDialog(this.title, this.subTitle, this.confirmationCallback, this.cancelCallback);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      children: <Widget>[_dialogContent(context)],
    );
  }

  _dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      margin: EdgeInsets.all(0),
      child: Column(
        children: [

          // Title
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            child: TextsBuilder.h4Bold(title, color: AppColors.bgMainColor),
          ),

          // SubTitle
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
            padding: AppPaddings.regularAllPadding(context),
            child: TextsBuilder.regularText(subTitle, color: AppColors.bgMainColor),
          ),

          // Buttons
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey[300],
                  width: 1.0,
                ),
              ),
            ),
            child: SafeArea(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(constants.buttonYesLabel), () {
                        Navigator.of(context).pop();
                        confirmationCallback();
                      }, color: AppColors.fontColor),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(constants.buttonNoLabel), () {
                        Navigator.of(context).pop();
                        cancelCallback();
                      }, color: AppColors.fontColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
