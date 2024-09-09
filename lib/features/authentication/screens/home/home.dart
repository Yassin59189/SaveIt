import 'package:carousel_slider/carousel_slider.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/common/widgets/loaders/shimmer.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/data/repositories/savings_repository.dart';
import 'package:saveit/data/repositories/transaction_repository.dart';
import 'package:saveit/features/authentication/controllers/user/transaction_controller.dart';
import 'package:saveit/features/authentication/controllers/user/user_controller.dart';
import 'package:saveit/features/authentication/screens/New_Transaction/new_transaction.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/notification_bottom_sheet/notification_bottom_sheet.dart';
import 'package:saveit/features/authentication/screens/home/savings_carousel.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/features/models/savings_model.dart';
import 'package:saveit/features/models/transaction_model.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<SavingGoal>> _savingsGoalsFuture;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _savingsGoalsFuture = fetchSavingGoals(user.uid);
    } else {
      _savingsGoalsFuture = Future.error('User not logged in');
    }
  }

  void _showAddGoalDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final titleController = TextEditingController();
        final progressController = TextEditingController();
        final goalPriceController = TextEditingController();

        return AlertDialog(
          title: Text('Add New Saving Goal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: progressController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Current Progress'),
              ),
              TextField(
                controller: goalPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Goal Price'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final title = titleController.text;
                final progress = double.tryParse(progressController.text) ?? 0;
                final goalPrice =
                    double.tryParse(goalPriceController.text) ?? 0;

                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  await addSavingGoal(
                      user.uid,
                      SavingGoal(
                        title: title,
                        progress: progress,
                        goalPrice: goalPrice,
                      ));
                  setState(() {
                    _savingsGoalsFuture = fetchSavingGoals(user.uid);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final TransactionController transactionController =
        Get.put(TransactionController());

    Future NotificationBottomSheet(BuildContext context) {
      return showModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
                height: 500,
                child: test(),
              ));
    }

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

    // Controllers for the input fields in the popup
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _amountController = TextEditingController();

    return Scaffold(
      endDrawer: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Colors.white, // Set background color here
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
                                  scale: 0.8,
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
                                  offset: Offset(-screenWidth * 0.09, 0),
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
                              itemCount: 4,
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
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  //History content
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        TransactionModel transaction = allTransactions[index];
                        return HistoryContent(
                          title: transaction.category,
                          amount: CurrencyFormatter.format(
                              transaction.amount, DinarSettings),
                          type: transaction.isExpense ? "expense" : "income",
                          date: transaction.date,
                        );
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FutureBuilder<List<SavingGoal>>(
                      future: _savingsGoalsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No savings goals found.'));
                        } else {
                          final savingsGoals = snapshot.data!;
                          return SavingsCarousel(savingsGoals: savingsGoals);
                        }
                      },
                    ),
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
  final String title; // Title of the savings goal (e.g., "Travel")
  final int amountSaved; // Current amount saved towards the goal
  final int goalAmount; // Total goal amount for this savings goal

  SavingCard({
    required this.title,
    required this.amountSaved,
    required this.goalAmount,
  });

  @override
  Widget build(BuildContext context) {
    double progress = amountSaved / goalAmount; // Calculate progress percentage

    return Container(
      width: 200, // Width of the card
      decoration: BoxDecoration(
        color: Colors.white, // Card background color
        borderRadius: BorderRadius.circular(16), // Rounded corners for the card
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Soft shadow for depth
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow offset
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row containing the title and an icon for the savings goal
            Row(
              children: [
                Icon(
                  Icons.flight_takeoff, // Example icon (can be customized)
                  color: Colors.orange, // Icon color
                ),
                SizedBox(width: 8), // Space between icon and text
                Text(
                  title, // Display the savings goal title
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Space between title and progress bar
            // Progress bar indicating the percentage of the goal saved
            LinearProgressIndicator(
              value: progress, // Value of progress bar (0 to 1)
              backgroundColor:
                  Colors.grey[300], // Background color of progress bar
              valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.blue), // Progress color
            ),
            SizedBox(height: 10), // Space between progress bar and amounts
            // Row showing the current saved amount and goal amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Current saved amount
                Text(
                  '${amountSaved}DT', // Display the amount saved
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Goal amount
                Text(
                  '${goalAmount}DT', // Display the goal amount
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
