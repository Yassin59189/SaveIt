import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';

class Languge extends StatefulWidget {
  const Languge({super.key});

  @override
  State<Languge> createState() => _Languge();
}

List<String> options = [
  'English',
  'Arabic',
  'French',
];

class _Languge extends State<Languge> {
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/profile/profile_bg.png"),
        )),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtsections),
                  child: SizedBox(
                    child: IconButton(
                        hoverColor: TColors.secondary,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_rounded)),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.25,
                ),
                const Text(
                  "Language",
                  style: TextStyle(
                      color: TColors.primary,
                      fontSize: TSizes.lg,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Suggested",
                  style: TextStyle(
                      color: TColors.primary,
                      fontSize: TSizes.lg - 5,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: screenWidth * 0.8,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          options[0],
                          style: TextStyle(
                              color: TColors.primary,
                              fontSize: TSizes.fontMd,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 30,
                          child: RadioListTile(
                              activeColor: TColors.secondary,
                              value: options[0],
                              groupValue: currentOption,
                              onChanged: (value) {
                                setState(() {
                                  currentOption = value.toString();
                                });
                              }),
                        )
                      ]),
                ),
                Container(
                  width: screenWidth * 0.8,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          options[1],
                          style: TextStyle(
                              color: TColors.primary,
                              fontSize: TSizes.fontMd,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 30,
                          child: RadioListTile(
                              activeColor: TColors.secondary,
                              value: options[1],
                              groupValue: currentOption,
                              onChanged: (value) {
                                setState(() {
                                  currentOption = value.toString();
                                });
                              }),
                        )
                      ]),
                ),
                Container(
                  width: screenWidth * 0.8,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          options[2],
                          style: TextStyle(
                              color: TColors.primary,
                              fontSize: TSizes.fontMd,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 30,
                          child: RadioListTile(
                              activeColor: TColors.secondary,
                              value: options[2],
                              groupValue: currentOption,
                              onChanged: (value) {
                                setState(() {
                                  currentOption = value.toString();
                                });
                              }),
                        )
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
