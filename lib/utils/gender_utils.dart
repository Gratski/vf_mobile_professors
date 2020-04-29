import 'package:flutter/cupertino.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/models/gender.dart';

class GenderUtils {

  String getGenderString(Gender gender, BuildContext context) {
    GeneralConstants constants = GeneralConstants();
    if (gender == Gender.FEMALE) {
      return AppLocalizations.of(context).translate(constants.genderFemaleLabel);
    } else {
      return AppLocalizations.of(context).translate(constants.genderMaleLabel);
    }
  }

}