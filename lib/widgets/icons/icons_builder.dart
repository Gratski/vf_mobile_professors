import 'package:flutter/material.dart';

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

}