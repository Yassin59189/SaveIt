import 'package:flutter/material.dart';
import 'package:saveit/features/authentication/screens/questions/Q_dependencies%20.dart';
import 'package:saveit/features/authentication/screens/questions/Q_habits.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class QuestionSpend extends StatefulWidget {
  const QuestionSpend({super.key});

  @override
  State<QuestionSpend> createState() => _QuestionSpendState();
}

class _QuestionSpendState extends State<QuestionSpend> {
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const QuestionDep()));
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
                    "how much do you spend monthly ?",
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
                  width: 334.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Rent",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
                SizedBox(
                  width: 334.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "bills ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
                SizedBox(
                  width: 334.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Groceries",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
                SizedBox(
                  width: 334.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Entertainment",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
                SizedBox(
                  width: 334.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Loans",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtsections,
                ),
                SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const QuestionHabits()));
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
