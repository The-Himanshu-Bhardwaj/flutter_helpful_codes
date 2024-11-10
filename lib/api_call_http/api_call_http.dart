import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_helpful_codes/floor/test_model.dart';
import 'package:http/http.dart' as http;
import '../check_internet/check_internet.dart';
import '../sleep/sleep.dart';
import '../snackbars/my_snackbar.dart';

class ApiRepo {

  // METHOD WITHOUT BODY PARAMS
  Future<TestModel> downloadUserSettings() async {

    // Checking internet first
    final internetConnected = await checkInternetConnection();
    if (!internetConnected) {
      MySnackbars.noInternetSnackbar();
      throw Exception('NO_INTERNET_MESSAGE');
    }

    // Delay for smooth transitions
    await sleepForMilliseconds(300);

    try {

      /// HTTP REQUEST
      final url = Uri.parse('https://www.api_url.com');

      final response =
      await http.post(url).timeout(const Duration(seconds: 30), onTimeout: () {
        return http.Response('Error', 408);
      });

      // Printing url
      debugPrint('URL ->> $url');

      // WHEN RESPONSE BODY IS BLANK
      if (response.body.isEmpty) {
        throw Exception('EMPTY_RESPONSE_MESSAGE');
      }

      // Response Success
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final model = TestModel.fromJson(data);
        return model;
      }

      // Timeout error
      else if (response.statusCode == 408) {
        throw Exception('API_TIMEOUT_MESSAGE');
      }

      // Any other status code
      else {
        throw Exception('Error : Code (${response.statusCode}) Failed to load data');
      }

    }

    /// EXCEPTION
    catch (e) {
      throw Exception('EXCEPTION_MESSAGE');
    }
  }

  // METHOD WITH BODY PARAMS
  Future<TestModel> uploadData(String orderJson) async {

    // Checking internet first
    final internetConnected = await checkInternetConnection();
    if (!internetConnected) {
      MySnackbars.noInternetSnackbar();
      throw Exception('NO_INTERNET_MESSAGE');
    }

    try {

      /// HTTP REQUEST
      Uri url = Uri.http('https://www.your_api_url.com');

      final response = await http
          .post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: orderJson)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        return http.Response('Error', 408);
      });

      // Printing url
      debugPrint('URL ->> $url');

      // WHEN RESPONSE BODY IS BLANK
      if (response.body.isEmpty) {
        throw Exception('EMPTY_RESPONSE_MESSAGE');
      }

      // Response Success
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final model = TestModel.fromJson(data);
        return model;
      }

      // Timeout error
      else if (response.statusCode == 408) {
        throw Exception('API_TIMEOUT_MESSAGE');
      }

      // Any other status code
      else {
        throw Exception('Error : Code (${response.statusCode}) Failed to load data');
      }

    }

    /// EXCEPTION
    catch (e) {
      throw Exception('EXCEPTION_MESSAGE');
    }
  }
}