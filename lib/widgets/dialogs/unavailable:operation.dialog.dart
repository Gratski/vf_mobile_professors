import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';
import 'package:professors/widgets/text/text.builder.dart';

class UnavailableOperationDialog extends StatelessWidget {

  GeneralConstants constants = GeneralConstants();

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
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            padding: EdgeInsets.all(5),
            child: TextsBuilder.h4Bold(AppLocalizations.of(context).translate(constants.dialogUnavailableOperationTitle)),
          ),

          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 20, right: MediaQuery.of(context).size.width / 20),
            child: TextsBuilder.regularText(AppLocalizations.of(context).translate(constants.dialogUnavailableOperationBody)),
          ),

          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40, bottom: MediaQuery.of(context).size.height / 30),
            padding: EdgeInsets.all(5),
            child: ButtonsBuilder.whiteFlatButton(AppLocalizations.of(context).translate(constants.dialogUnavailableOperationDismissLabel), () {
              Navigator.of(context).pop();
            }),
          ),
          
        ],
      ),
    );
  }

}
