import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:saveit/features/authentication/screens/home/home.dart';
import 'package:saveit/features/authentication/screens/login/login.dart';
import 'package:saveit/features/authentication/screens/login/verifyEmail.dart';
import 'package:saveit/features/authentication/screens/onboarding.dart';
import 'package:saveit/navigation_menu.dart';
import 'package:saveit/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:saveit/utils/exceptions/firebase_exceptions.dart';
import 'package:saveit/utils/exceptions/format_exceptions.dart';
import 'package:saveit/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    print("ready called !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    print('Current user: ${user?.email}');
    print('Email verified: ${user?.emailVerified}');
    print("ready called !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    if (user != null) {
      if (!user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyemailPage(email: user.email));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      final isFirstTime = deviceStorage.read('isFirstTime');

      if (isFirstTime == true) {
        Get.offAll(const OnBoardingScreen());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    }
  }

  // Login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  // Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
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
    throw TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw "somthing went wrong . Please Try again";
  }
}
