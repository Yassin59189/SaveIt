import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:saveit/features/authentication/screens/questions/Q_habits.dart';
import 'package:saveit/features/authentication/screens/questions/Q_yacoubi.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class QuestionConcerns extends StatefulWidget {
  QuestionConcerns({super.key});

  @override
  State<QuestionConcerns> createState() => _QuestionConcernsState();
}

class _QuestionConcernsState extends State<QuestionConcerns> {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionHabits()));
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
                    "What are some of your biggest financial concerns right now ?",
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
                          "Reducing monthly expenses",
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
                          "Saving for a large purchase",
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
                          "Paying off debt",
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
                                  builder: (context) => QuestionYacoubi()));
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
