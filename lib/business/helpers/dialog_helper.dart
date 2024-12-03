import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  // Show snack bar
  static void showErrorSnackbar(String? message, {String? title}) {
    String errorMessage = message ??= "There was an error";
    Get.snackbar(
      "Error ${title != null ? ": $title" : ""}",
      errorMessage,
      duration: const Duration(seconds: 10),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.black,
    );
  }

  static void showSnackbar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.black,
    );
  }

  // Show loading
  static void showGetXLoading() {
    Get.dialog(
      const Dialog(
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  // Hide loading
  static void hideGetXLoading() {
    if (Get.isDialogOpen != null) {
      if (Get.isDialogOpen!) {
        Get.back();
      }
    }
  }





}
