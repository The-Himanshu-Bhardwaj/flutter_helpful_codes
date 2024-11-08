import 'package:flutter/services.dart';


/// USED IN TEXT FIELDS WHERE DECIMALS INPUT IS REQUIRED
/// THIS DOES NOT ALLOW MULTIPLE DECIMALS POINTS IN THE TEXT FIELD
class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    }
    // ALLOWS ONE DECIMAL POINT ONLY, INSIDE THE TEXT FIELD
    if (newValue.text.contains('.') && newValue.text.indexOf('.') != newValue.text.lastIndexOf('.')) {
      return oldValue;
    }

    return newValue;
  }
}