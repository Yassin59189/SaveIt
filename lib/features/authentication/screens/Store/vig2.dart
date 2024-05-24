// ignore_for_file: unnecessary_const

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:saveit/utils/constants/Veg_list_of_items.dart';
import 'package:saveit/utils/constants/Fruits_list_of_items.dart';

class VigStore2 extends StatefulWidget {
  const VigStore2({super.key});

  @override
  State<VigStore2> createState() => _mainStoreState();
}

class _mainStoreState extends State<VigStore2> {
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
                  onTap: () {
                    Get.to(claimcode());
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
              "Find & Save",
              style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w900,
                  fontSize: TSizes.fontMd,
                  color: TColors.primary),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Find the products you want and easily ",
              style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: TSizes.fontMd,
                  color: TColors.primary),
              textAlign: TextAlign.center,
            ),
            const Text(
              "compare prices.",
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
            Center(
                child: SizedBox(
              width: THelperFunctions.screenWidth() * 0.8,
              height: 60,
              child: TextFormField(
                cursorColor: TColors.white,
                cursorWidth: 1,
                minLines: 1,
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: TSizes.fontMd),
                decoration: const InputDecoration(
                  fillColor: TColors.secondary,
                  filled: true,
                  prefixIcon: const Icon(
                    size: 23,
                    Iconsax.search_normal,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(84, 158, 158, 158),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(84, 158, 158, 158),
                    ),
                  ),
                  hintText: 'Search',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(117, 255, 255, 255)),
                ),
              ),
            )),
            SizedBox(
              height: TSizes.spaceBtwitems,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(color: TColors.primary),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      child: Image(
                          image: AssetImage(
                              "assets/images/productsfood/sponsors/mg.png"))),
                  SizedBox(
                      child: Image(
                          image: AssetImage(
                              "assets/images/productsfood/sponsors/boaziz.png"))),
                  SizedBox(
                      child: Image(
                          image: AssetImage(
                              "assets/images/productsfood/sponsors/geant.png"))),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                height: THelperFunctions.screenHeight() * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(TImage.bannervigi),
                        fit: BoxFit.contain))),
            SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            SizedBox(
              width: THelperFunctions.screenWidth() * 0.9,
              child: Text(
                "Seasonal Vegetables",
                style: TextStyle(
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: TSizes.fontMd,
                    color: TColors.primary),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayCurve: Curves.easeInSine,
                viewportFraction: 0.48,
                aspectRatio: 9 / 16,
              ),
              items: sampleItems.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Transform.scale(
                      scale: 0.85,
                      child: Container(
                          height: 150.0,
                          width: MediaQuery.of(context).size.width * 0.53,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(64, 36, 36, 36),
                                blurRadius: 1,
                                spreadRadius: 2,
                                offset: Offset(0, 2), // Shadow position
                              ),
                            ],
                            color: TColors.primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(i.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${i.name}",
                                            style: TextStyle(
                                                fontFamily: "poppins",
                                                fontWeight: FontWeight.bold,
                                                color: TColors.white),
                                            textAlign: TextAlign.left,
                                          ),
                                          IconButton(
                                              icon: Image.asset(
                                                  TImage.shopingcart),
                                              onPressed: () {}),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      child: Text("${i.description}",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: TSizes.fontMd,
                                              color: TColors.white),
                                          textAlign: TextAlign.left)),
                                ],
                              )
                            ],
                          )),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            SizedBox(
              width: THelperFunctions.screenWidth() * 0.9,
              child: Text(
                "Seasonal Fruits",
                style: TextStyle(
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: TSizes.fontMd,
                    color: TColors.primary),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInSine,
                viewportFraction: 0.48,
                aspectRatio: 9 / 16,
              ),
              items: fruitItems.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Transform.scale(
                      scale: 0.85,
                      child: Container(
                          height: 150.0,
                          width: MediaQuery.of(context).size.width * 0.53,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(64, 36, 36, 36),
                                blurRadius: 1,
                                spreadRadius: 2,
                                offset: Offset(0, 2), // Shadow position
                              ),
                            ],
                            color: TColors.primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(i.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${i.name}",
                                            style: TextStyle(
                                                fontFamily: "poppins",
                                                fontWeight: FontWeight.bold,
                                                color: TColors.white),
                                            textAlign: TextAlign.left,
                                          ),
                                          IconButton(
                                              icon: Image.asset(
                                                  TImage.shopingcart),
                                              onPressed: () {}),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      child: Text("${i.description}",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w400,
                                              fontSize: TSizes.fontMd,
                                              color: TColors.white),
                                          textAlign: TextAlign.left)),
                                ],
                              )
                            ],
                          )),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: TSizes.spaceBtsections,
            ),
          ]),
        ])));
  }
}
