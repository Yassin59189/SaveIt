// ignore_for_file: unnecessary_const

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class recomanded extends StatefulWidget {
  const recomanded({super.key});

  @override
  State<recomanded> createState() => _mainStoreState();
}

class _mainStoreState extends State<recomanded> {
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
                  onTap: () {Get.to(Wallet());},
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
              title: Column(children: [
                Container(
                    width: 90,
                    child: const Image(
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
            const Text(
              "RECOMMANDATION",
              style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w900,
                  fontSize: TSizes.fontMd,
                  color: TColors.primary),
              textAlign: TextAlign.center,
            ),
            const Text(
              "FExplore recommendations tailored just for you.  ",
              style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: TSizes.fontMd,
                  color: TColors.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwitems,
            ),
            SizedBox(
              height: TSizes.spaceBtwitems,
            ),
            Container(
                width: double.infinity,
                height: THelperFunctions.screenHeight() * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/recomanded/recomnd/bannerrec.png"),
                        fit: BoxFit.contain))),
            SizedBox(
              height: TSizes.spaceBtwitems,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      width: THelperFunctions.screenWidth() * 0.85,
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/recomanded/recomnd/ar.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 25, 0, 0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: 180,
                              height: 160,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      "Artichoke",
                                      style: TextStyle(
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w700,
                                          fontSize: TSizes.fontMd,
                                          color: TColors.primary),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/vigitabs/boaziz.png")),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      "Savor the exquisite taste of our artichokes, perfect for adding a gourmet touch to any dish.",
                                      style: TextStyle(
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w400,
                                          fontSize: TSizes.fontexSm,
                                          color: TColors.primary),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/recomanded/recomnd/stars.png")),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwitems,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: THelperFunctions.screenWidth() * 0.85,
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/recomanded/recomnd/zit.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 25, 0, 0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: 180,
                                  height: 160,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "Vegetable Oil",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w700,
                                              fontSize: TSizes.fontMd,
                                              color: TColors.primary),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/vigitabs/mg.png")),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "Pure and versatile, our vegetable oil is the perfect choice for all your cooking needs...",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: TSizes.fontexSm,
                                              color: TColors.primary),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/recomanded/recomnd/stars.png")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          width: THelperFunctions.screenWidth() * 0.85,
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/recomanded/recomnd/hrisssa.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 25, 0, 0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: 180,
                                  height: 160,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "Harissa",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w700,
                                              fontSize: TSizes.fontMd,
                                              color: TColors.primary),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/vigitabs/geant.png")),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "Savor the exquisite taste of our Harissa, perfect for adding a gourmet touch to any dish.",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: TSizes.fontexSm,
                                              color: TColors.primary),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/recomanded/recomnd/stars.png")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ])
          ])
        ])));
  }
}
