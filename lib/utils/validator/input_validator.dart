import 'package:flutter/services.dart';

class RupeeFormatter implements TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String oldStr = oldValue.text;
    String newStr = newValue.text;
    if (newStr.isEmpty) return newValue;
    //clear

    int dotCount = 0;
    for (int i = 0; i < newStr.length; i++) {
      if (newStr.codeUnitAt(i) == 46) {
        dotCount++;
      }
    }
    if (dotCount >= 2) {
      return oldValue;
    }

    if ((oldStr.length >= newStr.length)) {
      return newValue;
    }
    bool isDot = oldStr.contains('.');
    int last = newStr.codeUnitAt(newStr.length - 1);
    var dotIndex = newStr.indexOf('.');
    //1. checking dot(46) and 2. checking decimal value
    if ((isDot && (last == 46)) || (isDot && dotIndex == newStr.length - 4)) {
      return oldValue;
    }
    return newValue;
  }
}

class DateTimeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String oldStr = oldValue.text;
    String newStr = newValue.text;
    if (oldStr.length >= newStr.length) return newValue;
    StringBuffer tempDate = StringBuffer();
    print('length: ${newStr.length}');
    if (newStr.length <= 2) {
      var dd = parseInt(newStr);
      if (dd != null && dd <= 31) {
        tempDate.write(newStr);
        if (newStr.length == 2) tempDate.write('/');
      } else {
        return oldValue;
      }
    } else if (newStr.length <= 5) {
      var mmTemp = newStr.substring(3);
      var mm = parseInt(mmTemp);
      if (mm != null && mm <= 12) {
        tempDate.write(newStr);
        if (newStr.length == 5) tempDate.write('/20');
      } else {
        return oldValue;
      }
    } else if (newStr.length < 11) {
      tempDate.write(newStr);
    } else {
      return oldValue;
    }
    return TextEditingValue(text: tempDate.toString(), selection: TextSelection.collapsed(offset: tempDate.length));
  }

  int? parseInt(String value) {
    try {
      int dd = int.parse(value);
      return dd;
    } catch (error) {
      return null;
    }
  }
}

class MobileNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final StringBuffer stringBuffer = StringBuffer();
    final newText = newValue.text;
    final int newTextLength = newText.length;

    if (newTextLength <= 13) {
      if (newTextLength == 1) {
        stringBuffer.write('+856 '); //+856 +98
        stringBuffer.write(newText);
      } else if (newTextLength != 3 && newTextLength > 1) {
        String countryCode = newText.substring(0, 3);
        stringBuffer.write('+$countryCode ');
        stringBuffer.write(newText.substring(3));
      }
    } else {
      stringBuffer.write(oldValue.text);
    }

    return TextEditingValue(
      text: stringBuffer.toString(),
      selection: TextSelection.collapsed(offset: stringBuffer.length),
    );
  }
}
