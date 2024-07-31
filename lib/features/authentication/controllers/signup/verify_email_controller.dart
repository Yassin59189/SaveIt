import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:saveit/common/widgets/snackBars/loaders.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/features/authentication/screens/signup/Success.dart';

import 'package:saveit/utils/constants/colors.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  @override
  void onInit() {
    sendEmailVerification();
    setTimerOrAutoRedirect();
    super.onInit();
  }

  checkEmailVeficationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => Success(
            image: "assets/animations/checkmark.json",
            title: 'Email Verified',
            subtitle: 'You can now login with your email and password',
            onPressed: () =>
                {AuthenticationRepository.instance.screenRedirect()},
          ));
    }
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Loaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your email',
      );
    } catch (e) {
      Loaders.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    }
  }
}

setTimerOrAutoRedirect() {
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    await FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user?.emailVerified ?? false) {
      timer.cancel();
      Get.off(() => Success(
            image: "assets/animations/checkmark.json",
            title: 'Email Verified',
            subtitle: 'You can now login with your email and password',
            onPressed: () =>
                {AuthenticationRepository.instance.screenRedirect()},
          ));
    }
  });
}
