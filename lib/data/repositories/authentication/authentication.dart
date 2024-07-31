import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:saveit/features/authentication/screens/login/login.dart';
import 'package:saveit/features/authentication/screens/onboarding.dart';
import 'package:saveit/features/authentication/screens/questions/Q_concerns%20.dart';
import 'package:saveit/features/authentication/screens/signup/verifyEmail.dart';
import 'package:saveit/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:saveit/utils/exceptions/firebase_exceptions.dart';
import 'package:saveit/utils/exceptions/format_exceptions.dart';
import 'package:saveit/utils/exceptions/platform_exceptions.dart';
import 'package:saveit/features/authentication/screens/signup/Success.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(const QuestionConcerns());
      } else {
        Get.offAll(const VerifyemailPage());
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => VerifyemailPage(email: _auth.currentUser?.email))
          : Get.offAll(const OnBoardingScreen());
    }

    // Register
    Future<UserCredential> registerWithEmailAndPassword(
        String email, String password) async {
      try {
        return await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } catch (e) {
        throw 'Something went wrong. Please try again!';
      }
    }

    sendEmailVerification() {}
  }

/*-------------------------------------Email verification---------------------------------------------------------*/
  Future<void> sendEmailVerification() async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "somthing went wrong . Please Try again";
    }
  }
}
