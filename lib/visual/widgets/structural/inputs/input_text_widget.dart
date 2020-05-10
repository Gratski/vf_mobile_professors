import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class InputTextWidget extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController controller;
  final Function validator;
  final obscureText;

  InputTextWidget(this.label, this.controller, {this.hint, this.validator, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextsBuilder.textHint(label),
          TextFormField(
            validator: (validator != null) ? this.validator : (value) => null,
            obscureText: this.obscureText,
            key: Key('input_firstname'),
            controller: controller,
            decoration: InputDecoration(border: InputBorder.none, hintText: hint),
          ),
        ],
      ),
    );
  }
}
