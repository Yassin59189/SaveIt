import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:saveit/features/authentication/screens/questions/question_1.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class QuestionRegion extends StatelessWidget {
  const QuestionRegion({super.key});

  @override
  Widget build(BuildContext context) {
    String _dropdownvalue = "";
    List<String> dropdownItems = [
      'tunis',
      'Bizerte',
      'Nabeul',
      'Ariana',
      'Ben Arous',
      'Manouba',
      'Zaghouan',

      // South East Region
      'Gabès',
      'Medenine',

      // South West Region
      'Gafsa',
      'Tozeur',
      'Kebili',

      // North West Region
      'Jendouba',
      'Béja',
      // ... Add remaining governorates for North West Region here (if needed)
    ];
    String selectedItem = ''; // Set the initial selection

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: THelperFunctions.screenHeight() * 0.15,
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
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
                  const SizedBox(height: TSizes.spaceBtsections),
                  /*  DropdownButton(items: const [
                    DropdownMenuItem(
                      child: Text("tunis"),
                      value: 'tunis',
                    ),
                    DropdownMenuItem(
                      child: Text("Bizerte"),
                      value: 'Bizerte',
                    ),
                    DropdownMenuItem(
                      child: Text("Nabeul"),
                      value: 'Nabeul',
                    ),
                    DropdownMenuItem(
                      child: Text("Ariana"),
                      value: 'Ariana',
                    ),
                    DropdownMenuItem(
                      child: Text("Ben Arous"),
                      value: 'Ben Arous',
                    ),
                    DropdownMenuItem(
                      child: Text("Manouba"),
                      value: 'Manouba',
                    ),
                    DropdownMenuItem(
                      child: Text("Zaghouan"),
                      value: 'Zaghouan',
                    ),
                    DropdownMenuItem(
                      child: Text("Jendouba"),
                      value: 'Jendouba',
                    ),
                  ], value: _dropdownvalue, onChanged: dropdownCallback),
                   */
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 153, 153, 153),
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: .0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Color.fromARGB(255, 255, 255, 255),
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                      /*   border: Border.all(color: TColors.primary) */
                    ),
                    child: DropdownMenu(
                      width: 353.65,
                      menuHeight: 250,
                      textStyle: TextStyle(
                        color: TColors.primary,
                        fontFamily: "poppins",
                      ),

                      /*  helperText: "you dont need to chose the exact region", */
                      enableSearch: true,
                      enableFilter: true,
                      onSelected: (e) => {selectedItem = e ?? ""},
                      dropdownMenuEntries: dropdownItems
                          .map((e) => DropdownMenuEntry<String>(
                                value: e,
                                label: e,
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtsections),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => question1()));
                      },
                      style: buttonanContinueSecondary,
                      child: const Text(
                        TText.Continue,
                        style: TextStyle(color: TColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void dropdownCallback(String? selectedValue) {
  if (selectedValue is String) {
    /*  setState(() {
      _dropdownvalue = selectedValue;
    }); */
  }
}
