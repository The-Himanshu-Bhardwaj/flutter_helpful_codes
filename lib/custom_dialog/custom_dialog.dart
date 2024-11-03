import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'no_button.dart';
import 'yes_button.dart';

void showCustomDialog({
  required VoidCallback onPositivePress,
  required VoidCallback onNegativePress,
  required String icon,
  required String title,
  required String subtitle
}) {
  Get.dialog(AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    titlePadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    insetPadding: const EdgeInsets.all(15),
    content: SizedBox(
      height: 32.h,
      width: 70.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Image.asset(
              icon,
              height: 70,
              width: 70,
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              )),

          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onNegativePress,
                  child: const NoButton(),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onPositivePress,
                  child: const YesButton(),
                ),
              ),
            ],
          ),
          // Spacer()
        ],
      ),
    ),
  ));
}
