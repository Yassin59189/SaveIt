import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
            OnBoardingPage(image: TImage.onBoardImage1, text: TText.onBoardText1),
            OnBoardingPage(image: TImage.onBoardImage2, text: TText.onBoardText2),
            OnBoardingPage(image: TImage.onBoardImage3, text: TText.onBoardText3),
            ],
          ),
          /// dot navigation
          const OnBoardingDotNavigation(),

          /// buttons
          
          // Next button
          Positioned(
            bottom: TDeviceUtils.getBottomNavigationBarHeight()+100,
            left: 135,
            width: 150,
            child: ElevatedButton(onPressed: ()=>OnBoardingController.instance.nextPage(), child: Text("Next", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: TColors.primary),),
            ),

            //Sign Up button
            Positioned(
            bottom: TDeviceUtils.getBottomNavigationBarHeight()+40,
            left: 135,
            width: 150,
            child: ElevatedButton(onPressed: (){}, child: Text("Sign up", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: TColors.primary),),
            ),
        ],
      ),
    );
  }
}



