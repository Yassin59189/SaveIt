// ignore_for_file: unnecessary_const

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/features/authentication/screens/Store/clothstore.dart';
import 'package:saveit/features/authentication/screens/Store/vig.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class mainStore extends StatefulWidget {
  const mainStore({super.key});

  @override
  State<mainStore> createState() => _mainStoreState();
}

class _mainStoreState extends State<mainStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text("hello 1"),
                onTap: () {},
              )
            ],
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
                      child: Image(
                          image: AssetImage("assets/images/home/logo1.png"))),
                ]),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.menu_14,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Image(image: AssetImage("assets/images/home/Vector.png")),
            /* Container(
              width: THelperFunctions.screenWidth(),
              height: THelperFunctions.screenHeight() * 0.15,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(TImage.sthead),
                /* fit: BoxFit.contain, */
                fit: BoxFit.fill,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: SizedBox(
                      width: 124,
                      height: 103,
                      child: IconButton(
                        hoverColor: const Color.fromARGB(117, 10, 106, 203),
                        style: logostore,
                        icon: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(TImage.horizantalwhiteLogo),
                            fit: BoxFit.fitWidth,
                          )),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: IconButton(
                            hoverColor: const Color.fromARGB(117, 10, 106, 203),
                            style: logostore,
                            icon: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(TImage.shopingcart),
                              )),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Builder(builder: (context) {
                            return IconButton(
                              hoverColor:
                                  const Color.fromARGB(117, 10, 106, 203),
                              style: logostore,
                              icon: const Icon(Icons.menu_rounded),
                              color: TColors.white,
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ), */
            const SizedBox(
              height: TSizes.spaceBtwitems,
            ),
            Column(
              children: [
                const Text(
                  "Dive into Our Collection",
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w900,
                      fontSize: TSizes.fontMd),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Browse our product selection ",
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: TSizes.fontMd),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "and shop with ease.",
                  style: TextStyle(
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: TSizes.fontMd),
                  textAlign: TextAlign.center,
                ),
                Container(
                    width: double.infinity,
                    height: THelperFunctions.screenHeight() * 0.25,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(TImage.stopen),
                            fit: BoxFit.contain))),
                Container(
                  width: 350.59,
                  height: THelperFunctions.screenHeight() * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: TColors.accent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: TSizes.spaceBtwitems,
                              ),
                              const Text(
                                "Fresh Market ",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.w600,
                                    fontSize: TSizes.fontMd,
                                    color: Colors.white),
                              ),
                              const Text(
                                "Fruits and Vegetables, Guaranteed Freshness.",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: TSizes.fontexSm,
                                    color: Colors.white),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VigStore())); 
                                  },
                                  style: vistPrimary,
                                  child: const Text(
                                    "Visit >>",
                                    style: TextStyle(color: TColors.white),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      ClipRect(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(21, 1, 0, 0),
                          child: Align(
                            alignment:
                                Alignment.bottomRight, // Adjust alignment

                            child: Container(
                                width: 146.93,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(TImage.stveg),
                                        fit: BoxFit.cover))),
                          ),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      // Stack(
                      //   fit: StackFit.loose,
                      //   children: [
                      //     Positioned.fill(
                      //       child: Image.asset(
                      //         TImage.stveg,
                      //         fit: BoxFit.fitWidth,
                      //         alignment: Alignment.bottomRight,
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
                //section2

                const SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: THelperFunctions.screenWidth() * 0.48,
                      height: THelperFunctions.screenHeight() * 0.17,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                                20.0), // Adjust the values as needed
                            topRight: Radius.circular(
                                20.0), // Adjust the values as needed
                          ),
                          color: TColors.primary,
                          image: const DecorationImage(
                              image: AssetImage(TImage.sclock),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.centerLeft,
                              scale: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: TSizes.spaceBtwitems,
                            ),
                            const Text(
                              "Accessories ",
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: TSizes.fontMd,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              "Practical Essentials",
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: TSizes.fontexSm,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => clothsstore())); 
                                },
                                style: vistSecondary,
                                child: const Text(
                                  "<< Visit",
                                  style: TextStyle(color: TColors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: THelperFunctions.screenWidth() * 0.48,
                      height: THelperFunctions.screenHeight() * 0.17,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                                20.0), // Adjust the values as needed
                            topLeft: Radius.circular(
                                20.0), // Adjust the values as needed
                          ),
                          color: TColors.primary,
                          image: DecorationImage(
                            image: AssetImage(TImage.stwasher),
                            fit: BoxFit.fitHeight,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: TSizes.spaceBtwitems,
                            ),
                            const Text(
                              "Home Appliances ",
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: TSizes.fontSm,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 110,
                              child: Text(
                                "Our Range of Essential Appliances.",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: TSizes.fontexSm,
                                    color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => "QuestionDep"())); */
                                },
                                style: vistSecondary,
                                child: const Text(
                                  "Visit >>",
                                  style: TextStyle(color: TColors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
                Container(
                  width: 350.59,
                  height: THelperFunctions.screenHeight() * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: TColors.secondary,
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: TSizes.spaceBtwitems,
                            ),
                            const Text(
                              "Clothing ",
                              style: TextStyle(
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: TSizes.fontMd,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              "Style & Confort",
                              style: TextStyle(
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: TSizes.fontexSm,
                                  color: Colors.white),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => clothsstore())); 
                                },
                                style: vistSecondary,
                                child: const Text(
                                  "Visit >>",
                                  style: TextStyle(color: TColors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        width: 146.93,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(TImage.stshirt),
                                fit: BoxFit.cover))),
                  ]),
                ),
                SizedBox(
                  height: TSizes.spaceBtwitems,
                ),
              ],
            ),
          ]),
        ));
  }
}
