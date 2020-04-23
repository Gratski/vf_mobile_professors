import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/text/text.builder.dart';

class TopTitleWidget extends StatelessWidget {
  String text;

  TopTitleWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: Key('title'),
      child: Container(
        padding: PaddingsBuilder.topTitlePadding(context),
        margin: EdgeInsets.only(top: 50.0),
        alignment: Alignment.centerLeft,
        child: RichText(
          overflow: TextOverflow.visible,
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextsBuilder.h1BoldSpan(text),
            ],
          ),
        ),
      ),
    );
  }
}
