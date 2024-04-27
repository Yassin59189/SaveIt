import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:saveit/features/authentication/screens/questions/question_region.dart';
import 'package:saveit/features/authentication/screens/welcome/welcome.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class question1 extends StatefulWidget {
  question1({super.key});

  @override
  State<question1> createState() => _question1State();
}

class _question1State extends State<question1> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtsections),
            width: 40,
            height: 40,
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Welcome()));
                },
                icon: Icon(Icons.arrow_back_rounded)),
          ),
          PageView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: THelperFunctions.screenWidth() * 0.8,
                    child: const Text(
                      TText.question1_headline,
                      style: TextStyle(
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: TSizes.fontSm,
                          color: TColors.primary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPressed1 = !isPressed1;
                            });
                          },
                          style: isPressed1
                              ? buttonquestionSelected
                              : buttonquestions,
                          child: Text(
                            TText.answer1,
                            style: TextStyle(color: TColors.white),
                          ))),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPressed2 = !isPressed2;
                              if (isPressed2 == true) {}
                            });
                          },
                          style: isPressed2
                              ? buttonquestionSelected
                              : buttonquestions,
                          child: Text(
                            TText.answer2,
                            style: TextStyle(color: TColors.white),
                          ))),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPressed3 = !isPressed3;
                            });
                          },
                          style: isPressed3
                              ? buttonquestionSelected
                              : buttonquestions,
                          child: Text(
                            TText.answer3,
                            style: TextStyle(color: TColors.white),
                          ))),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isPressed4 = !isPressed4;
                            });
                          },
                          style: isPressed4
                              ? buttonquestionSelected
                              : buttonquestions,
                          child: Text(
                            TText.answer4,
                            style: TextStyle(color: TColors.white),
                          ))),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  SizedBox(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: buttonanContinueSecondary,
                          child: Text(
                            TText.Continue,
                            style: TextStyle(color: TColors.white),
                          ))),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
