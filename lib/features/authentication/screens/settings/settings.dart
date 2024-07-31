import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/utils/constants/colors.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
              height: 270,
              child: Column(
                children: [
                  SAppBar(
                    title: const Column(
                      children: [
                        SizedBox(
                            width: 90,
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Balance
                        Container(
                          width: 172,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Image(
                                    image: AssetImage(
                                        "assets/images/home/card.png")),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Your Balance",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: TColors.primary.withOpacity(0.8)),
                                ),
                                Text(
                                  "450.000DT",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: TColors.primary.withOpacity(0.8)),
                                )
                              ],
                            ),
                          ),
                        ),
                        //Total
                        Container(
                          width: 172,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 9, bottom: 15, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Image(
                                    image: AssetImage(
                                        "assets/images/home/coin.png")),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Total Spend",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: TColors.primary.withOpacity(0.8)),
                                ),
                                Text(
                                  "250.000DT",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: TColors.primary.withOpacity(0.8)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Image(image: AssetImage("assets/images/home/Vector.png")),
            const SizedBox(
              height: 20,
            ),
            //Page title
            Container(
              decoration: BoxDecoration(
                  color: TColors.secondary,
                  borderRadius: BorderRadius.circular(20)),
              width: screenWidth * 0.9,
              height: 53,
              child: const Center(
                  child: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              )),
            ),
            const SizedBox(
              height: 40,
            ),
            //Profile
            settings_button(
                text: 'Profile',
                icon: Iconsax.user,
                width: screenWidth * 0.8,
                height: screenHeight * 0.06),
            const SizedBox(
              height: 10,
            ),
            //Notifications
            settings_button(
                text: 'Notifications',
                icon: Iconsax.notification,
                width: screenWidth * 0.8,
                height: screenHeight * 0.06),
            const SizedBox(
              height: 10,
            ),

            //Login settings
            settings_button(
                text: 'Login Settings',
                icon: Iconsax.key,
                width: screenWidth * 0.8,
                height: screenHeight * 0.06),
            const SizedBox(
              height: 10,
            ),

            //Service center
            settings_button(
                text: 'Service Center',
                icon: Iconsax.call,
                width: screenWidth * 0.8,
                height: screenHeight * 0.06),
            const SizedBox(
              height: 40,
            ),

            //Log Out
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  customBorder: const CircleBorder(),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: TColors.accent, width: 1)),
                      child: const Center(
                        child: Icon(
                          Iconsax.logout,
                          color: TColors.accent,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8), // Space between the icon and text
                const Text("Log Out",
                    style: TextStyle(
                      color: TColors.accent,
                      fontSize: 16,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class settings_button extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;
  final double height;
  const settings_button({
    super.key,
    required this.text,
    required this.icon,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.transparent),
              elevation: WidgetStateProperty.all<double>(0),
              side: WidgetStateProperty.all<BorderSide>(
                  const BorderSide(color: TColors.secondary, width: 1)),
              padding: WidgetStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    color: TColors.secondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      text,
                      style: const TextStyle(
                          color: TColors.secondary,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const Icon(
                Iconsax.arrow_right_3,
                size: 20,
                color: TColors.secondary,
              )
            ],
          )),
    );
  }
}
