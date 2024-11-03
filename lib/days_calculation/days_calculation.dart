import 'package:intl/intl.dart';

/// SHOWS DAYS PASSED FROM TODAY -> CHEQUE DATE (VDT)
int calculateDaysBetween(String date) {
  try {

    if (date.isEmpty) {
      return 0;
    }

    // YOUR DATE
    final dateString = date;
    final format = DateFormat("dd-MMM-yyyy");
    final responseDate = format.parse(dateString);

    // CURRENT DATE
    final today = DateTime.now();
    final difference = (today.difference(responseDate).inHours / 24).round();
    return difference;
  } catch (e) {
    return 0;
  }
}