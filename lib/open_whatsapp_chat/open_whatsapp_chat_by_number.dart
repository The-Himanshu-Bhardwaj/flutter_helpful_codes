import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void sendWhatsappMessage() async {

  try {

    const phoneNumber = '919988775533';
    const message = 'I am writing hello world.';
    const url = 'https://api.whatsapp.com/send/?phone=$phoneNumber&text=$message&type=phone_number&app_absent=0';

    // LAUNCH URL PACKAGE IS USED HERE, DIRECTLY OPENS WHATSAPP AND PASTES THE MESSAGE, READY TO SEND
    await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );

  } catch (e) {
    debugPrint(e.toString());
  }

}