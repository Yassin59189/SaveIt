import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/features/authentication/controllers/user/transaction_controller.dart';
import 'package:saveit/features/authentication/controllers/user/user_controller.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/edit_wallet.dart';
import 'package:saveit/features/models/transaction_model.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:currency_formatter/currency_formatter.dart';
import 'package:timeago/timeago.dart' as timeago;

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

CurrencyFormat DinarSettings = CurrencyFormat(
  code: 'dt',
  symbol: 'DT',
  symbolSide: SymbolSide.right,
  thousandSeparator: '.',
  decimalSeparator: ',',
  symbolSeparator: ' ',
);
String dropdownValue = 'Today';
String filterType = "all";

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final TransactionController transactionController =
        Get.put(TransactionController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    List<TransactionModel> allTransactions = transactionController.transactions;

    double totalExpenseAmount = allTransactions.fold(0, (sum, transaction) {
      if (transaction.isExpense) {
        return sum + transaction.amount;
      }
      return sum;
    });

    double totalIncomeAmount = allTransactions.fold(0, (sum, transaction) {
      if (!transaction.isExpense) {
        return sum + transaction.amount;
      }
      return sum;
    });

    List<TransactionModel> filteredTransactions =
        transactionController.transactions.where((transaction) {
      if (filterType == 'all') {
        return true;
      } else if (filterType == 'income') {
        return !transaction.isExpense;
      } else if (filterType == 'expense') {
        return transaction.isExpense;
      }
      return false;
    }).toList();

    return Scaffold(
      endDrawer: Drawer(
        child: Expanded(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: TColors.primary,
                ),
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/images/home/logo1.png"))
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  "wallet",
                  textAlign: TextAlign.center,
                ),
                onTap: () {},
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
      body: Container(
        color: TColors.primary,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SAppBar(
                    title: TextButton(
                        onPressed: () {
                          Get.to(const EditWallet());
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.white),
                        )),
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
                  const Text(
                    "TOTAL BALANCE",
                    style: TextStyle(
                        color: Color(0xFFA8ADDD),
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Balance
                  Text(
                    CurrencyFormatter.format(
                        controller.user.value
                            .budget, //hott el blance fi blast el number
                        DinarSettings),
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  //stats
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width - 40,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          //head
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: TColors.accent,
                                ),
                                width: 118,
                                height: 37,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: new Theme(
                                    data: Theme.of(context).copyWith(
                                      canvasColor: TColors.secondary,
                                    ),
                                    child: DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: Transform.scale(
                                        scale: 0.6,
                                        child: const Icon(
                                          Iconsax.arrow_down_1,
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                        });
                                      },
                                      items: const [
                                        DropdownMenuItem<String>(
                                          value: 'Today',
                                          child: Text("Today"),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'This week',
                                          child: Text("This week"),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'This month',
                                          child: Text("This mounth"),
                                        ),
                                        DropdownMenuItem<String>(
                                          value: 'This Year',
                                          child: Text("This Year"),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                "01 March - 31 March",
                                style: TextStyle(
                                    color: TColors.accent,
                                    fontFamily: 'Poppins',
                                    fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //stats info
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Income
                              SizedBox(
                                width: screenWidth * 0.36,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/images/home/income.png")),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Income",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: TColors.primary,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          totalIncomeAmount.toString(),
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: TColors.primary,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //Spending
                              SizedBox(
                                width: screenWidth * 0.36,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/images/home/spending.png")),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Expenses",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: TColors.primary,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          totalExpenseAmount.toString(),
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: TColors.primary,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          //button
                          Container(
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 2, color: TColors.secondary))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              //history

              Container(
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/home/bg_newTransaction.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 500,
                child: Column(
                  children: [
                    //Filter
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                filterType = "all";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                    width: 2, color: TColors.secondary),
                                backgroundColor: filterType == 'all'
                                    ? TColors.secondary
                                    : TColors.white),
                            child: Text(
                              "All",
                              style: TextStyle(
                                color: filterType == 'all'
                                    ? TColors.white
                                    : TColors.secondary,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                filterType = "income";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: filterType == 'income'
                                  ? TColors.secondary
                                  : TColors.white,
                              shadowColor: Colors.transparent,
                              side: BorderSide(
                                  width: 2, color: TColors.secondary),
                            ),
                            child: Text(
                              "Income",
                              style: TextStyle(
                                  color: filterType == 'income'
                                      ? TColors.white
                                      : TColors.secondary),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                filterType = "expense";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: filterType == 'expense'
                                    ? TColors.secondary
                                    : Colors.white,
                                shadowColor: Colors.transparent,
                                side: const BorderSide(
                                    width: 2, color: TColors.secondary)),
                            child: Text(
                              "Expense",
                              style: TextStyle(
                                  color: filterType == 'expense'
                                      ? TColors.white
                                      : TColors.secondary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //title
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "15 March",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: TColors.secondary),
                          ),
                          /*    Container(
                            decoration: BoxDecoration(
                                color: TColors.secondary,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "+/-000.00DT",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          ) */
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //content
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredTransactions.length,
                        itemBuilder: (context, index) {
                          TransactionModel transaction =
                              filteredTransactions[index];
                          return HistoryContent(
                            title: transaction.category,
                            amount: CurrencyFormatter.format(
                                transaction
                                    .amount, // hot el amount fi blast el 1000
                                DinarSettings),
                            type: transaction.isExpense ? "expense" : "income",
                            date: transaction.date,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
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
