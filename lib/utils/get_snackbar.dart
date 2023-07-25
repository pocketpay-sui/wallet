import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  static void showErrorSnackBar(String message) {
    Get.snackbar('Error', message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[900],
        colorText: Colors.white,
        margin: const EdgeInsets.all(10));
  }

  static void showSuccessSnackBar(String message) {
    Get.snackbar('Success', message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lightGreen[500],
        colorText: Colors.white,
        margin: const EdgeInsets.all(10));
  }

  static void showErrorSnackBarWIthButton(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red[900],
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }
}
