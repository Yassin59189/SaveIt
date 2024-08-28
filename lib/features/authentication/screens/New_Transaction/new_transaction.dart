import 'dart:ffi' as ffi;
import 'dart:ui';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransaction();
}

class _NewTransaction extends State<NewTransaction> {
  bool switchExpenseIncom = false;
  String? errorText;

  bool ExpenseButtonState = true;
  CurrencyFormat DinarSettings = CurrencyFormat(
    code: 'dt',
    symbol: 'DT',
    symbolSide: SymbolSide.right,
    thousandSeparator: '.',
    decimalSeparator: ',',
    symbolSeparator: ' ',
  );
  bool isReapting = false;

  int amount = 0;
  bool IncomButtonState = false;
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
  DateTime? _selectedDate;
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Handle the data submission to the backend here
      print(
          "Amount: $amount, Category: $category, Date: $_selectedDate, Repeating: $isReapting,income_Expense: $switchExpenseIncom"); //False=Income True=Expense
    }
  }

  void addCategory(String newCategoryName) {
    setState(() {
      categorList.add({
        'name': newCategoryName,
        'icon': Iconsax.empty_wallet,
        'onPressed': () {},
      });
    });
  } //hethi list t3 items li fi wst gategory

  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String category = "Choose";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            height: screenHeight,
            decoration: const BoxDecoration(color: TColors.primary),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Center(
                  child: Text(
                    "New Transaction",
                    style: TextStyle(
                        color: TColors.white,
                        fontSize: TSizes.lg,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 8, right: 8, bottom: 20),
                    child: Container(
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: TColors.white,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/home/bg_newTransaction.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            //=========================Expense or Income=============================
                            Container(
                              width: screenWidth * 0.55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: TColors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0.5,
                                      blurRadius: 15),
                                ],
                              ),
                              child: Container(
                                child: AnimatedToggleSwitch<bool>.size(
                                    current: switchExpenseIncom,
                                    values: const [true, false],
                                    indicatorSize: Size.fromWidth(100),
                                    customIconBuilder: (context, local,
                                            global) =>
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 9.0),
                                          child: Row(
                                            children: [
                                              Transform.scale(
                                                scale: 0.6,
                                                child: Icon(
                                                    color: Color.lerp(
                                                        TColors.primary,
                                                        TColors.white,
                                                        local.animationValue),
                                                    local.value
                                                        ? Icons
                                                            .shopping_cart_rounded
                                                        : Iconsax
                                                            .empty_wallet_add5),
                                              ),
                                              Text(
                                                local.value
                                                    ? "Expense"
                                                    : "Income",
                                                style: TextStyle(
                                                    color: Color.lerp(
                                                        TColors.primary,
                                                        TColors.white,
                                                        local.animationValue)),
                                              ),
                                            ],
                                          ),
                                        ),
                                    borderWidth: 5.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      indicatorColor: TColors.secondary,
                                      backgroundColor: TColors.white,
                                      borderColor: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    selectedIconScale: 1.0,
                                    onChanged: (value) {
                                      setState(() {
                                        switchExpenseIncom = value;
                                      });
                                    }),
                              ),
                            ),
                            //=========================Expense or Income Done=============================

                            const SizedBox(
                              height: 20,
                            ),
                            //=========================Amount title=============================
                            Text(
                                CurrencyFormatter.format(amount,
                                    DinarSettings), //<---- lhne zid balance
                                style: TextStyle(
                                    color: TColors.primary,
                                    fontSize: TSizes.fontLg,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center),
                            //=========================Amount title Done=============================
                            const SizedBox(
                              height: 20,
                            ),
                            //=========================Amount Contaier=============================
                            Container(
                                width: screenWidth * 0.8,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: const Color.fromARGB(
                                              54, 0, 6, 61))),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Amount",
                                        style: TextStyle(
                                            color: TColors.primary,
                                            fontSize: TSizes.fontMd,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      //=========================Amount Form =============================

                                      Form(
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          onChanged: () =>
                                              Form.of(primaryFocus!.context!)
                                                  .save(),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                  width: 120,
                                                  child: TextFormField(
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(
                                                      decimal: true,
                                                      signed: false,
                                                    ),
                                                    decoration: InputDecoration(
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                      ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.red),
                                                      ),
                                                      hintText: 'Enter Amount',
                                                      errorText: errorText,
                                                      fillColor:
                                                          Colors.grey.shade500,
                                                      hintStyle: TextStyle(
                                                          color: Colors
                                                              .grey.shade500),
                                                    ),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        if (value.isEmpty ||
                                                            int.tryParse(
                                                                    value) !=
                                                                null) {
                                                          errorText =
                                                              null; // No error
                                                        } else {
                                                          errorText =
                                                              ' enter a valid number';
                                                        }
                                                      });
                                                    },
                                                    onSaved: (value) {
                                                      if (value != null &&
                                                          int.tryParse(value) !=
                                                              null) {
                                                        setState(() {
                                                          int parsedAmount =
                                                              int.parse(value);
                                                          amount = parsedAmount;
                                                          errorText =
                                                              null; // Clear error on valid input
                                                        });
                                                      } else {
                                                        setState(() {
                                                          errorText =
                                                              'enter a valid number'; // Set error on invalid input
                                                        });
                                                      }
                                                    },
                                                  ))
                                            ],
                                          )),
                                    ])),
                            //=========================Amount Container Done =============================

                            SizedBox(
                              height: 20,
                            ),
                            //========================= Categorie Container=============================

                            Container(
                                width: screenWidth * 0.8,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: const Color.fromARGB(
                                              54, 0, 6, 61))),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Category",
                                        style: TextStyle(
                                            color: TColors.primary,
                                            fontSize: TSizes.fontMd,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      //========================= Categorie TextButton =============================
                                      TextButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                //hetha yhel tab li mlouta
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return CategoryBottomSheet(
                                                    list:
                                                        categorList, //lista t3 el catergoies hika decalria el fo9 juste ka test
                                                    category:
                                                        category, //hethi el selected
                                                    oncategorychange:
                                                        (selectedcategory) {
                                                      setState(() {
                                                        category =
                                                            selectedcategory;
                                                      });
                                                    },
                                                    onAddCategory:
                                                        addCategory, //hethi tzidlk category li lista ahyka fonction lfou9
                                                  );
                                                });
                                          },
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  category,
                                                  style: TextStyle(
                                                    color: Colors.grey.shade500,
                                                    fontSize: TSizes.fontMd,
                                                  ),
                                                ),
                                                Transform.scale(
                                                  scale: 0.6,
                                                  child: Icon(
                                                      color:
                                                          Colors.grey.shade500,
                                                      Iconsax.arrow_right_3),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ))
                                    ])),
                            //========================= Categorie Container Done =============================
                            SizedBox(
                              height: 20,
                            ),
                            //========================= Date Container=============================
                            Container(
                                width: screenWidth * 0.8,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: const Color.fromARGB(
                                              54, 0, 6, 61))),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Date",
                                        style: TextStyle(
                                            color: TColors.primary,
                                            fontSize: TSizes.fontMd,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            _selectDate(context);
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                _selectedDate ==
                                                        null //_selectedDate Hwa el date (fromat Date)
                                                    ? 'Enter The Date'
                                                    : '${_selectedDate!.month}-${_selectedDate!.day}-${_selectedDate!.year}',
                                                style: TextStyle(
                                                  color: _selectedDate == null
                                                      ? Colors.grey.shade500
                                                      : TColors.secondary
                                                          .withOpacity(0.6),
                                                  fontSize: TSizes.fontMd,
                                                ),
                                              ),
                                              Transform.scale(
                                                scale: 0.8,
                                                child: Icon(
                                                    color: _selectedDate == null
                                                        ? Colors.grey.shade500
                                                        : TColors.secondary
                                                            .withOpacity(0.6),
                                                    Iconsax.calendar),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ))
                                    ])),
                            //========================= Date  container Done =============================

                            SizedBox(
                              height: 20,
                            ),
                            //========================= Repeating container =============================

                            Container(
                                width: screenWidth * 0.8,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: const Color.fromARGB(
                                              54, 0, 6, 61))),
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Repeating",
                                        style: TextStyle(
                                            color: TColors.primary,
                                            fontSize: TSizes.fontMd,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Transform.scale(
                                            scale: 0.7,
                                            child: Switch(
                                                activeColor: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                activeTrackColor:
                                                    TColors.secondary,
                                                inactiveTrackColor:
                                                    Color.fromRGBO(
                                                        187, 187, 187, 0.718),
                                                inactiveThumbColor:
                                                    TColors.white,
                                                trackOutlineColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                                value: isReapting,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isReapting = value;
                                                  }); //lhne zid fazt el reapting
                                                }),
                                          ),
                                        ],
                                      )
                                    ])),
                            //========================= Repeating container DONE=============================

                            SizedBox(height: screenHeight * 0.1),
                            //========================= Submit container =============================

                            Center(
                              child: ElevatedButton(
                                  style: buttonanContinueSecondary,
                                  onPressed: _submitForm, //submit
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      color: TColors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )),
                            ),
                            SizedBox(height: screenHeight * 0.1),
                          ]),
                        )),
                  ),
                )
              ]),
            )));
  }
}

class CategoryBottomSheet extends StatefulWidget {
  final List list;
  final Function(String) oncategorychange;
  final Function(String) onAddCategory;
  String category;
  CategoryBottomSheet({
    required this.list,
    required this.category,
    required this.oncategorychange,
    required this.onAddCategory,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheet();
}

bool isAdding = false;
String? errorText;

final TextEditingController _controller = TextEditingController();

class _CategoryBottomSheet extends State<CategoryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              constraints: new BoxConstraints(minHeight: 400),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home/bg_newTransaction.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SizedBox(
                child: Column(
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: TColors.primary,
                          fontSize: TSizes.fontLg * 1.5,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ...widget.list.map((i) {
                      return Column(
                        children: [
                          listOfGategorys(
                            text: i['name'],
                            onPressed: () {
                              widget.oncategorychange(i['name']);
                              Navigator.pop(context); // Close the bottom sheet
                            },
                            icon: i['icon'],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }).toList(),
                    if (isAdding)
                      Container(
                        width: MediaQuery.of(context).size.width * 0.86,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                      controller: _controller,
                                      decoration: InputDecoration(
                                        hintText: "New Category",
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        errorText: errorText,
                                      ),
                                      onChanged: (text) {
                                        setState(() {
                                          if (text.length > 20) {
                                            errorText =
                                                'Category name cannot be more than 20 characters';
                                          } else {
                                            errorText = null;
                                          }
                                        });
                                      })),
                              IconButton(
                                icon: Icon(Iconsax.add_circle),
                                onPressed: () {
                                  if (_controller.text.isNotEmpty &&
                                      errorText == null) {
                                    widget.onAddCategory(_controller.text);
                                    setState(() {
                                      isAdding = false;
                                    });
                                    _controller.clear();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      listOfGategorys(
                        text: 'Add',
                        onPressed: () {
                          setState(() {
                            isAdding = true;
                          });
                        },
                        icon: Iconsax.add,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class listOfGategorys extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const listOfGategorys({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });
  @override
  State<listOfGategorys> createState() => _listOfGategorys();
}

class _listOfGategorys extends State<listOfGategorys> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(TColors.secondary.withOpacity(0.2)),
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: widget.onPressed,
          child: Row(
            children: [
              Transform.scale(
                  scale: 0.8, child: Icon(color: TColors.primary, widget.icon)),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.text,
                  style: TextStyle(color: TColors.primary, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
