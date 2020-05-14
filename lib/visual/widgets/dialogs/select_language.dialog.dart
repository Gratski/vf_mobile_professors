import 'package:flutter/material.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/models/language.model.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class SelectLanguageDialog extends StatelessWidget {
  GeneralConstants constants = GeneralConstants();

  String title;
  List<LanguageModel> options;
  int selectedId;
  Function callback;

  SelectLanguageDialog(
      this.title, this.options, this.selectedId, this.callback);

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
      height: 100,
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
      // Buttons
      ListView.builder(
      itemCount: options.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [TextsBuilder.regularText(options[index].designation)],
            ),
          );
        },)
        ],
      )
    );
  }
}
