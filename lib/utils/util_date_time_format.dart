import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant/constant_string.dart';

String serverStringFormat(String date) {
  return DateFormat(serverFormat)
      .format(DateFormat(dateFormat).parse(date));
}

String serverDateFormat(DateTime date) {
  return DateFormat(serverFormat).format(date);
}

String showDateFormat(String format, DateTime date) {
  return DateFormat(format).format(date);
}

String convertDateFormat(String format, String date) {
  return DateFormat(format).format(DateTime.parse(date));
}

String showTimeFormat(String time) {
  return DateFormat(timeFormat).format(DateFormat(serverTime).parse(time));
}

String serverTimeFormat(String time) {
  return DateFormat(serverTime).format(DateFormat(timeFormat).parse(time));
}

Future<DateTime> selectDate(BuildContext context) async {
  DateTime selectedDate = DateTime.now();
  final DateTime? dateTime = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime.now(),
    lastDate: DateTime(2050),
  );

  return dateTime!;
}

Future<TimeOfDay> selectTime(BuildContext context, {is24Hours}) async {
  TimeOfDay selectedTime = TimeOfDay.now();
  final TimeOfDay? selectTime = await showTimePicker(
    context: context,
    initialTime: selectedTime,
    builder: (context, child) {
      final Widget mediaQueryWrapper = MediaQuery(
        data: MediaQuery.of(context).copyWith(
          alwaysUse24HourFormat: is24Hours ?? true,
        ),
        child: child!,
      );
      // A hack to use the es_US dateTimeFormat value.
      /*if (Localizations.localeOf(context).languageCode == spanishCode) {
        return Localizations.override(
          context: context,
          locale: const Locale('es', 'US'),
          child: mediaQueryWrapper,
        );
      }*/
      return mediaQueryWrapper;
    },
  );

  return selectTime!;
}
