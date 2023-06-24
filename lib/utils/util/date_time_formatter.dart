import 'package:intl/intl.dart';

class DateTimeFormatter {
  const DateTimeFormatter._();

  static const DateTimeFormatter _formatter = DateTimeFormatter._();

  factory DateTimeFormatter() => _formatter;

  String ddmmyyyy(DateTime dateTime) {
    var add_yMd = DateFormat();
    print(add_yMd.format(dateTime));

    final dateFormat = DateFormat('dd-mm-yyyy');
    return dateFormat.format(dateTime);
  }

  String getFullFormat(DateTime dateTime){
    final dateFormat = DateFormat.yMd().add_jm();
    return dateFormat.format(dateTime);
  }

  DateTime respFormat(String date) {
    //20230217230445
    int year = int.parse(date.substring(0, 4));
    int month = int.parse(date.substring(4, 6));
    int day = int.parse(date.substring(6, 8));
    int hh = int.parse(date.substring(8, 10));
    int mm = int.parse(date.substring(10, 12));
    int ss = int.parse(date.substring(12, date.length));

    return DateTime(year, month, day, hh, mm, ss);
  }
}
