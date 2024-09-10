import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/common/widgets/loaders/shimmer.dart';
import 'package:saveit/features/authentication/controllers/user/transaction_controller.dart';
import 'package:saveit/features/authentication/controllers/user/user_controller.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/notification_bottom_sheet/notification_bottom_sheet.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/features/authentication/screens/questions/priorities.dart';
import 'package:saveit/features/models/transaction_model.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Map<String, dynamic>> VideoList = [
  {
    "title": "Saving and Investing",
    "time": "2h,30mins",
    "numberLesson": "6 Lessons",
    "tier": "free",
    "thumbnail": "assets/images/home/vid1.png",
    "profile": "assets/images/home/vid1Maker.jpg",
    "Name": "Jhon",
    "Exprence": "Financial Expert",
  },
  {
    "title": "Money Mangment",
    "time": "1h,30mins",
    "numberLesson": "3 Lessons",
    "tier": "free",
    "thumbnail": "assets/images/home/vid2.png",
    "profile": "assets/images/home/vid2Maker.jpg",
    "Name": "Mohamed ben Romdan",
    "Exprence": "Accountant",
  },
  {
    "title": "Debt Mangment",
    "time": "3h,30mins",
    "numberLesson": "9 Lessons",
    "tier": "Premuim",
    "thumbnail": "assets/images/home/vid3.png",
    "profile": "assets/images/home/vid3Maker.jpg",
    "Name": "Rania ben Amor",
    "Exprence": "Financial Analyst and teacher ",
  }
];

String selectedButton = "All";

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    void myStateSetter() {
      setState(() {});
    }

    final controller = Get.put(UserController());
    final TransactionController transactionController =
        Get.put(TransactionController());

    List<Map<String, dynamic>> categorList = [
      {
        "GoalTitle": "test",
        "SavedAmount": 0,
        "Amount": 500,
        "Icon": Iconsax.activity
      },
      {
        "GoalTitle": "test",
        "SavedAmount": 0,
        "Amount": 500,
        "Icon": Iconsax.activity
      }
    ];

    Future NotificationBottomSheet(BuildContext context) {
      return showModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
                height: 700,
                child: test(),
              ));
    }

/*     void addCategory(String newCategoryName) {
      setState(() {
        categorList.add({
          'name': newCategoryName,
          'icon': Iconsax.empty_wallet,
          'onPressed': () {},
        });
      });
    } */ //hethi list t3 items li fi wst gategory

    CurrencyFormat DinarSettings = CurrencyFormat(
      code: 'dt',
      symbol: 'DT',
      symbolSide: SymbolSide.right,
      thousandSeparator: '.',
      decimalSeparator: ',',
      symbolSeparator: ' ',
    );
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM d, yyyy').format(now);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<TransactionModel> allTransactions = transactionController.transactions;

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();

    return Scaffold(
      endDrawer: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: TColors.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/images/home/logo1.png")),
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  "wallet",
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Get.to(Wallet());
                },
              ),
              ListTile(
                title: const Text(
                  "coupon",
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Get.to(const claimcode());
                },
              ),
              ListTile(
                title: const Text(
                  "settings",
                  textAlign: TextAlign.center,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: TColors.primary,
              child: Column(
                children: [
                  SAppBar(
                    title: const Column(
                      children: [
                        SizedBox(
                            width: 70,
                            child: Image(
                                image: AssetImage(
                                    "assets/images/home/logo1.png"))),
                      ],
                    ),
                    actions: [
                      Builder(builder: (context) {
                        return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: const Icon(
                              Iconsax.menu_14,
                              color: Colors.white,
                            ));
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Balance
                      Container(
                        width: screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Current Balance",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: TColors.accent),
                              textAlign: TextAlign.center,
                            ),
                            Obx(
                              () => Text(
                                CurrencyFormatter.format(
                                    controller.user.value.budget,
                                    DinarSettings),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: TColors.white.withOpacity(1)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600,
                                  color: TColors.white.withOpacity(0.8)),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 70,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),

            //Notification
            Transform.translate(
              offset: const Offset(0.0, -65.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(85, 36, 36, 36),
                                  blurRadius: 5,
                                  spreadRadius: 0.5,
                                  offset: Offset(0, 1), // Shadow position
                                ),
                              ],
                              color: TColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: screenWidth - 35,
                          height: screenHeight * 0.13,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale: 0.6,
                                  child: const CircleAvatar(
                                    radius: 40,
                                    backgroundColor: TColors.primary,
                                    child: Icon(
                                      Icons.person,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(-screenWidth * 0.1, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Hello!",
                                        style: TextStyle(
                                            color: TColors.secondary,
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Obx(() {
                                        if (controller.profileLoading.value) {
                                          return ShimmerEffect(
                                              width: 80, height: 15);
                                        } else {
                                          return Text(
                                            controller.user.value.fullName,
                                            style: const TextStyle(
                                                color: TColors.secondary,
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          );
                                        }
                                      }),
                                    ],
                                  ),
                                ),
                                //Notification button
                                IconButton(
                                    onPressed: () {
                                      NotificationBottomSheet(context);
                                    },
                                    icon: const Icon(
                                      Iconsax.notification5,
                                      color: TColors.secondary,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //History
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/home/bg.png"),
                            fit: BoxFit.cover)),
                    width: MediaQuery.of(context).size.width - 35,
                    child: Container(
                      decoration: BoxDecoration(
                          color: TColors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              blurRadius: 3,
                              spreadRadius: 0,
                              offset: Offset(
                                0,
                                1,
                              ),
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                              blurRadius: 2,
                              spreadRadius: 0,
                              offset: Offset(
                                0,
                                1,
                              ),
                            ),
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "History",
                                  style: TextStyle(
                                      color: TColors.primary,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Your onPressed function here
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "See all",
                                        style: TextStyle(
                                          color: TColors.primary,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                          width:
                                              3), // Space between the text and the icon
                                      Transform.scale(
                                        scale: 0.8,
                                        child: const Icon(
                                          Iconsax.arrow_right_1,
                                          color: TColors.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 200, // Set a fixed height here
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                TransactionModel transaction =
                                    allTransactions[index];
                                return HistoryContent(
                                  title: transaction.category,
                                  amount: CurrencyFormatter.format(
                                      transaction.amount, DinarSettings),
                                  type: transaction.isExpense
                                      ? "expense"
                                      : "income",
                                  date: transaction.date,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: HistoryContent(
                                type: "income", //inome or expense
                                amount: CurrencyFormatter.format(
                                    10000, //hott el amount fi blast el 1000
                                    DinarSettings),
                                title: "Lorem IpsumT",
                                date: DateTime.now().subtract(Duration(
                                    days:
                                        2)), //hot el date fi blast "DateTime.now().subtract(Duration(days: 2)),"
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: HistoryContent(
                                type: "income", //inome or expense
                                amount: CurrencyFormatter.format(
                                    10000, //hott el amount fi blast el 1000
                                    DinarSettings),
                                title: "Lorem IpsumT",
                                date: DateTime.now().subtract(Duration(
                                    days:
                                        2)), //hot el date fi blast "DateTime.now().subtract(Duration(days: 2)),"
                              )),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: HistoryContent(
                                type: "income", //inome or expense
                                amount: CurrencyFormatter.format(
                                    10000, //hott el amount fi blast el 1000
                                    DinarSettings),
                                title: "Lorem IpsumT",
                                date: DateTime.now().subtract(Duration(
                                    days:
                                        2)), //hot el date fi blast "DateTime.now().subtract(Duration(days: 2)),"
                              )),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  //History content
                  SizedBox(
                    height: 20,
                  ),
                  //Videos start
                  Container(
                    width: MediaQuery.of(context).size.width - 35,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 35,
                          child: Text(
                            "Upcoming courses ",
                            style: TextStyle(
                                color: TColors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width - 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Set the radius here
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      selectedButton == "All"
                                          ? TColors.accent
                                          : TColors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedButton = "All";
                                      // Set the selected button
                                    });
                                  },
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: selectedButton == "All"
                                            ? TColors.white
                                            : Colors.grey.shade500),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Set the radius here
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      selectedButton == "Debt"
                                          ? TColors.accent
                                          : TColors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedButton = "Debt";
                                      // Set the selected button
                                    });
                                  },
                                  child: Text(
                                    "Debt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: selectedButton == "Debt"
                                            ? TColors.white
                                            : Colors.grey.shade500),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Set the radius here
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      selectedButton == "Savings"
                                          ? TColors.accent
                                          : TColors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedButton = "Savings";
                                      // Set the selected button
                                    });
                                  },
                                  child: Text(
                                    "Savings",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: selectedButton == "Savings"
                                            ? TColors.white
                                            : Colors.grey.shade500),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8), // Set the radius here
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      selectedButton == "Budget"
                                          ? TColors.accent
                                          : TColors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedButton = "Budget";
                                      // Set the selected button
                                    });
                                  },
                                  child: Text(
                                    "Budget",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: selectedButton == "Budget"
                                            ? TColors.white
                                            : Colors.grey.shade500),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              height: 300,
                              enlargeCenterPage: true,
                              autoPlay: false,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 500),
                              autoPlayCurve: Curves.easeInSine,
                              viewportFraction: 0.64,
                            ),
                            items: VideoList.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Transform.translate(
                                    offset: Offset(-60, 0),
                                    child: Transform.scale(
                                      scale: 0.96,
                                      child: Container(
                                        width: screenWidth * 0.6,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    9, 30, 66, 0.25),
                                                blurRadius: 8,
                                                spreadRadius: -2,
                                                offset: Offset(
                                                  0,
                                                  4,
                                                ),
                                              ),
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    9, 30, 66, 0.08),
                                                blurRadius: 0,
                                                spreadRadius: 1,
                                                offset: Offset(
                                                  0,
                                                  0,
                                                ),
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            image: DecorationImage(
                                              image: AssetImage(i["thumbnail"]),
                                              fit: BoxFit.cover,
                                            )),
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: screenWidth * 0.4,
                                                child: Text(
                                                  i["title"],
                                                  style: TextStyle(
                                                      color: TColors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 22),
                                                ),
                                              ),
                                              Container(
                                                width: screenWidth * 0.4,
                                                child: Row(
                                                  children: [
                                                    Transform.scale(
                                                      scale: 0.6,
                                                      child: Icon(
                                                        Iconsax.timer_1,
                                                        color: Colors
                                                            .grey.shade500,
                                                      ),
                                                    ),
                                                    Text(
                                                      i["time"],
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade500,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                width: screenWidth * 0.4,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(2.5),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              TColors.secondary,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        i["numberLesson"],
                                                        style: TextStyle(
                                                            color:
                                                                TColors.white,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(2.5),
                                                      decoration: BoxDecoration(
                                                          color: i["tier"] ==
                                                                  "free"
                                                              ? TColors
                                                                  .secondary
                                                              : TColors.accent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Text(
                                                        i["tier"],
                                                        style: TextStyle(
                                                            color:
                                                                TColors.white,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors
                                                                .grey.shade500
                                                                .withOpacity(
                                                                    0.3),
                                                            spreadRadius: 1,
                                                            blurRadius: 5,
                                                            offset:
                                                                const Offset(
                                                                    0, 0),
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(360),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              i["profile"]),
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        i["Name"],
                                                        style: TextStyle(
                                                            color:
                                                                TColors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        i["Exprence"],
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey.shade400,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 10),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  )
                  //videos End
                ],
              ),
            ),

            Container(
              width: screenWidth - 35,
              decoration: BoxDecoration(
                  color: TColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 3,
                      spreadRadius: 0,
                      offset: Offset(
                        0,
                        1,
                      ),
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 2,
                      spreadRadius: 0,
                      offset: Offset(
                        0,
                        1,
                      ),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Savings',
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: TColors.primary),
                        ),
                        IconButton(
                            onPressed: () {
                              _showAddCategoryDialog(
                                  context, categorList, myStateSetter);
                              print(categorList);
                            },
                            icon: Icon(Icons.add_circle_outline),
                            iconSize: 32,
                            color: TColors.accent),
                      ],
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 150,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                    ),
                    items: categorList.map((category) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SavingCard(
                          title: category['GoalTitle'],
                          amountSaved: category['SavedAmount'],
                          goalAmount: category['Amount'],
                          icon: category['Icon'],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SavingCard extends StatelessWidget {
  final String title;
  final int amountSaved;
  final int goalAmount;
  final IconData icon;

  SavingCard(
      {required this.title,
      required this.amountSaved,
      required this.goalAmount,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    double progress = amountSaved / goalAmount;
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(icon),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${amountSaved}DT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${goalAmount}DT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryContent extends StatefulWidget {
  String title;
  String amount;
  String type;
  DateTime date;
  HistoryContent({
    required this.title,
    required this.amount,
    required this.type,
    required this.date,
    super.key,
  });
  @override
  State<HistoryContent> createState() => _HistoryContentState();
}

class _HistoryContentState extends State<HistoryContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                child: Transform.scale(
                  scale: 1.5,
                  child: Icon(
                      widget.type == "expense"
                          ? Iconsax.empty_wallet5
                          : Iconsax.empty_wallet_add5,
                      color: TColors.accent,
                      size: 20),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    timeago.format(widget.date),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF999999)),
                  )
                ],
              )
            ],
          ),
          Text(
              widget.type == "income"
                  ? "+" + widget.amount
                  : "-" + widget.amount,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF999999)))
        ],
      ),
    );
  }
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
                                  'SavedAmount': 0,
                                  'Amount': categoryAmount,
                                  'Icon': dropdownValue,
                                });
                                print("dsqjsjfkdsjfdskfjsdkfjdskjfksdjfds");
                                print(categorList);
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
