import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // update index when page change
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  // jump to specific selected dot page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // update current index and  jump to the next page
  void nextPage() {
    if(currentPageIndex.value==2){
      /* Get.to(LoginScreen()); */
    }
    else{
      int page = currentPageIndex.value +1;
      pageController.jumpToPage(page);
    }
  }
}