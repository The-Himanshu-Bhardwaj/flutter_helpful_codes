import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// RETURNS APP VERSION
Future<void> getAppVersion() async {
  try {

    final packageInfo = await PackageInfo.fromPlatform();
    final buildNumber = packageInfo.buildNumber;
    final appVersion = packageInfo.version;

    debugPrint('CURRENT BUILD NUMBER ->>> $buildNumber');
    debugPrint('CURRENT APP VERSION ->>> $appVersion');


  } catch(e) {
    debugPrint(e.toString());
  }

}