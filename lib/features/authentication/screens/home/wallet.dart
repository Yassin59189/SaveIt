import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/edit_wallet.dart';
import 'package:saveit/utils/constants/colors.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

String dropdownValue = 'This mounth';

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
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
                    Image(
                        image: AssetImage("assets/images/home/logo1.png"))
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
                  const Text(
                    "358,50DT",
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
                    height: 229,
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
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Icon(
                                    Iconsax.arrow_bottom,
                                    color: Colors.white,
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
                                      value: 'This mounth',
                                      child: Text("This mounth"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'This week',
                                      child: Text("This week"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'Last mounth',
                                      child: Text("Last mounth"),
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'Last week',
                                      child: Text("Last week"),
                                    )
                                  ],
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Income
                              Row(
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
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "000.00DT",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: TColors.primary,
                                            fontSize: 17),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              //Spending
                              Row(
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
                                        "spending",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: TColors.primary,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "000.00DT",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: TColors.primary,
                                            fontSize: 17),
                                      )
                                    ],
                                  ),
                                ],
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
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Set all radii to zero
                                  ),
                                ),
                                child: const Text("SHOW CHART")),
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: TColors.secondary),
                            child: const Text(
                              "All",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor: Colors.transparent,
                                side: const BorderSide(
                                    width: 2, color: TColors.secondary)),
                            child: const Text(
                              "Income",
                              style: TextStyle(color: TColors.secondary),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor: Colors.transparent,
                                side: const BorderSide(
                                    width: 2, color: TColors.secondary)),
                            child: const Text(
                              "Spending",
                              style: TextStyle(color: TColors.secondary),
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
                          Container(
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
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //content
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 75,
                        child: const HistoryContent()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryContent extends StatelessWidget {
  const HistoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(image: AssetImage("assets/icons/history.png")),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem Ipsum",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Yesterday 19:12",
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
          Text("-10.000DT",
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
