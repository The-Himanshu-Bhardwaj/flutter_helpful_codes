import 'package:flutter/material.dart';
import 'package:open_store/open_store.dart';

void openAppStores() {
  try {
    OpenStore.instance.open(
      appStoreId: 'your_app_store_id',
      androidAppBundleId: 'your.package.name',
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}