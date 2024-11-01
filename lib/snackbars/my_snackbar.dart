import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../vibrate_device/vibrate_device.dart';

class MySnackbars {
  /// NOTIFIER SNACKBAR
  static void showSnackBar(String message, int milliseconds) {
    // SINGLE VIBRATION
    DeviceVibration.vibrateOnce();

    Get.closeCurrentSnackbar();

    Get.snackbar(
      'Success',
      message,
      margin: const EdgeInsets.all(15),
      titleText: const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Text('Done',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'SansBold',
            )),
      ),
      messageText: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            )),
      ),
      overlayColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      shouldIconPulse: false,
      icon: const Padding(
        padding: EdgeInsets.only(left: 12),
        child: FaIcon(FontAwesomeIcons.circleCheck, color: Colors.green),
      ),
      animationDuration: const Duration(milliseconds: 200),
      duration: Duration(milliseconds: milliseconds),
      backgroundColor: Colors.black87,
      colorText: Colors.white,
    );
  }

  /// ERROR SNACKBAR
  static void showErrorSnackBar(String message, int timeMilliseconds) {
    // ERROR VIBRATION
    DeviceVibration.vibrateTwice();

    Get.closeCurrentSnackbar();

    Get.snackbar(
      'Error',
      message,
      margin: const EdgeInsets.all(15),
      titleText: const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Text('Oops!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'SansBold',
            )),
      ),
      messageText: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            )),
      ),
      overlayColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      shouldIconPulse: false,
      icon: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: FaIcon(
          FontAwesomeIcons.circleExclamation,
          color: Colors.yellow,
          size: 20,
        ),
      ),
      animationDuration: const Duration(milliseconds: 200),
      duration: Duration(milliseconds: timeMilliseconds),
      backgroundColor: Colors.black87,
      colorText: Colors.white,
    );
  }

  /// NO INTERNET SNACKBAR
  static void noInternetSnackbar() {
    // ERROR VIBRATION
    DeviceVibration.vibrateTwice();

    Get.closeCurrentSnackbar();

    Get.snackbar(
      'No Internet',
      'Please check your connection',
      margin: const EdgeInsets.all(15),
      titleText: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: Text('No Internet',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'SansBold',
            )),
      ),
      messageText: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: Text('Please connect to a network to proceed',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            )),
      ),
      overlayColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      shouldIconPulse: false,
      icon: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: FaIcon(
          FontAwesomeIcons.wifi,
          color: Colors.red,
        ),
      ),
      animationDuration: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 1500),
      backgroundColor: Colors.black87,
      colorText: Colors.white,
    );
  }
}
