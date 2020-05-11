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
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  margin: _margin(context),
                  padding: EdgeInsets.all(5),
                  child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(constants.buttonMakeDefaultLabel), () {
                    makeDefaultCallback();
                    Navigator.of(context).pop();
                  }, color: AppColors.bgMainColor),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey[300],
                        width: 1.0,
                      ),
                    ),
                  ),
                  margin: _margin(context),
                  padding: EdgeInsets.all(5).copyWith(top: MediaQuery.of(context).size.height / 40),
                  child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(constants.buttonRemoveLabel), () {
                    deleteCallback();
                    Navigator.of(context).pop();
                  }, color: AppColors.bgMainColor),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey[300],
                        width: 1.0,
                      ),
                    ),
                  ),
                  margin: _margin(context).copyWith(bottom: MediaQuery.of(context).size.height / 40),
                  padding: EdgeInsets.all(5).copyWith(top: MediaQuery.of(context).size.height / 40),
                  child: ButtonsBuilder.transparentButton(AppLocalizations.of(context).translate(constants.dialogUnavailableOperationDismissLabel), () {
                    Navigator.of(context).pop();
                  }, color: AppColors.bgMainColor),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  EdgeInsets _margin(BuildContext context) {
    return EdgeInsets.only(top: MediaQuery.of(context).size.height / 40);
  }
}
