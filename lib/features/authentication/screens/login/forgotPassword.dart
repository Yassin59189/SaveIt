import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saveit/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:saveit/features/authentication/screens/signup/code_verify.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:saveit/features/authentication/screens/login/login.dart';

class EnterEmailOnForgetPassword extends StatefulWidget {
  const EnterEmailOnForgetPassword({super.key});
void dispose(){
 
}
  @override
  State<EnterEmailOnForgetPassword> createState() =>
      _EnterEmailOnForgetPasswordState();
}

class _EnterEmailOnForgetPasswordState
    extends State<EnterEmailOnForgetPassword> {
  @override
  Widget build(BuildContext context) {
/*     final controller = Get.put(const verifyEmailController())
 */
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Enter",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: TColors.primary),
                              ),
                              Text(
                                "Your Email",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: TColors.primary),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                              width: 244,
                              child: Text(
                                  'to find any existant accounts with that email'))
                        ],
                      ),
                      Image(
                          image: AssetImage(
                              "assets/images/login_image/phone.png")),
                    ],
                  ),
                  //Form
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      //Send code button
                      Container(
                          width: 214,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              PasswordRest,
                            },
                            child: Text(
                              "Reset Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: TColors.primary),
                          )),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
