import 'package:flutter/material.dart';
import 'package:get/get.dart';

class welcome_controller extends GetxController {
  static welcome_controller get instance => Get.find();

  final pageController = PageController();
  final currentPageIndex = 0.obs;

  void updatePageIndicator(index) {}


  void dotNavigationClick(index) {}


  void nextPage(index) {}
}