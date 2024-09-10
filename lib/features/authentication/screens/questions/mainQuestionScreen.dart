import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/common/widgets/loaders/animation_loader.dart';
import 'package:saveit/common/widgets/snackBars/loaders.dart';
import 'package:saveit/features/authentication/screens/login/login.dart';
import 'package:saveit/features/authentication/screens/questions/Savings.dart';
import 'package:saveit/features/authentication/screens/questions/priorities.dart';
import 'package:saveit/features/authentication/screens/signup/Success.dart';
import 'package:saveit/navigation_menu.dart';

import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:iconsax/iconsax.dart';
import 'ManageBudget.dart'; // Import the page

import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class QuestionConcerns extends StatefulWidget {
  const QuestionConcerns({super.key});

  @override
  State<QuestionConcerns> createState() => _QuestionConcernsState();
}

class _QuestionConcernsState extends State<QuestionConcerns> {
  PageController _pageController = PageController();
  int currentProgress = 0;

  List<Widget> pages = [
    MangeBudget(), // Your ManageBudget page
    Priorities(), // Your ManageBudget page
    Savings(), // Your ManageBudget page
  ];
  List<String> Captions = [
    "Managing Your Budget", // Your ManageBudget page
    "Orginizing Your finances", // Your ManageBudget page
    "Setting up Goals", // Your ManageBudget page
  ];

  void _nextPage() {
    if (currentProgress < pages.length - 1) {
      setState(() {
        currentProgress++;
        _pageController.animateToPage(
          currentProgress,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _lastPage() {
    if (currentProgress > 0) {
      setState(() {
        currentProgress--;
        _pageController.animateToPage(
          currentProgress,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          currentProgress >= 1
              ? Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: TSizes.spaceBtsections),
                  child: SizedBox(
                    child: IconButton(
                      hoverColor: TColors.secondary,
                      onPressed: _lastPage,
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                  ),
                )
              : SizedBox(
                  height: TSizes.spaceBtsections * 2.5,
                ),
          Container(
            width: screenWidth * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Captions[currentProgress],
                  style: TextStyle(
                    fontFamily: 'popins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: TColors.primary,
                  ),
                  textAlign: TextAlign.left,
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Container(
                    width: screenWidth * 0.16,
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${currentProgress + 1}/${pages.length}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'popins',
                          color: TColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth * 0.9,
            child: Center(
                child: FAProgressBar(
                    progressColor: TColors.secondary,
                    size: 10,
                    borderRadius: BorderRadius.circular(30),
                    currentValue: currentProgress.toDouble() + 1,
                    maxValue: pages.length.toDouble(),
                    backgroundColor: Colors.grey.shade300.withOpacity(0.6))),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: pages,
              physics: NeverScrollableScrollPhysics(), // Disable manual swipe
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(200.35, 54.04),
                backgroundColor: TColors.secondary,
                elevation: 0,
                textStyle: const TextStyle(
                    fontFamily: "nunito",
                    fontWeight: FontWeight.w600,
                    fontSize: TSizes.fontMd,
                    color: TColors.white)),
            onPressed: currentProgress > pages.length - 2
                ? () {
/*                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationMenu())); */

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                : _nextPage,
            child: Text(
              'Continue',
              style: TextStyle(
                color: TColors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
