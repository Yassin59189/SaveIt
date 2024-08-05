import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:saveit/features/authentication/screens/questions/question_region.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class Reset_Password_Screen extends StatefulWidget {
  Reset_Password_Screen({super.key});
  bool allowResend = true;
  final test = "this is a test";
  @override
  State<Reset_Password_Screen> createState() => _Reset_Password_ScreenState();
}

class _Reset_Password_ScreenState extends State<Reset_Password_Screen> {
  didClickResend() {
    setState(() {
      widget.allowResend = false;
    });

    Timer(Duration(seconds: 30), () {
      setState(() {
        widget.allowResend = true;
      });
      print("Execute this code afer 2 seconds");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/reset_password/RestPasswordbg.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: [
            PageView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                          image: const AssetImage(
                              "assets/images/reset_password/RestPasswordFlat.png")),
                    ),
                    SizedBox(
                      child: const Text(
                        TText.resetPasswordTitle,
                        style: TextStyle(
                            fontFamily: "inter",
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: TColors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: const Text(
                        "YourEmail@gmail.com ", //<----fetchi el data t3 email lhne
                        style: TextStyle(
                            fontFamily: "inter",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: TColors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        TText.resetPasswordText,
                        style: TextStyle(
                            fontFamily: "inter",
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: Color.fromARGB(104, 255, 255, 255)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 206.35,
                        height: 54.04,
                        child: ElevatedButton(
                            onPressed: () {
                              /* Get.to(const );  hot page li b3d continue lhne */
                            },
                            style: buttonanContinueSecondary,
                            child: const Text(
                              "Continue",
                              style: TextStyle(color: TColors.white),
                            ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't receive an Email?",
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: TColors.white),
                        ),
                        TextButton(
                            onPressed: !widget.allowResend
                                ? null
                                : () {
                                    didClickResend();
                                    /* Get.to();  hot el Resend lhne */
                                  },
                            child: Text("Send it again",
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: !widget.allowResend
                                        ? Color.fromARGB(69, 255, 255, 255)
                                        : TColors.accent)))
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
