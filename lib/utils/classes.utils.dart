import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/classes/classes_constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/visual/styles/colors.dart';
import 'package:professors/visual/widgets/structural/icons/icons_builder.dart';
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

  ///
  /// Gets the difficulty level string localized
  ///
  String getDifficultyLevelText(BuildContext context, int level) {
    switch(level) {
      case 1: return  AppLocalizations.of(context).translate(constants.difficultyLevelBeginner);
      case 2: return  AppLocalizations.of(context).translate(constants.difficultyLevelIntermediate);
      case 3: return  AppLocalizations.of(context).translate(constants.difficultyLevelAvanced);
      default: return AppLocalizations.of(context).translate(constants.difficultyLevelWarrior);
    }
  }

  ///
  /// Gets a chip based on the class status
  ///
  getChipByStatus(BuildContext context, int status) {
    switch(status) {
      case 1: return _buildChip(context, Colors.amber, classConstants.classesWaitingForApprovalLabel, AppColors.bgMainColor);
      case 2: return _buildChip(context, AppColors.regularGreen, classConstants.classesApprovedLabel, Colors.white);
      case 3: return _buildChip(context, AppColors.bgMainColor, classConstants.classesRejectedLabel, Colors.white);
      case 4: return _buildChip(context, AppColors.bgMainColor, classConstants.classesReportedLabel, Colors.white);
    }
  }

  getDifficultyLevelSquares(int level) {
    return IconsBuilder.difficultyIcons(level);
  }

  _buildChip(BuildContext context, Color chipColor, String labelConst, Color textColor) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        padding: EdgeInsets.all(3),
        color: chipColor,
        child: TextsBuilder.textSmall(AppLocalizations.of(context).translate(labelConst).toUpperCase(), color: textColor),
      ),
    );
  }

}