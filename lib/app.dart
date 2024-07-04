import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/bindings/general_bindings.dart';
import 'package:saveit/features/authentication/screens/onboarding.dart';
import 'package:saveit/utils/constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      /* initialBinding: GeneralBindings(), */
      home: const Scaffold(
        backgroundColor: TColors.secondary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
