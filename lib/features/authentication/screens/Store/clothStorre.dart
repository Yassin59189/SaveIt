// ignore_for_file: unnecessary_const


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/features/authentication/screens/Store/claimcode.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:saveit/utils/constants/Veg_list_of_items.dart';
import 'package:saveit/utils/constants/Fruits_list_of_items.dart';

class Clothsstorre extends StatefulWidget {
  const Clothsstorre({super.key});

  @override
  State<Clothsstorre> createState() => _mainStoreState();
}

class _mainStoreState extends State<Clothsstorre> {
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
                style: const TextStyle(color: Colors.white, fontSize: TSizes.fontMd),
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
            const SizedBox(
              height: TSizes.spaceBtwitems,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(color: TColors.primary),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      child: Image(
                          image:
                              AssetImage("assets/images/storecloths/zen.png"))),
                  SizedBox(
                      child: Image(
                          image: AssetImage(
                              "assets/images/storecloths/exist.png"))),
                  SizedBox(
                      child: Image(
                          image:
                              AssetImage("assets/images/storecloths/hm.png"))),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                height: THelperFunctions.screenHeight() * 0.25,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/storecloths/banerr.png"),
                        fit: BoxFit.contain))),
            const SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            SizedBox(
              width: THelperFunctions.screenWidth() * 0.9,
              child: const Text(
                "Trending",
                style: TextStyle(
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: TSizes.fontMd,
                    color: TColors.primary),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
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
                          decoration: const BoxDecoration(
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
                                BorderRadius.all(Radius.circular(30)),
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
                                            i.name,
                                            style: const TextStyle(
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
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      child: Text(i.description,
                                          style: const TextStyle(
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
            const SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            SizedBox(
              width: THelperFunctions.screenWidth() * 0.9,
              child: const Text(
                "Best Quilty Value",
                style: TextStyle(
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: TSizes.fontMd,
                    color: TColors.primary),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
                          decoration: const BoxDecoration(
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
                                BorderRadius.all(Radius.circular(30)),
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
                                            i.name,
                                            style: const TextStyle(
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
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      child: Text(i.description,
                                          style: const TextStyle(
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
            const SizedBox(
              height: TSizes.spaceBtsections,
            ),
          ]),
        ])));
  }
}
