import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:saveit/features/authentication/screens/welcome/welcome.dart';
import 'package:saveit/utils/constants/colors.dart';

class CodeVerifyScreen extends StatelessWidget {
  const CodeVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
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
                            "Code",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w500,
                                color: TColors.primary,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            "Verify!",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w500,
                                color: TColors.primary,
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
                  const SizedBox(
                      width: 243,
                      child: Text(
                        "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w300),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  //Form
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Form(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 68,
                                  width: 56,
                                  child: TextField(
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: TColors.accent,
                                                width: 2)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: TColors.accent,
                                                width: 2))),
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 56,
                                  child: TextField(
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: TColors.accent,
                                                width: 2)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: TColors.accent,
                                                width: 2))),
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 56,
                                  child: TextField(
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: TColors.accent,
                                                width: 2)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: TColors.accent,
                                                width: 2))),
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 56,
                                  child: TextField(
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1)
                                    ],
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: TColors.accent,
                                                width: 2)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: TColors.accent,
                                                width: 2))),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                                width: 206,
                                height: 54,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(const Welcome());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: TColors.primary),
                                  child: const Text(
                                    "Continue",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Didn't receive the code?",
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Send it again",
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
