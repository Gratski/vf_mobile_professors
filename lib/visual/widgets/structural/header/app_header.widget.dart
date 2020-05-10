import 'package:flutter/material.dart';
import 'package:professors/visual/styles/padding.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class AppHeaderWidget extends StatelessWidget {
  String title, subTitle;
  bool isSubTitleSmall;
  EdgeInsets padding;

  AppHeaderWidget(this.title, {this.subTitle, this.isSubTitleSmall = false, this.padding});

  @override
  SliverToBoxAdapter build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: AppPaddings.regularPadding(context),
        child: Column(
          children: <Widget>[
            Container(
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 40),
                alignment: Alignment.centerLeft,
                child: RichText(
                  overflow: TextOverflow.visible,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextsBuilder.h1BoldSpan(title),
                    ],
                  ),
                ),
              ),
            ),
            ( subTitle != null ) ?
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
              child: Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  overflow: TextOverflow.visible,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      (!isSubTitleSmall) ? TextsBuilder.subTitleSpan(subTitle) : TextsBuilder.subTitleSpan(subTitle),
                    ],
                  ),
                ),
              ),
            ) : Container()
          ],
        ),
      ),
    );
  }
}
