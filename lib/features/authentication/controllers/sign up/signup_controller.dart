import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/common/widgets/snackBars/loaders.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/data/repositories/user_repository.dart';
import 'package:saveit/features/authentication/screens/signup/verifyEmail.dart';
import 'package:saveit/features/models/user_model.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  // Variables
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final budget = "0";
  final verifPassword = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  // Sign up
  Future<void> signup() async {
    try {
      // Loading
/*       FullScreenLoader.openLoadingDialog(
          'We are processing your information...'); */
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
        profilePicture: '',
        budget: "0",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(NewUser);
      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('savings').doc(user.uid).set({
          'goals': [] // Initialize with an empty array of savings goals
        });
      } else {
        print("User is null. Savings document cannot be created.");
      }
      // Success message
      Loaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! verify email to continue');

      print("Navigating to Verify Email Page...");
      // Move to verify email
      Get.to(() => VerifyemailPage(email: email.text.trim()));
      print("Navigation successful");
    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
