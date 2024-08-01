import 'package:flutter/material.dart';
import 'package:saveit/utils/constants/colors.dart';

class EnterEmailOnForgetPassword extends StatefulWidget {
  const EnterEmailOnForgetPassword({super.key});

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
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                children: [
                  const Row(
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
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
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
                      SizedBox(
                          width: 214,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              /*     PasswordRest, */
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: TColors.primary),
                            child: const Text(
                              "Reset Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300),
                            ),
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
