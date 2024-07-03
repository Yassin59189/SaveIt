import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saveit/features/authentication/screens/login/forgotPassword.dart';
import 'package:saveit/features/authentication/screens/signup/signup.dart';
import 'package:saveit/utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/logos/logo_colors.png")),
              Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  child: Row(
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
                      Container(
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
              Container(
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
                              shape: CircleBorder(),
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
                              Get.to(EnterEmailOnForgetPassword());
                            },
                            child: Text(
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
                    Container(
                        width: 214,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: TColors.primary),
                        )),
                    //Create account
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You don't have an account?",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Nunito'),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(SignupScreen());
                              },
                              child: Text(
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
