import 'package:flutter/material.dart';
import 'package:professors/styles/colors.dart';
import 'package:professors/widgets/structural/buttons/buttons_builder.dart';

class CustomAppBar extends StatelessWidget {

  List<Widget> actions;
  String title;
  bool hideBackButton;

  CustomAppBar(this.actions, {this.title, this.hideBackButton = false});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: (!hideBackButton) ? Icon(
          Icons.arrow_back_ios,
          color: AppColors.iconRegular,
        ) : Container()
      ),
      actions: actions,
      floating: false,
      pinned: false,
    );
  }

}
