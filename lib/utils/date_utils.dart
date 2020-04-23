import 'package:flutter/cupertino.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/date_constants.dart';
import 'package:professors/localization/constants/general_constants.dart';

class DateUtils {

  BuildContext context;
  DateUtils(BuildContext context) {
    this.context = context;
  }

  String fromDateToString(DateTime date){
    String of = AppLocalizations.of(context).translate(GeneralConstants().wordOf);
    String month = AppLocalizations.of(context).translate(DateConstants().getMonth(date.month));
    return "${date.day} $of $month";
  }

}