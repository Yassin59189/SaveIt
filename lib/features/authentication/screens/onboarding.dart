import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:saveit/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:saveit/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:saveit/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/device/device_utility.dart';



class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children:  [
          /// horizontal scroll
          PageView(
            children: [
            OnBoardingPage(image: TImage.onBoardImage1, text: TText.onBoardText1),
            OnBoardingPage(image: TImage.onBoardImage2, text: TText.onBoardText2),
            OnBoardingPage(image: TImage.onBoardImage3, text: TText.onBoardText3),
            ],
          ),
          /// dot navigation
          const OnBoardingDotNavigation(),

          /// buttons
          Positioned(
            bottom: TDeviceUtils.getBottomNavigationBarHeight()+20,
            left: 135,
            width: 150,
            child: ElevatedButton(onPressed: (){}, child: Text("Next", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: TColors.primary),),
            )
        ],
      ),
    );
  }
}



