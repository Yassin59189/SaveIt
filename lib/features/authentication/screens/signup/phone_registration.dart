import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/features/authentication/controllers/sign%20up/signup_controller.dart';
import 'package:saveit/features/authentication/screens/signup/code_verify.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:saveit/utils/validators/validation.dart';

class PhoneRegistrationScreen extends StatelessWidget {
  const PhoneRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: const Column(
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
                                "Phone",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: TColors.primary),
                              ),
                              Text(
                                "Registration",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    color: TColors.primary),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                              width: 244,
                              child: Text(
                                  'Le lorem ipsum est en imprimerie une suite Le lorem '))
                        ],
                      ),
                      Image(
                          image: AssetImage(
                              "assets/images/login_image/phone.png")),
                    ],
                  ),
                  //Form
                  phoneRegistration()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class phoneRegistration extends StatelessWidget {
  const phoneRegistration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            IntlPhoneField(
              controller: controller.fullname,
              validator: (value) =>
                  TValidator.validatePhoneNumber(value as String?),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
              initialCountryCode: 'TN',
            ),
            const SizedBox(
              height: 5,
            ),
            //Send code button
            SizedBox(
                width: 214,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const CodeVerifyScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary),
                  child: const Text(
                    "Send code",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                )),
          ],
        ));
  }
}
