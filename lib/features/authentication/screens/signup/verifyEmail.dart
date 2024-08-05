import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:saveit/features/authentication/screens/welcome/welcome.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';

class VerifyemailPage extends StatefulWidget {
  VerifyemailPage({super.key, this.email});
  final String? email;
  bool allowResend = true;

  @override
  State<VerifyemailPage> createState() => _VerifyemailPageState();
}

class _VerifyemailPageState extends State<VerifyemailPage> {
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

  //true = the button is active
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/reset_password/RestPasswordbg.png"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Column(
            children: [
              /*  Container(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtsections),
                child: SizedBox(
                  child: IconButton(
                      hoverColor: TColors.secondary,
                      onPressed: () {
                        /*  AuthenticationRepository.instance.logout(); */
                      },
                      icon: const Icon(Icons.arrow_back_rounded)),
                ),
              ), */
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Verify",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    color: TColors.white,
                                    fontFamily: 'Poppins'),
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500,
                                    color: TColors.white,
                                    fontFamily: 'Poppins'),
                              )
                            ],
                          ),
                          SizedBox(
                              width: 200,
                              child: Image(
                                  image: AssetImage(
                                      "assets/images/login_image/verify.png"))),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 380,
                          child: Text(
                            widget.email ?? '',
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                            width: 206,
                            height: 54,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(controller.checkEmailVeficationStatus());
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: TColors.accent),
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300),
                              ),
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn't receive the code?",
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
                                      Get.to(
                                          controller.sendEmailVerification());
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
