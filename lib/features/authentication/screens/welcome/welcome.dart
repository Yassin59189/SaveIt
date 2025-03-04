import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/welcome_images/bg_welcome.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            PageView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                          width: THelperFunctions.screenWidth() * 0.75,
                          image: const AssetImage(TImage.welcomeimg1)),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: THelperFunctions.screenWidth() * 0.7,
                      child: const Text(
                        TText.welcometext1,
                        style: TextStyle(
                            fontFamily: "inter",
                            fontWeight: FontWeight.w900,
                            fontSize: TSizes.fontSm),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 206.35,
                        height: 54.04,
                        child: ElevatedButton(
                            onPressed: () {
/*                               Get.to(const QuestionRegion());
 */
                            },
                            style: buttonPrimary,
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: TColors.white),
                            )))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
