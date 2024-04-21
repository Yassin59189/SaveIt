import 'package:flutter/material.dart';
import 'package:saveit/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight()+200,
      left: 160,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
         count: 3, effect: ExpandingDotsEffect(activeDotColor: TColors.primary, dotHeight: 9),)
      );
  }
}
