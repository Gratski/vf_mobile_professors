import 'package:flutter/material.dart';
import 'package:professors/styles/padding.dart';
import 'package:professors/widgets/text/text.builder.dart';

class TopSubTitleWidget extends StatelessWidget {

  final String text;
  TopSubTitleWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: Key('title'),
      child: Container(
        padding: PaddingsBuilder.topTitlePadding(context),
        margin: EdgeInsets.only(top: 15.0),
        alignment: Alignment.centerLeft,
        child: RichText(
          overflow: TextOverflow.visible,
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: <TextSpan>[
              TextsBuilder.h3LightSpan(text),
            ],
          ),
        ),
      ),
    );
  }

}
