// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

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

class mainStore extends StatefulWidget {
  const mainStore({super.key});

  @override
  State<mainStore> createState() => _mainStoreState();
}

final sampleItemss = [
  {"imageUrl": "https://ychef.files.bbci.co.uk/1280x720/p07v2wjn.jpg"},
  {"imageUrl": "https://sklep.onix.pl/wp-content/uploads/2021/03/banan.jpg"},
  {
    "imageUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6v6-5oWwpOH3jeOliF9RJObbpb9OAYn8IZw&s"
  },
  {
    "imageUrl":
        "https://www.elaoula.com/wp-content/uploads/2022/03/Gaufrettes-CHOCOTOM-100g-e1678392797891.jpg"
  },
  {
    "imageUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmLVXtRetmKw_HvsSJ2YQ4XYdqFUPcBFu77Q&s"
  },
];

class _mainStoreState extends State<mainStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
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
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            color: TColors.primary,
            child: Column(
              children: [
                SAppBar(
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
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: THelperFunctions.screenWidth() * 0.8,
                    height: 40,
                    child: Form(
                      child: TextFormField(
                        cursorColor: TColors.white,
                        cursorWidth: 1,
                        minLines: 1,
                        maxLines: 1,
                        style: const TextStyle(
                          color: TColors.primary,
                          fontSize: TSizes.fontSm,
                        ),
                        decoration: InputDecoration(
                          fillColor: TColors.white,
                          filled: true,
                          suffixIcon: IconButton(
                            onPressed: () => {},
                            icon: Icon(
                              size: 18,
                              Iconsax.search_normal,
                              color: TColors.primary,
                            ),
                          ),
                          suffixIconConstraints: BoxConstraints(
                            maxWidth: THelperFunctions.screenWidth() * 1,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(84, 158, 158, 158),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(84, 158, 158, 158),
                            ),
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: TColors.primary.withOpacity(0.5),
                              fontSize: TSizes.fontSm),
                          contentPadding: EdgeInsets.symmetric(
                            vertical:
                                10, // Adjust this value for vertical padding
                            horizontal:
                                20, // Adjust this value for horizontal padding
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwitems,
          ),
          Column(children: [
            const SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            SizedBox(
              width: THelperFunctions.screenWidth() * 0.9,
              child: const Text(
                "Specail Offers",
                style: TextStyle(
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: TSizes.fontMd,
                    color: TColors.primary),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwitems * 0.48,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.33,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  autoPlayCurve: Curves.easeInSine,
                  viewportFraction: 0.5,
                  aspectRatio: 9 / 16,
                ),
                items: sampleItemss.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          print(1);
                        },
                        child: Transform.scale(
                          scale: 0.85,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.53,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Color.fromARGB(64, 36, 36, 36),
                                            blurRadius: 10,
                                            spreadRadius: 2,
                                            offset:
                                                Offset(0, 1), // Shadow position
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        image: DecorationImage(
                                          image: NetworkImage(i[
                                              "imageUrl"]!), // Access the correct key
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Tom",
                                              style: TextStyle(
                                                  color: TColors.primary,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: TSizes.fontSm),
                                              textAlign: TextAlign.start,
                                            ),
                                            Text(
                                              "Gaufrettes Choco Tom",
                                              style: TextStyle(
                                                  color: TColors.primary,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: TSizes.fontSm),
                                            ),
                                            Text(
                                              '1.8 DT',
                                              style: TextStyle(
                                                  color: TColors.accent,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: TSizes.fontSm),
                                            ),
                                          ],
                                        ),
                                        Transform.scale(
                                          scale: 0.8,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/productsfood/sponsors/geant.png"),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            SizedBox(
              width: THelperFunctions.screenWidth() * 0.9,
              child: const Text(
                "Specail Offers",
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
              items: sampleItemss.map((i) {
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
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 150.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  i["imageUrl"]!), // Access the correct key
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            const SizedBox(
              height: TSizes.spaceBtwitems * 0.5,
            ),
            const SizedBox(
              height: TSizes.spaceBtsections,
            ),
          ]),
        ])));
  }
}
