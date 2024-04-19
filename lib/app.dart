import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/features/authentication/screens/onboarding.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:const OnBoardingScreen(),
    );
  }
}