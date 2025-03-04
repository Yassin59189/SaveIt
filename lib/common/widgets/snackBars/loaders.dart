import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/utils/constants/colors.dart';

class Loaders {
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: TColors.secondary,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: Colors.white,
        ));
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: Colors.white,
        ));
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: TColors.secondary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.check,
          color: Colors.white,
        ));
  }
}
