import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../util/app_constants.dart';

// LOADING PROGRESS DIALOG, USED THROUGHOUT THE APP
void showLoadingDialog(String message) {
  if (AppConstants.LOADING_DIALOG_VISIBLE) {
    return;
  }
  Get.dialog(
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 100),
      PopScope(
        canPop: false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          content: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircularProgressIndicator(
                  color: Colors.black87,
                ),
                const SizedBox(width: 20),
                Text(
                  message,
                  style: const TextStyle(fontSize: 15, color:Colors.black87),
                ),
              ],
            ),
          ),
        ),
      )
  );
  AppConstants.LOADING_DIALOG_VISIBLE = true;
}

void dismissLoadingDialog() {
  if (AppConstants.LOADING_DIALOG_VISIBLE) {
    Get.back();
    AppConstants.LOADING_DIALOG_VISIBLE = false;
  }
}
