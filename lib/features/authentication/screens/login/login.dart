import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/features/authentication/screens/login/forgotPassword.dart';
import 'package:saveit/features/authentication/screens/signup/signup.dart';
import 'package:saveit/utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/logos/logo_colors.png")),
              Stack(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.w500,
                                color: TColors.primary),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Welcome back!",
                            style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.w500,
                                color: TColors.primary),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 100,
                          child: Image(
                            image: AssetImage(
                                "assets/images/login_image/login.png"),
                            width: 200,
                            height: 200,
                          ))
                    ],
                  ),
                ),
              ]),
              //Form
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                child: Form(
                    child: Column(
                  children: [
                    //Email
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Password
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    //Remeber me & forget passowrd
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Remember me
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {},
                              shape: const CircleBorder(),
                            ),
                            const Text(
                              "Remember me",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        //Forget password
                        TextButton(
                            onPressed: () {
                              Get.to(const EnterEmailOnForgetPassword());
                            },
                            child: const Text(
                              "Forget password?",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF0D0D0D)),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Sign in
                    SizedBox(
                        width: 214,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.primary),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                        )),
                    //Create account
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "You don't have an account?",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Nunito'),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(const SignupScreen());
                              },
                              child: const Text(
                                "Create one",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Nunito'),
                              ))
                        ],
                      ),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
