// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

bool isPressed4 = false;

class claimcode extends StatefulWidget {
  const claimcode({super.key});

  @override
  State<claimcode> createState() => _mainStoreState();
}

class _mainStoreState extends State<claimcode> {
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
                      const Image(
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
                    Get.to(Wallet());
                  },
                ),
                ListTile(
                  title: const Text(
                    "coupon",
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
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
            child: Column(children: [
          Container(
            color: TColors.primary,
            height: 120,
            child: SAppBar(
              title: const Column(children: [
                SizedBox(
                    width: 90,
                    child: Image(
                        image: AssetImage("assets/images/home/logo1.png"))),
              ]),
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
          ),
          const Image(image: AssetImage("assets/images/home/Vector.png")),
          const SizedBox(
            height: TSizes.spaceBtwitems,
          ),
          Column(children: [
            const SizedBox(
              height: TSizes.spaceBtwitems,
            ),
            Container(
                width: double.infinity,
                height: THelperFunctions.screenHeight() * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/recomanded/recomnd/zit.png"),
                        fit: BoxFit.contain))),
            const SizedBox(
              height: TSizes.spaceBtwitems,
            ),
            Center(
              child: SizedBox(
                width: THelperFunctions.screenWidth() * 0.8,
                child: Column(
                  children: [
                    Container(
                      child: const Row(
                        children: [
                          Text(
                            "Vegetable Oil",
                            style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w800,
                                fontSize: TSizes.md,
                                color: TColors.primary),
                          ),
                          SizedBox(
                            height: TSizes.spaceBtwitems,
                          ),
                          Image(
                              image: AssetImage(
                                  "assets/images/vigitabs/boaziz.png")),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwitems,
                    ),
                    const Text(
                      "Pure and versatile, our vegetable oil is the perfect choice for all your cooking needs. Made from high-quality ingredients,",
                      style: TextStyle(
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: TSizes.fontexSm,
                          color: TColors.primary),
                    ),
                    const Row(
                      children: [
                        Text(
                          "Marque",
                          style: TextStyle(
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: TSizes.fontexSm,
                              color: TColors.primary),
                        ),
                        Text(
                          "Olina",
                          style: TextStyle(
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: TSizes.fontexSm,
                              color: TColors.primary),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwitems,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "18.00 DT",
                        style: TextStyle(
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w800,
                            fontSize: TSizes.fontMd,
                            color: TColors.primary),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwitems,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Image(
                          image: AssetImage(
                              "assets/images/recomanded/recomnd/stars.png")),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwitems,
                    ),
                    SizedBox(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isPressed4 = !isPressed4;
                              });
                            },
                            style: isPressed4
                                ? buttonanContinueSecondary
                                : buttonquestionSelected,
                            child: const Text(
                              "Claim code",
                              style: TextStyle(color: TColors.white),
                            ))),
                  ],
                ),
              ),
            ),
          ])
        ])));
  }
}
