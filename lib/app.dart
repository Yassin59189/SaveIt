import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/utils/constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      /* initialBinding: GeneralBindings(), */
      home: Scaffold(
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
