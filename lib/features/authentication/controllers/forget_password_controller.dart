import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/common/widgets/snackBars/loaders.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/features/authentication/screens/RestPassword/reset_password.dart';
import 'package:saveit/features/authentication/screens/login/forgotPassword.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      // Loading
      // Internet check
      // Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password'.tr);

      /* Redirect */

      Get.to(() => Reset_Password_Screen(
            email: email.text.trim(),
          ));
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Loading
      // Internet check

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your password'.tr);
    } catch (e) {}
  }
}
