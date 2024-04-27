import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/features/authentication/screens/questions/question_region.dart';
import 'package:saveit/features/authentication/screens/signup/signup.dart';
import 'package:saveit/features/authentication/screens/welcome/welcome.dart';
import 'package:saveit/features/authentication/screens/signup/code_verify.dart';
import 'package:saveit/features/authentication/screens/welcome/welcome.dart';
import 'package:saveit/features/authentication/controllers/welcome_controller.dart';
import 'package:saveit/features/authentication/screens/Welcome/welcome.dart';
import 'package:saveit/features/authentication/screens/onboarding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionRegion(),
    );
  }
}
