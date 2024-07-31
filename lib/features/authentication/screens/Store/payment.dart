import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/features/authentication/screens/questions/question_region.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class paymentdone extends StatelessWidget {
  const paymentdone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/vigitabs/paybanner.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            PageView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: TSizes.spaceBtsections * 8,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: THelperFunctions.screenWidth() * 0.7,
                      child: const Text(
                        "Congratulations! Your order has been successfully confirmed.Thank you for choosing us. Should you have any questions or require further assistance, feel free to reach out to our customer support team.",
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
                              Get.to(const QuestionRegion());
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
