import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/visual/styles/colors.dart';

class IconsBuilder {

  static List<Icon> startListBasedOnScore(double score) {
    List<Icon> list = new List<Icon>();
    int maxScore = 5;
    int counter = 0;

    // add the red icons
    for(var i = 0; i < score; i++) {
      list.add(Icon(Icons.star, color: Colors.red,));
      counter++;
    }

    // add the grey icons
    for(var i = counter; i < maxScore; i++ ) {
      list.add(Icon(Icons.star, color: Colors.grey[300],));
    }

    return list;
  }

  static List<Container> difficultyIcons(int level) {

    List<Container> list = new List<Container>();
    int maxScore = 4;
    int counter = 0;

    // add the red icons
    for(var i = 0; i < level; i++) {
      list.add(
        Container(
          margin: EdgeInsets.only(right: 3),
          child: Icon(FontAwesomeIcons.solidSquare, color: AppColors.regularRed, size: 16,),
        ),
      );
      counter++;
    }

    // add the grey icons
    for(var i = counter; i < maxScore; i++ ) {
      list.add(
          Container(
            margin: EdgeInsets.only(right: 3),
            child: Icon(FontAwesomeIcons.square, color: AppColors.regularRed, size: 16,),
          ),);
    }

    return list;

  }

}