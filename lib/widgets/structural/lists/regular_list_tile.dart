import 'package:flutter/material.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/widgets/text/text.builder.dart';

class RegularListTile extends StatelessWidget {

  String label;
  String hint;
  VoidCallback callback;
  bool selected;
  bool hideTrailing;

  RegularListTile({this.label, this.hint, this.callback, this.selected = false, this.hideTrailing = false});

  @override
  Widget build(BuildContext context) {
    return _createListTile(label, hint, callback, selected: selected, hideTrailing: hideTrailing);
  }

  ListTile _createListTile(String label, String hint, VoidCallback routeCallback, {bool selected = false, bool hideTrailing = false}) {
    return ListTile(
        selected: selected,
        onTap: routeCallback,
        trailing: (!hideTrailing) ? (!selected) ? Icon(
          Icons.keyboard_arrow_right,
          color: AppColors.fontColor,
        ): Icon(
          Icons.check,
          color: AppColors.regularGreen,
        ): Icon(Icons.check, color: AppColors.bgMainColor,),
        title: _createListItemText( label, hint));
  }

  Widget _createListItemText(String text, String hint) {
    return RichText(
      text:
      TextSpan(style: TextStyle(color: AppColors.fontColor), children: <TextSpan>[
        if (hint != null) TextsBuilder.hintSpan(hint.toUpperCase() + "\n"),
        TextsBuilder.regularSpan(text)
      ]),
    );
  }
}
