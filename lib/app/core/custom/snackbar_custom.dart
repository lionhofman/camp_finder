import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarCustom {
  static showSnackbar({
    required String message,
    required bool isError,
    int? secondsDuration,
    SnackPosition? position,
  }) {
    Get.snackbar(
      '',
      '',
      duration: Duration(
        seconds: secondsDuration ?? 4,
      ),
      snackPosition: position,
      backgroundColor: isError ? Colors.red : Colors.green,
      borderRadius: 0,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 0),
      isDismissible: false,
      titleText: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      messageText: Container(),
    );
  }
}
