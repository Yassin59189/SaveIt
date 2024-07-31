import 'package:flutter/material.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.text,
  });

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Image(
                  width: THelperFunctions.screenWidth() * 0.8,
                  height: THelperFunctions.screenHeight() * 0.4,
                  image: AssetImage(image)),
              SizedBox(
                  width: THelperFunctions.screenWidth() * 0.8,
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: TSizes.fontMd,
                        color: TColors.primary),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
