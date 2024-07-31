import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:saveit/features/authentication/controllers/login/login_controller.dart';
import 'package:saveit/features/authentication/screens/login/forgotPassword.dart';
import 'package:saveit/features/authentication/screens/signup/signup.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/validators/validation.dart';

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
              // Form
              LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Container(
      width: MediaQuery.of(context).size.width - 60,
      child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              //Email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
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
                controller: controller.password,
                validator: (value) =>
                    TValidator.validateEmptyText('Password', value),
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
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value,
                          shape: CircleBorder(),
                        ),
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
              //Sign in

              Container(
                  width: 214,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
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
              const SizedBox(
                height: 20,
              ),

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
    );
  }
}
