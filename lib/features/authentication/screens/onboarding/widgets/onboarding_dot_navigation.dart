import 'package:flutter/material.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight()+90,
      left: 160,
      child: SmoothPageIndicator(controller: PageController(), count: 3, effect: ExpandingDotsEffect(activeDotColor: TColors.primary, dotHeight: 9),)
      );
  }
}
