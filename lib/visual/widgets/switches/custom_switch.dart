import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class CustomSwitch extends StatelessWidget {

  bool value;
  Function onTap;
  String label;
  String hint;

  CustomSwitch(bool value, Function onTap, String label, String hint) {
    this.value = value;
    this.onTap = onTap;
    this.label = label;
    this.hint = hint;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.regularPadding(context),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: TextsBuilder.h2Bold(label),
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Observer(
                      builder: (_) {
                        return CupertinoSwitch(
                          value: value,
                          onChanged: (newValue) => onTap(newValue),
                        );
                      },
                    ),
                  )
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Container(
                  margin: EdgeInsets.only(top: 15.0),
                  child: TextsBuilder.regularText(hint),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
