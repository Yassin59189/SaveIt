import 'package:flutter/material.dart';
import 'package:saveit/features/authentication/screens/questions/Q_savings.dart';
import 'package:saveit/navigation_menu.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class QuestionYacoubi extends StatefulWidget {
  const QuestionYacoubi({super.key});

  @override
  State<QuestionYacoubi> createState() => _QuestionYacoubiState();
}

class _QuestionYacoubiState extends State<QuestionYacoubi> {
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
            padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtsections),
            child: SizedBox(
              child: IconButton(
                  hoverColor: TColors.secondary,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuestionSavings()));
                  },
                  icon: const Icon(Icons.arrow_back_rounded)),
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
                    "do you have some investments ?",
                    style: TextStyle(
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: TSizes.fontMd,
                        color: TColors.primary),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
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
                        child: const Text(
                          "Yes i do",
                          style: TextStyle(color: TColors.white),
                        ))),
                const SizedBox(
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
                        child: const Text(
                          "No i dont",
                          style: TextStyle(color: TColors.white),
                        ))),
                const SizedBox(
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
                        child: const Text(
                          "Not intrested in investing",
                          style: TextStyle(color: TColors.white),
                        ))),
                const SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
                SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavigationMenu()));
                        },
                        style: buttonanContinueSecondary,
                        child: const Text(
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
