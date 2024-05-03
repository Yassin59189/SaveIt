import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:saveit/features/authentication/screens/questions/Q_spend.dart';
import 'package:saveit/features/authentication/screens/questions/question_3.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class QuestionDep extends StatefulWidget {
  QuestionDep({super.key});

  @override
  State<QuestionDep> createState() => _QuestionDepState();
}

class _QuestionDepState extends State<QuestionDep> {
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
            child: SizedBox(
              child: IconButton(
                  hoverColor: TColors.secondary,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Question3()));
                  },
                  icon: Icon(Icons.arrow_back_rounded)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: THelperFunctions.screenWidth() * 0.8,
                  child: const Text(
                    "do you have any dependencies ?",
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: TSizes.fontMd,
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
                          "Elderly parents",
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
                          "Cousins ",
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
                          "Children",
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
                          "Siblings",
                          style: TextStyle(color: TColors.white),
                        ))),
                SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
                SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestionSpend()));
                        },
                        style: buttonanContinueSecondary,
                        child: Text(
                          TText.Continue,
                          style: TextStyle(color: TColors.white),
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
