import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:saveit/features/authentication/screens/welcome/welcome.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class Success extends StatelessWidget {
  const Success(
      {super.key,
      required this.title,
      required this.image,
      required this.subtitle,
      required this.onPressed});
  final String image, title, subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: (Lottie.asset(image, width: 300)),
                  ),
                  Text(
                    title,
                    maxLines: 4,
                    style: TextStyle(
                      fontFamily: "popins",
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
              new Text(
                subtitle,
                style: TextStyle(
                    fontFamily: "inter",
                    fontWeight: FontWeight.w900,
                    fontSize: TSizes.fontSm),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 206.35,
                  height: 54.04,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      /*                               Get.to();
             */

                      style: buttonPrimary,
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: TColors.white),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
