import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class EditPaymentMethodDialog extends StatelessWidget {

  GeneralConstants constants = GeneralConstants();

  VoidCallback deleteCallback;
  VoidCallback makeDefaultCallback;
  EditPaymentMethodDialog(this.makeDefaultCallback, this.deleteCallback);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _dialogContent(context),
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40, bottom: MediaQuery.of(context).size.height / 30),
            padding: EdgeInsets.all(5),
            child: ButtonsBuilder.transparentButton("Make Default", () {
              makeDefaultCallback();
              Navigator.of(context).pop();
            }, color: AppColors.regularGreen),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40, bottom: MediaQuery.of(context).size.height / 30),
            padding: EdgeInsets.all(5),
            child: ButtonsBuilder.transparentButton("Remove", () {
              deleteCallback();
              Navigator.of(context).pop();
            }, color: AppColors.regularRed),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40, bottom: MediaQuery.of(context).size.height / 30),
            padding: EdgeInsets.all(5),
            child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(constants.dialogUnavailableOperationDismissLabel), () {
              Navigator.of(context).pop();
            }, color: AppColors.bgMainColor),
          ),

        ],
      ),
    );
  }
}
