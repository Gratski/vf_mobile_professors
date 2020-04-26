import 'package:flutter/cupertino.dart';
import 'package:professors/localization/app_localizations.dart';
import 'package:professors/localization/constants/date_constants.dart';
import 'package:professors/localization/constants/general_constants.dart';
import 'package:professors/localization/helpers/localization_helper.dart';

class DateUtils {
  BuildContext context;

  DateUtils(BuildContext context) {
    this.context = context;
  }

  String fromDateToString(DateTime date) {
    int day = date.day;
    String dayStr = '$day';
    String ofWord =
        AppLocalizations.of(context).translate(GeneralConstants().wordOf);
    String month = AppLocalizations.of(context)
        .translate(DateConstants().getMonth(date.month));
    int year = date.year;

    /// retrieve contextualized date string format according to country
    if (LocalizationHelper().isRunningEnglish(context)) {
      ofWord = (day == 1) ? 'st' : (day == 2) ? 'nd' : (day == 3) ? 'rd' : 'th';
      dayStr = '$day$ofWord';
    } else {
      dayStr = '$day $ofWord';
    }

    return "$dayStr $month $year";
  }
}
