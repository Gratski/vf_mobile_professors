import 'package:flutter/material.dart';
import 'package:professors/widgets/text/text.builder.dart';

class RegularListTile extends StatelessWidget {

  String label;
  String hint;
  VoidCallback callback;

  RegularListTile({this.label, this.hint, this.callback});

  @override
  Widget build(BuildContext context) {
    return _createListTile(label, hint, callback);
  }

  ListTile _createListTile(String label, String hint, VoidCallback routeCallback) {
    return ListTile(
        onTap: routeCallback,
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
        ),
        title: _createListItemText( label, hint));
  }

  Widget _createListItemText(String text, String hint) {
    return RichText(
      text:
      TextSpan(style: TextStyle(color: Colors.black), children: <TextSpan>[
        if (hint != null) TextsBuilder.hintSpan(hint.toUpperCase() + "\n"),
        TextsBuilder.listItemSpan(text)
      ]),
    );
  }
}
