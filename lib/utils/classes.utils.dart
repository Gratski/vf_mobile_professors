import 'package:flutter/material.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/widgets/text/text.builder.dart';

class ClassesUtils {

  GeneralConstants constants = GeneralConstants();
  ClassConstants classConstants = ClassConstants();

  ///
  /// Gets a Chip based on the difficulty level
  ///
  getChipByDifficultyLevel(BuildContext context, int level) {
    switch(level) {
      case 1: return  _buildChip(context, Colors.white, constants.difficultyLevelBeginner, AppColors.bgMainColor);
      case 2: return  _buildChip(context, Colors.white, constants.difficultyLevelIntermediate, AppColors.bgMainColor);
      case 3: return  _buildChip(context, Colors.white, constants.difficultyLevelAvanced, AppColors.bgMainColor);
      default: return _buildChip(context, Colors.white, constants.difficultyLevelWarrior, AppColors.bgMainColor);
    }
  }

  _buildChip(BuildContext context, Color chipColor, String labelConst, Color textColor) {
    return Chip(
      backgroundColor: chipColor,
      label: TextsBuilder.regularText(AppLocalizations.of(context).translate(labelConst), color: textColor),
    );
  }

  ///
  /// Gets a chip based on the class status
  ///
  getChipByStatus(BuildContext context, int status) {
    switch(status) {
      case 1: return _buildChip(context, Colors.amber, classConstants.classesWaitingForApprovalLabel, AppColors.bgMainColor);
      case 2: return _buildChip(context, AppColors.regularGreen, classConstants.classesApprovedLabel, Colors.white);
      case 3: return _buildChip(context, AppColors.bgMainColor, classConstants.classesRejectedLabel, Colors.white);
      case 4: return _buildChip(context, AppColors.bgMainColor, classConstants.classesReportedLabel, AppColors.regularRed);
    }
  }


}