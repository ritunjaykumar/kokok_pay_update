import 'package:flutter/material.dart';

class CalenderDialog {
  final void Function(String date) callback;

  CalenderDialog(this.callback);

  void show(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    final DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime(currentDate.year - 80),
      initialDate: currentDate,
      lastDate: currentDate,
      helpText: 'Select Date Of Birth',
    );
    if (newDate != null) {
      String date =
          '${newDate.day}/${newDate.month < 10 ? '0${newDate.month}' : newDate.month}/${newDate.year}';
      callback(date);
    }
  }
}
