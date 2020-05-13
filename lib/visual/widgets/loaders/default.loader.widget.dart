import 'package:flutter/material.dart';
import 'package:professors/visual/styles/colors.dart';

class DefaultLoaderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.regularRed),
      ),
    );
  }

}
