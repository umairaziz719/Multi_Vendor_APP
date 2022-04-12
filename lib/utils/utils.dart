import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

void navigateTo(BuildContext context, Widget to) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => to));

/// show date picker and returns selected date
Future<DateTime?> showDateDialog(BuildContext context) async {
  return await showDatePicker(
      context: context,
      builder: (context, child) => Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(primary: Color(0xffFFAA11)),
            ),
            child: child!,
          ),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)));
}

/// formats date to required format
// String formatTo(DateTime date, DateFormat format) => format.format(date);
