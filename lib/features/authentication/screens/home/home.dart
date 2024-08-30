import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/common/widgets/loaders/shimmer.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/features/authentication/controllers/user/user_controller.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/notification_bottom_sheet/notification_bottom_sheet.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
                  Get.to(const Wallet());
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
                    height: 5,
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
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w400,
                                  color: TColors.accent),
                              textAlign: TextAlign.center,
                            ),
                            Obx(
                              () => Text(
                                CurrencyFormatter.format(
                                    (controller.user.value.budget * 3000),
                                    DinarSettings),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: TColors.white.withOpacity(0.8)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
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
                  )
                ],
              ),
            ),

            //Notification
            Transform.translate(
              offset: const Offset(0.0, -45.0),
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
                              color: TColors.secondary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: screenWidth - 35,
                          height: screenHeight * 0.15,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Hello!",
                                      style: TextStyle(
                                          color: Colors.white,
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
                                          controller.user.value.fullName +
                                              "tester",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        );
                                      }
                                    }),
                                  ],
                                ),
                                //Notification button
                                IconButton(
                                    onPressed: () {
                                      NotificationBottomSheet(context);
                                    },
                                    icon: const Icon(
                                      Iconsax.notification5,
                                      color: Colors.white,
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
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      fontSize: 16,
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
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  //History content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    /* child: GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 60,
                        mainAxisSpacing: 20),
                    itemBuilder: (_, index) => const HistoryContent()), */
                  )
                ],
              ),
            ),
          ],
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
              Image(image: AssetImage("assets/images/home/round.png")),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "200DT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "sended to your friend.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "02/11/2022",
            style: TextStyle(
                color: TColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins'),
          )
        ],
      ),
    );
  }
}
