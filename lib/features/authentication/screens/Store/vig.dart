// ignore_for_file: unnecessary_const

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class VigStore extends StatefulWidget {
  const VigStore({super.key});

  @override
  State<VigStore> createState() => _mainStoreState();
}

class _mainStoreState extends State<VigStore> {
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
                  onTap: () {},
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
                child: Container(
              width: 328,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: TColors.secondary,
              ),
              child: SizedBox(
                width: 280,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 0, 0, 0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                        prefixIcon: const Icon(
                          Iconsax.search_normal,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(
                            color: Color.fromARGB(0, 158, 158, 158),
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(117, 255, 255, 255)),
                        border: InputBorder.none),
                  ),
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
                          image: AssetImage("assets/images/vigitabs/mg.png"))),
                  SizedBox(
                      child: Image(
                          image:
                              AssetImage("assets/images/vigitabs/boaziz.png"))),
                  SizedBox(
                      child: Image(
                          image:
                              AssetImage("assets/images/vigitabs/geant.png"))),
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
              height: TSizes.spaceBtwitems,
            ),
            Text(
              "Seasonal Fruits",
              style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: TSizes.fontMd,
                  color: TColors.primary),
            ),
            Container(
              height: 200,
              child: Row(
                children: [
                  Container(
                    width: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(700)),
                    height: 150,
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 140,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/vigitabs/apple.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: TColors.primary),
                              child: Container(
                                width: 140,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Apples",
                                            style: TextStyle(
                                                fontFamily: "poppins",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: TColors.white),
                                          ),
                                          Container(
                                            width: 30,
                                            child: IconButton(
                                                icon: Image.asset(
                                                    TImage.shopingcart),
                                                onPressed: () {}),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 130,
                                      height: 25,
                                      child: Text(
                                        "3,000dt/250g",
                                        style: TextStyle(
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: TSizes.fontSm,
                                          color: TColors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    height: 150,
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 140,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/vigitabs/banan.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: TColors.primary),
                              child: Container(
                                width: 140,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "banan",
                                            style: TextStyle(
                                                fontFamily: "poppins",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: TColors.white),
                                          ),
                                          Container(
                                            width: 30,
                                            child: IconButton(
                                                icon: Image.asset(
                                                    TImage.shopingcart),
                                                onPressed: () {}),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 130,
                                      height: 25,
                                      child: Text(
                                        "5,000dt/250g",
                                        style: TextStyle(
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: TSizes.fontSm,
                                          color: TColors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    height: 150,
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 140,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/vigitabs/cherry.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: TColors.primary),
                              child: Container(
                                width: 140,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Cherrys",
                                            style: TextStyle(
                                                fontFamily: "poppins",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: TColors.white),
                                          ),
                                          Container(
                                            width: 30,
                                            child: IconButton(
                                                icon: Image.asset(
                                                    TImage.shopingcart),
                                                onPressed: () {}),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 130,
                                      height: 25,
                                      child: Text(
                                        "3,000dt/250g",
                                        style: TextStyle(
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: TSizes.fontSm,
                                          color: TColors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Seasonal Vegetables",
              style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: TSizes.fontMd,
                  color: TColors.primary),
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: 150,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/vigitabs/Tomato.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: TColors.primary),
                            child: Container(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Cherry Tomatoes",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                              color: TColors.white),
                                        ),
                                        Container(
                                          width: 30,
                                          child: IconButton(
                                              icon: Image.asset(
                                                  TImage.shopingcart),
                                              onPressed: () {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 25,
                                    child: Text(
                                      "3,000dt/250g",
                                      style: TextStyle(
                                        fontFamily: "poppins",
                                        fontWeight: FontWeight.w500,
                                        fontSize: TSizes.fontSm,
                                        color: TColors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: 150,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/vigitabs/Latus.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: TColors.primary),
                            child: Container(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Lettuce",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                              color: TColors.white),
                                        ),
                                        Container(
                                          width: 30,
                                          child: IconButton(
                                              icon: Image.asset(
                                                  TImage.shopingcart),
                                              onPressed: () {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 25,
                                    child: Text(
                                      "2,000dt/250g",
                                      style: TextStyle(
                                        fontFamily: "poppins",
                                        fontWeight: FontWeight.w500,
                                        fontSize: TSizes.fontSm,
                                        color: TColors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: 150,
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/vigitabs/Tomato.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: TColors.primary),
                            child: Container(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Cherry Tomatoes",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                              color: TColors.white),
                                        ),
                                        Container(
                                          width: 30,
                                          child: IconButton(
                                              icon: Image.asset(
                                                  TImage.shopingcart),
                                              onPressed: () {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 25,
                                    child: Text(
                                      "3,000dt/250g",
                                      style: TextStyle(
                                        fontFamily: "poppins",
                                        fontWeight: FontWeight.w500,
                                        fontSize: TSizes.fontSm,
                                        color: TColors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ]),
          SizedBox(
            height: TSizes.spaceBtsections,
          ),
        ])));
  }
}
