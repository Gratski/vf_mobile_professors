import 'package:flutter/material.dart';
import 'package:professors/visual/widgets/structural/icons/icons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ProfessorAvatarWidget extends StatelessWidget {

  String name;
  String greeting;
  String pictureUrl;
  Color textColor;
  ProfessorAvatarWidget(this.name, this.pictureUrl, {this.greeting = '', this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: CircleAvatar(
              maxRadius: MediaQuery.of(context).size.width * 0.20,
              backgroundColor: Colors.black,
              backgroundImage: NetworkImage(pictureUrl),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: TextsBuilder.h4Bold('$greeting $name', color: textColor),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: IconsBuilder.startListBasedOnScore(3.5),
          )
        ],
      ),
    );
  }

}
