import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:saveit/features/authentication/screens/questions/Q_concerns%20.dart';
import 'package:saveit/features/authentication/screens/questions/Q_dependencies%20.dart';
import 'package:saveit/features/authentication/screens/questions/Q_spend.dart';
import 'package:saveit/features/authentication/screens/questions/question_1.dart';
import 'package:saveit/features/authentication/screens/questions/question_region.dart';
import 'package:saveit/features/authentication/screens/welcome/welcome.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class QuestionSavings extends StatefulWidget {
  const QuestionSavings({super.key});
  @override
  State<QuestionSavings> createState() => _QuestionSavingsState();
}

class _QuestionSavingsState extends State<QuestionSavings> {
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
                            builder: (context) => QuestionConcerns()));
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
                    "How much do you currently have in savings ?",
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
                  width: 334.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Savings",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
                SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestionDep()));
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
