import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:professors/globals/global_vars.dart';
import 'package:professors/screens/authenticated/home.dart';
import 'package:professors/screens/permitted/splash/pages/SplashFirstScreen.dart';
import 'package:professors/screens/permitted/splash/pages/SplashFourthScreen.dart';
import 'package:professors/screens/permitted/splash/pages/SplashSecondScreen.dart';
import 'package:professors/screens/permitted/splash/pages/SplashThirdScreen.dart';
import 'package:professors/screens/permitted/splash/pages/SplashZeroScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(
      initialPage: 0,
    );
    PageView pageView = PageView(
      key: GlobalKey(),
      controller: controller,
      children: <Widget>[
        SplashZeroScreen(() {
          controller.animateToPage(1,
              duration: Duration(milliseconds: 300), curve: Cubic(1, 1, 1, 1));
        }),
        SplashFirstScreen(() {
          controller.animateToPage(2,
              duration: Duration(milliseconds: 300), curve: Cubic(1, 1, 1, 1));
        }),
        SplashSecondScreen(() {
          controller.animateToPage(3,
              duration: Duration(milliseconds: 300), curve: Cubic(1, 1, 1, 1));
        }),
        SplashThirdScreen(() {
          controller.animateToPage(4,
              duration: Duration(milliseconds: 300), curve: Cubic(1, 1, 1, 1));
        }),
        SplashFourthScreen(() {}),
      ],
    );

    Timer(
      Duration(seconds: 3),
      () {
        controller.animateToPage(1,
            duration: Duration(milliseconds: 300), curve: Cubic(1, 1, 1, 1));
      },
    );

    return Scaffold(
      body: Observer(
        builder: (_) {
          if (generalStore.isReady) {
            return pageView;
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
