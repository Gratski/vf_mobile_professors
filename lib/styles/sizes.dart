import 'package:flutter/cupertino.dart';

class AppSizes {

  static double iconRegular(BuildContext context) => MediaQuery.of(context).size.width * 0.08;
  static double iconSmall(BuildContext context) => MediaQuery.of(context).size.width * 0.02;

  static double textTitle(BuildContext context) => MediaQuery.of(context).size.width * 0.02;
  static double textSubTitle(BuildContext context) => MediaQuery.of(context).size.width * 0.02;
  static double textRegular(BuildContext context) => MediaQuery.of(context).size.width * 0.02;
  static double textSmall(BuildContext context) => MediaQuery.of(context).size.width * 0.02;

}