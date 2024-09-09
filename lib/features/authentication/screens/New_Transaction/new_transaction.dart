import 'dart:ffi' as ffi;
import 'dart:ui';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/data/repositories/category_repository.dart';
import 'package:saveit/features/authentication/controllers/category_controller.dart';
import 'package:saveit/features/authentication/controllers/user/transaction_controller.dart';
import 'package:saveit/features/models/category_model.dart';
import 'package:saveit/features/models/transaction_model.dart';
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
  final transactionController = Get.put(TransactionController());

  final CategoryController categoryController = Get.put(CategoryController());
  List<CategoryModel> _categories = [];
  CategoryModel? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final userId =
        FirebaseAuth.instance.currentUser?.uid; // Replace with actual user ID
    await categoryController.loadCategories(userId!);
    setState(() {
      _categories = categoryController.categories.toList();
    });
  }

  bool switchExpenseIncom = false;
  String? errorText;
  late CategoryModel backCategory;

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
  DateTime _selectedDate = DateTime.now();
  void _submitForm() async {
    final transaction = TransactionModel(
      id: DateTime.now().toString(),
      userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      amount: amount,
      category: backCategory.toString(),
      date: _selectedDate,
      isRepeating: isReapting,
      isExpense: switchExpenseIncom,
    );

    await transactionController.addTransaction(transaction);
    Navigator.pop(context);
  }

/* CATEGORY */

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
    } else {
      _selectedDate = DateTime.now();
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
                                                    /* controller: , */
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
                                                    list: categoryController
                                                        .categories, // Ensure this is List<CategoryModel>
                                                    category:
                                                        _selectedCategory, // Ensure this is of type CategoryModel?
                                                    oncategorychange:
                                                        (selectedCategory) {
                                                      setState(() {
                                                        _selectedCategory =
                                                            selectedCategory;
                                                        backCategory =
                                                            selectedCategory; // Ensure `backCategory` is also of type CategoryModel?
                                                      });
                                                    },
                                                    onAddCategory:
                                                        (newCategory) {
                                                      // Make sure `addCategory` is a function that accepts a CategoryModel
                                                      addCategory(newCategory
                                                          .toString());
                                                    },
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
                                                '${_selectedDate!.month}-${_selectedDate!.day}-${_selectedDate!.year}',
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
  final List<CategoryModel> list;
  final CategoryModel? category;
  final Function(CategoryModel) oncategorychange;
  final Function(CategoryModel) onAddCategory;

  CategoryBottomSheet({
    required this.list,
    this.category,
    required this.oncategorychange,
    required this.onAddCategory,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  bool isAdding = false;
  String? errorText;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: 400),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/home/bg_newTransaction.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      color: TColors.primary,
                      fontSize: TSizes.fontLg * 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...widget.list.map((i) {
                    return Column(
                      children: [
                        ListOfCategories(
                          text: i.name, // Use the name property
                          onPressed: () {
                            widget.oncategorychange(i);
                            Navigator.pop(context); // Close the bottom sheet
                          },
                          icon: i.icon, // Use the icon property
                        ),
                        SizedBox(height: 20),
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
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
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
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
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
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(Iconsax.add_circle),
                              onPressed: () {
                                if (_controller.text.isNotEmpty &&
                                    errorText == null) {
                                  final newCategory = CategoryModel(
                                    id: '', // Generate a new ID or leave empty
                                    name: _controller.text,
                                    priority: false,
                                    icon: Iconsax
                                        .category, // Use a default icon or add a way to choose
                                    amount: 0,
                                  );
                                  widget.onAddCategory(newCategory);
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
                    ListOfCategories(
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
    );
  }
}

class ListOfCategories extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const ListOfCategories({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  State<ListOfCategories> createState() => _ListOfCategoriesState();
}

class _ListOfCategoriesState extends State<ListOfCategories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
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
                scale: 0.8,
                child: Icon(widget.icon,
                    color: TColors.primary), // Use the correct icon
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.text,
                  style: TextStyle(color: TColors.primary, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
