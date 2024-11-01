import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceVibration {

  /// VIBRATE LIGHT IMPACT
  static void vibrateTwice() {
    try {
      HapticFeedback.lightImpact();
      Future.delayed(const Duration(milliseconds: 100), () {
        HapticFeedback.lightImpact();
      });
    } catch(e) {
      debugPrint('vibration error');
    }
  }

  /// VIBRATE LIGHT IMPACT
  static void vibrateOnce() {
    try {
      HapticFeedback.lightImpact();
    } catch(e) {
      debugPrint('vibration error');
    }
  }
}