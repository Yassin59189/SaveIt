import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/common/widgets/snackBars/loaders.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/data/repositories/user_repository.dart';
import 'package:saveit/features/models/user_model.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  // Variables
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final verifPassword = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  // Sign up
  Future<void> signup() async {
    try {
      // Loading
      print('Signup called');
      FullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImage.colorLogo);
      // Check Internet
      /* final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      } */
      // Form Validation
      if (signupFormKey.currentState == null ||
          !signupFormKey.currentState!.validate()) {
        return;
      }
      // Register user in firebase

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      // Save
      final NewUser = UserModel(
          id: userCredential.user!.uid,
          fullName: fullname.text.trim(),
          email: email.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecord(NewUser);

      // Success message
      Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! verify email to continue');

      // Move to vrify email
      /* Get.to(() => const esmklpage()); */
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      FullScreenLoader.stopLoading();
    }
  }
}
