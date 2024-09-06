// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Ensure you have this package for icons.

import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class Priorities extends StatefulWidget {
  const Priorities({super.key});

  @override
  State<Priorities> createState() => _PrioritiesState();
}

final List<Map<String, dynamic>> categorList = [
  {
    'name': 'helloSSS',
    'icon': Iconsax.empty_wallet,
  },
  {
    'name': 'hello',
    'icon': Iconsax.empty_wallet,
  },
  {
    'name': 'hello',
    'icon': Iconsax.empty_wallet,
  },
  {
    'name': 'hello',
    'icon': Iconsax.empty_wallet,
  },
];

class _PrioritiesState extends State<Priorities> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "To provide you with accurate financial insights",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontFamily: "popins",
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: screenWidth * 0.8,
                  child: Text(
                    " let's organize your income and expenses into simple categories.",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontFamily: "popins",
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(203.34, 53.26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    _showAddCategoryDialog(context);
                  },
                  child: Text(
                    "Add a category",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    )));
  }

  void _showAddCategoryDialog(BuildContext context) {
    // Function to display the Add Category popupvoid _showAddCategoryDialog(BuildContext context) {
    String? categoryName;
    double? categoryAmount;
    String? selectedIcon;
    String dropdownValue = 'house5'; // Use non-nullable string here
    String pritorityValue = 'Primary'; // Use non-nullable string here

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: screenWidth * 0.9, // 90% of screen width
                height: screenHeight * 0.7, // 50% of screen height
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Add a New Category",
                      style: TextStyle(
                        color: TColors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Category Name",
                          style: TextStyle(
                            color: TColors.primary,
                            fontSize: 12.5,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: TColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: TColors.secondary.withOpacity(0.4),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: Offset(0, 1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: screenWidth * 0.9,
                          child: TextField(
                            maxLines: 1,
                            minLines: 1,
                            style: TextStyle(
                                color: TColors.primary, fontSize: 13.5),
                            keyboardType: TextInputType.text,
                            cursorColor: TColors.secondary,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 12.0),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintText: 'Enter Name of the category',
                              hintStyle: TextStyle(
                                color: TColors.primary.withOpacity(0.3),
                                fontSize: 13.5,
                              ),
                            ),
                            onChanged: (value) {
                              categoryName = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Category Amount",
                          style: TextStyle(
                            color: TColors.primary,
                            fontSize: 12.5,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: TColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: TColors.secondary.withOpacity(0.4),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: Offset(0, 1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: screenWidth * 0.9,
                          child: TextField(
                            maxLines: 1,
                            minLines: 1,
                            style: TextStyle(
                                color: TColors.primary, fontSize: 13.5),
                            keyboardType: TextInputType.number,
                            cursorColor: TColors.secondary,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 12.0),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintText: 'Enter Amount',
                              hintStyle: TextStyle(
                                color: TColors.primary.withOpacity(0.3),
                                fontSize: 13.5,
                              ),
                            ),
                            onChanged: (value) {
                              categoryAmount = double.tryParse(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose one of these icons ",
                          style: TextStyle(
                            color: TColors.primary,
                            fontSize: 12.5,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: screenWidth * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: TColors.white,
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: Transform.scale(
                                  scale: 0.6,
                                  child: const Icon(
                                    Icons.arrow_drop_down,
                                    color: TColors.primary,
                                  ),
                                ),
                                style: const TextStyle(
                                  color: TColors.primary,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: 'house5',
                                    child: Row(
                                      children: [
                                        Icon(
                                          Iconsax.house5,
                                          color: TColors.primary,
                                        ),
                                        SizedBox(width: 10),
                                        Text("House"),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'airplane5',
                                    child: Row(
                                      children: [
                                        Icon(
                                          Iconsax.airplane5,
                                          color: TColors.primary,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Traveling"),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'car5',
                                    child: Row(
                                      children: [
                                        Icon(
                                          Iconsax.car5,
                                          color: TColors.primary,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Car"),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'cake5',
                                    child: Row(
                                      children: [
                                        Icon(
                                          Iconsax.cake5,
                                          color: TColors.primary,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Food"),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'music5',
                                    child: Row(
                                      children: [
                                        Icon(
                                          Iconsax.music5,
                                          color: TColors.primary,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Music"),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'shopping5',
                                    child: Row(
                                      children: [
                                        Icon(
                                          Iconsax.shopping_cart5,
                                          color: TColors.primary,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Shopping"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "what's the priority of this category ? ",
                          style: TextStyle(
                            color: TColors.primary,
                            fontSize: 12.5,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          width: screenWidth * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: TColors.white,
                              ),
                              child: DropdownButton<String>(
                                value: pritorityValue,
                                icon: Transform.scale(
                                  scale: 0.6,
                                  child: const Icon(
                                    Icons.arrow_drop_down,
                                    color: TColors.primary,
                                  ),
                                ),
                                style: const TextStyle(
                                  color: TColors.primary,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    pritorityValue = newValue!;
                                  });
                                },
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: 'Primary',
                                    child: Text("Primary"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Secondary',
                                    child: Text("Secondary"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          child: Text("Save"),
                          onPressed: () {
                            if (categoryName != null &&
                                categoryAmount != null &&
                                dropdownValue != null) {
                              // Handle saving the new category with the selected values
                              print(
                                  "Category: $categoryName, Amount: $categoryAmount, Icon: $selectedIcon");
                              Navigator.of(context).pop();
                            } else {
                              // You can show an error message or validation here
                              print("Please fill in all fields.");
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
