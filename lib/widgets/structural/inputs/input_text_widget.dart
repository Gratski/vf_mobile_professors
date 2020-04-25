import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/widgets/text/text.builder.dart';

class InputTextWidget extends StatelessWidget {
  final String hint;
  final String label;

  InputTextWidget(this.label, {this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextsBuilder.textHint(label),
        TextFormField(
          key: Key('input_firstname'),
          decoration: InputDecoration(border: InputBorder.none, hintText: hint),
        ),
      ],
    );
  }
}
