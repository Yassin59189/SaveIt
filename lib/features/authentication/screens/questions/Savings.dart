// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Ensure you have this package for icons.

import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:currency_formatter/currency_formatter.dart';

class Savings extends StatefulWidget {
  const Savings({super.key});

  @override
  State<Savings> createState() => _SavingsState();
}

CurrencyFormat DinarSettings = CurrencyFormat(
  code: 'dt',
  symbol: 'DT',
  symbolSide: SymbolSide.right,
  thousandSeparator: '.',
  decimalSeparator: ',',
  symbolSeparator: ' ',
);
bool SwitchPrimary = true;
final List<Map<String, dynamic>> categorList = [];

class _SavingsState extends State<Savings> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    void myStateSetter() {
      setState(() {});
    }

    return Scaffold(
        floatingActionButton: ClipRRect(
          borderRadius:
              BorderRadius.circular(90.0), // Adjust the radius as needed
          child: SwitchPrimary
              ? FloatingActionButton(
                  onPressed: () => _showAddCategoryDialog(
                    context,
                    categorList,
                    myStateSetter,
                  ),
                  backgroundColor: TColors.accent,
                  child: Icon(Iconsax.add, color: TColors.white),
                )
              : Container(),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Container(
                width: screenWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Do you want us to track your financial goals?",
                      style: TextStyle(
                        color: TColors.primary,
                        fontSize: 14.5,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: screenWidth * 0.90,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(),
                      child: AnimatedToggleSwitch<bool>.size(
                          current: SwitchPrimary,
                          values: const [true, false],
                          indicatorSize: Size.fromWidth(200),
                          customIconBuilder: (context, local, global) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Text(local.value ? "Yes" : "No",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color.lerp(
                                              TColors.primary,
                                              TColors.white,
                                              local.animationValue),
                                        ),
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                          borderWidth: 5.0,
                          iconAnimationType: AnimationType.onHover,
                          style: ToggleStyle(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: Offset(
                                  0,
                                  1,
                                ),
                              )
                            ],
                            indicatorColor: TColors.secondary,
                            backgroundColor: Colors.white,
                            borderColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          selectedIconScale: 1.0,
                          onChanged: (value) {
                            setState(() {
                              SwitchPrimary = value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            categorList.length == 0 && SwitchPrimary
                ? Transform.scale(
                    scale: 1,
                    child: Center(
                      child: Container(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenWidth * 0.9,
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: screenWidth * 0.5,
                                            child: Text(
                                              "To Set and Achieve Your Financial Goals",
                                              style: TextStyle(
                                                  color: TColors.primary,
                                                  fontSize: 22,
                                                  fontFamily: "popins",
                                                  fontWeight: FontWeight.w900),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            width: screenWidth * 0.5,
                                            child: Text(
                                              "Set your financial goals with actionable steps and track progress through clear milestones",
                                              style: TextStyle(
                                                  color: TColors.primary,
                                                  fontSize: 16,
                                                  fontFamily: "popins",
                                                  fontWeight: FontWeight.w400),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            width: screenWidth * 0.4,
                                            child: Text(
                                              "click the plus button to set up a new Goal.",
                                              style: TextStyle(
                                                  color: TColors.accent,
                                                  fontSize: 12,
                                                  fontFamily: "popins",
                                                  fontWeight: FontWeight.w900),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Image(
                                            width: screenWidth * 0.4,
                                            image: AssetImage(
                                                "assets/images/on_board_images/tip2.png")),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : SwitchPrimary
                    ? Column(
                        children: [
                          Text(
                            "Your Savings Goals",
                            style: TextStyle(
                              color: TColors.primary,
                              fontSize: 15,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Center(
                                child: Container(
                                  width: screenWidth * 0.9,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.16),
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                        offset: Offset(
                                          0,
                                          1,
                                        ),
                                      )
                                    ],
                                    color: TColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: screenWidth * 0.15,
                                            child: Text(
                                              "Type",
                                              style: TextStyle(
                                                  color: TColors.primary,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(
                                              width:
                                                  8), // Adding some space between elements
                                          Container(
                                            width: screenWidth * 0.25,
                                            child: Text(
                                              "Goal Title",
                                              style: TextStyle(
                                                  color: TColors.primary,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Container(
                                            width: screenWidth * 0.25,
                                            child: Text(
                                              "Goal Price",
                                              style: TextStyle(
                                                  color: TColors.primary,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700),
                                              textAlign: TextAlign.center,
                                            ),
                                          ), // Convert the amount to String if it's a number
                                          SizedBox(width: 8),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ...categorList.map((category) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Center(
                                  child: Container(
                                    width: screenWidth * 0.9,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.16),
                                          blurRadius: 4,
                                          spreadRadius: 0,
                                          offset: Offset(
                                            0,
                                            1,
                                          ),
                                        )
                                      ],
                                      color: TColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: screenWidth * 0.15,
                                              child: Icon(
                                                category['Icon'],
                                                color: TColors.accent,
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    8), // Adding some space between elements
                                            Container(
                                              width: screenWidth * 0.25,
                                              child: Text(
                                                category['GoalTitle'],
                                                style: TextStyle(
                                                    color: TColors.primary,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Container(
                                              width: screenWidth * 0.25,
                                              child: Text(
                                                CurrencyFormatter.format(
                                                    category['Amount']
                                                        .toDouble(), //hott el amount fi blast el 1000
                                                    DinarSettings),
                                                style: TextStyle(
                                                    color: TColors.primary,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ), // Convert the amount to String if it's a number
                                            SizedBox(width: 8),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList()
                        ],
                      )
                    : Container()
          ]),
        ));
  }

  void _showAddCategoryDialog(
      BuildContext context, categorList, Function myStateSetter) {
    // Function to display the Add Category popupvoid _showAddCategoryDialog(BuildContext context) {
    String? categoryName;
    double? categoryAmount;
    IconData dropdownValue = Iconsax.house5; // Use non-nullable string here

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
              child: SingleChildScrollView(
                child: Container(
                  width: screenWidth * 0.9, // 90% of screen width
                  height: screenHeight * 0.6, // 50% of screen height
                  padding: EdgeInsets.all(25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Add a Saving Goal",
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
                            "Goal Title",
                            style: TextStyle(
                              color: TColors.primary,
                              fontSize: 12.5,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              color: TColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: TColors.secondary.withOpacity(0.2),
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
                            "Goal Amount",
                            style: TextStyle(
                              color: TColors.primary,
                              fontSize: 12.5,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              color: TColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: TColors.secondary.withOpacity(0.2),
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
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            width: screenWidth * 0.9,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: TColors.white,
                                ),
                                child: DropdownButton<IconData>(
                                  value: dropdownValue,
                                  icon: Transform.scale(
                                    scale: 0.6,
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: TColors.primary,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: TColors.primary,
                                  ),
                                  onChanged: (IconData? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem<IconData>(
                                      value: Iconsax.house5,
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
                                    DropdownMenuItem<IconData>(
                                      value: Iconsax.airplane5,
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
                                    DropdownMenuItem<IconData>(
                                      value: Iconsax.car5,
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
                                    DropdownMenuItem<IconData>(
                                      value: Iconsax.cake5,
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
                                    DropdownMenuItem<IconData>(
                                      value: Iconsax.music5,
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
                                    DropdownMenuItem<IconData>(
                                      value: Iconsax.shopping_cart5,
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
                                  SwitchPrimary != null &&
                                  dropdownValue != null) {
                                setState(() {
                                  categorList.add({
                                    'GoalTitle': categoryName,
                                    'Amount': categoryAmount,
                                    'Icon': dropdownValue,
                                  });
                                });
                                myStateSetter();
                                // Handle saving the new category with the selected values
                                print(
                                    "Category: $categoryName, Amount: $categoryAmount, Icon: $dropdownValue");
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
              ),
            );
          },
        );
      },
    );
  }
}
