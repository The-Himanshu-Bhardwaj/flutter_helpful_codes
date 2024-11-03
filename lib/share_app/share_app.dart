import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void shareApp() {
  try {
    const playStoreId = 'your.package.name';
    const appLink = 'https://play.google.com/store/apps/details?id=$playStoreId';
    const shareMessage = 'Your message : $appLink';
    Share.share(shareMessage);
  } catch (e) {
    debugPrint(e.toString());
  }
}