import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:saveit/common/widgets/snackBars/loaders.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/features/authentication/controllers/sign%20up/network_manager.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? 'empty';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? 'empty';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Loading
      FullScreenLoader.openLoadingDialog("Logging you in...");

      // Check connection
      /* final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      } */

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Save data if remeber me is selected
      if (rememberMe.value) {
        print("remeber me active !!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user
      final UserCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      print('Login successful: ${UserCredentials.user?.email}');

      // Remove loader
      FullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      print('Login error: $e');
    }
  }
}
