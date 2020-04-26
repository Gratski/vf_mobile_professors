import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  static Icon difficultyIcon(double level, Color color) {

    if ( level <= 2.5 ) {
      return Icon(FontAwesomeIcons.spa, color: color,);
    } else if ( level > 2.5 && level <= 4.0) {
      return Icon(FontAwesomeIcons.running, color: color);
    } else {
      return Icon(FontAwesomeIcons.fire, color: color);
    }

  }

}