import 'package:flutter/material.dart';
import 'package:professors/widgets/structural/header/custom_app_bar.widget.dart';

abstract class AbstractAuthScreen extends StatelessWidget {

  getSlivers(BuildContext context);
  getHideBackButton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/auth_bg.png'),
                fit: BoxFit.cover
            ),
          ),
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [CustomAppBar([], hideBackButton: getHideBackButton(),)];
            },
            body: CustomScrollView(
              slivers: getSlivers(context)
            ),
          ),
        )
    );
  }

}
