import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key});

  @override
  State<NewTransaction> createState() => _NewTransaction();
}

class _NewTransaction extends State<NewTransaction> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(color: TColors.primary),
            child: Column(children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Center(
                child: Text(
                  "New Transaction",
                  style: TextStyle(
                      color: TColors.white,
                      fontSize: TSizes.lg,
                      fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 8, right: 8, bottom: 20),
                child: Container(
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: TColors.white,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/home/bg_newTransaction.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: screenWidth * 0.55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: TColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 15),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0.0,
                                        shadowColor: Colors.transparent,
                                        backgroundColor: TColors.secondary,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.50),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        maximumSize: const Size(105, 50),
                                      ),
                                      onPressed: () {},
                                      child: Row(children: [
                                        Transform.scale(
                                          scale: 0.6,
                                          child: Icon(
                                              color: TColors.white,
                                              Iconsax.shopping_cart),
                                        ),
                                        Text(
                                          "Expense",
                                          style: TextStyle(
                                              color: TColors.white,
                                              fontSize: 12.5),
                                        )
                                      ])),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      shadowColor: Colors.transparent,
                                      backgroundColor: TColors.white,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.50),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      maximumSize: const Size(105, 50),
                                    ),
                                    iconAlignment: IconAlignment.start,
                                    onPressed: () {},
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Transform.scale(
                                            scale: 0.6,
                                            child: Icon(
                                                color: TColors.primary,
                                                Iconsax.empty_wallet_add),
                                          ),
                                          Text(
                                            "Income",
                                            style: TextStyle(
                                                color: TColors.primary,
                                                fontSize: 12.5),
                                          )
                                        ])),
                              ),
                            ],
                          ),
                        ), //buttons done Here
                        const SizedBox(
                          height: 20,
                        ),
                        Text("0.000.000 DT", //<---- lhne zid balance
                            style: TextStyle(
                                color: TColors.primary,
                                fontSize: TSizes.fontLg,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                    )),
              )
            ])));
  }
}

class Notification_settings extends StatefulWidget {
  final String text;

  final double width;
  final double height;
  final VoidCallback onPressed;
  const Notification_settings({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  State<Notification_settings> createState() => _Notification_settingsState();
}

class _Notification_settingsState extends State<Notification_settings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(color: TColors.primary, fontSize: TSizes.fontMd),
            ),
            Transform.scale(
              scale: 0.7,
              child: Switch(
                  activeColor: Color.fromARGB(255, 255, 255, 255),
                  activeTrackColor: TColors.secondary,
                  inactiveTrackColor: Color.fromRGBO(187, 187, 187, 0.718),
                  inactiveThumbColor: TColors.white,
                  trackOutlineColor:
                      MaterialStateProperty.all(Colors.transparent),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      isSwitched ? widget.onPressed() : null;
                    });
                  }),
            )
          ],
        ));
  }
}
