// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class clothsstore extends StatefulWidget {
  const clothsstore({super.key});

  @override
  State<clothsstore> createState() => _mainStoreState();
}

class _mainStoreState extends State<clothsstore> {
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
                    style: const TextStyle(color: Colors.white),
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
              height: TSizes.spaceBtwitems,
            ),
            const Text(
              "Trending ",
              style: TextStyle(
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w500,
                  fontSize: TSizes.fontMd,
                  color: TColors.primary),
            ),
            SizedBox(
              height: 200,
              child: Row(
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
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/storecloths/short.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(color: TColors.primary),
                              child: SizedBox(
                                width: 140,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Shorts",
                                            style: TextStyle(
                                                fontFamily: "poppins",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: TColors.white),
                                          ),
                                          SizedBox(
                                            width: 30,
                                            child: IconButton(
                                                icon: Image.asset(
                                                    TImage.shopingcart),
                                                onPressed: () {}),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 130,
                                      height: 25,
                                      child: Text(
                                        "13 Dt",
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
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/storecloths/shirt.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(color: TColors.primary),
                              child: SizedBox(
                                width: 140,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "T-Shirt",
                                            style: TextStyle(
                                                fontFamily: "poppins",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: TColors.white),
                                          ),
                                          SizedBox(
                                            width: 30,
                                            child: IconButton(
                                                icon: Image.asset(
                                                    TImage.shopingcart),
                                                onPressed: () {}),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 130,
                                      height: 25,
                                      child: Text(
                                        "20 Dt",
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
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/storecloths/boots.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(color: TColors.primary),
                              child: SizedBox(
                                width: 140,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Boots",
                                            style: TextStyle(
                                                fontFamily: "poppins",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: TColors.white),
                                          ),
                                          SizedBox(
                                            width: 30,
                                            child: IconButton(
                                                icon: Image.asset(
                                                    TImage.shopingcart),
                                                onPressed: () {}),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 130,
                                      height: 25,
                                      child: Text(
                                        "40 Dt",
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
            const Text(
              "Best Quilty Value",
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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/storecloths/short.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(color: TColors.primary),
                            child: SizedBox(
                              width: 140,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "shorts",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                              color: TColors.white),
                                        ),
                                        SizedBox(
                                          width: 30,
                                          child: IconButton(
                                              icon: Image.asset(
                                                  TImage.shopingcart),
                                              onPressed: () {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 130,
                                    height: 25,
                                    child: Text(
                                      "13 Dt",
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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/storecloths/dress.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(color: TColors.primary),
                            child: SizedBox(
                              width: 140,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Dress",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                              color: TColors.white),
                                        ),
                                        SizedBox(
                                          width: 30,
                                          child: IconButton(
                                              icon: Image.asset(
                                                  TImage.shopingcart),
                                              onPressed: () {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 130,
                                    height: 25,
                                    child: Text(
                                      "60 Dt",
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
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/storecloths/shirt.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(color: TColors.primary),
                            child: SizedBox(
                              width: 140,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "T-Shirt",
                                          style: TextStyle(
                                              fontFamily: "poppins",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 10,
                                              color: TColors.white),
                                        ),
                                        SizedBox(
                                          width: 30,
                                          child: IconButton(
                                              icon: Image.asset(
                                                  TImage.shopingcart),
                                              onPressed: () {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 130,
                                    height: 25,
                                    child: Text(
                                      "20 Dt",
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
          const SizedBox(
            height: TSizes.spaceBtsections,
          ),
        ])));
  }
}
