import 'package:flutter/material.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/widgets/structural/icons/icons_builder.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ProfessorAvatarWidget extends StatelessWidget {

  String name;
  String greeting;
  String pictureUrl;
  Color textColor;
  ProfessorAvatarWidget(this.name, this.pictureUrl, {this.greeting = '', this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: CircleAvatar(
              maxRadius: MediaQuery.of(context).size.width * 0.20,
              backgroundColor: AppColors.regularRed,
              backgroundImage: (pictureUrl != null) ? NetworkImage(pictureUrl) : AssetImage('assets/images/logo.png'),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: TextsBuilder.h4Bold('$greeting $name', color: (textColor != null) ? textColor : AppColors.fontColor),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: IconsBuilder.startListBasedOnScore(5),
          )
        ],
      ),
    );
  }

}
