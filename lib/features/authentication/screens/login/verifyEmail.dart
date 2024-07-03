import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saveit/features/authentication/screens/welcome/welcome.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/features/authentication/screens/login/login.dart';

class VerifyemailPage extends StatefulWidget {
  const VerifyemailPage({super.key});

  @override
  State<VerifyemailPage> createState() => _VerifyemailPageState();
}

class _VerifyemailPageState extends State<VerifyemailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                                color: TColors.primary,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w500,
                                color: TColors.primary,
                                fontFamily: 'Poppins'),
                          )
                        ],
                      ),
                      Container(
                          width: 200,
                          child: Image(
                              image: AssetImage(
                                  "assets/images/login_image/verify.png"))),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 380,
                      child: Text(
                        "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w300),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                        width: 206,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(Welcome());
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.primary),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code?",
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Send it again",
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ))
                    ],
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
