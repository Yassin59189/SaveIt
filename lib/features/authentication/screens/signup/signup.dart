import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saveit/data/repositories/category_repository.dart';
import 'package:saveit/features/authentication/controllers/sign%20up/signup_controller.dart';
import 'package:saveit/features/authentication/screens/login/login.dart';
import 'package:saveit/features/authentication/screens/questions/mainQuestionScreen.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/validators/validation.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                          width: 150,
                          child: Image.asset(
                              "assets/images/login_image/signup.png")),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi!",
                            style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: TColors.primary),
                          ),
                          Text(
                            "Register yourself!",
                            style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                color: TColors.primary),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              // Signup title

              const SizedBox(
                height: 30,
              ),
              // Form
              const SignupForm(),
              const SizedBox(
                height: 20,
              ),

              // Create account
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Nunito'),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Nunito'),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      child: Form(
          key: controller.signupFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.fullname,
                validator: (value) =>
                    TValidator.validateEmptyText('Full name', value),
                decoration: InputDecoration(
                    labelText: "Full name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: controller.verifPassword,
                validator: (value) {
                  if (value != controller.password.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Repeat password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(
                height: 20,
              ),
              // Sign up button
              SizedBox(
                width: 214,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    /* controller.signup(); */
                    Get.to(QuestionConcerns());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.primary),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

/* void addPredefinedCategories() async {
  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId != null) {
    final categoryRepository = CategoryRepository();
    try {
      await categoryRepository.addPredefinedCategories(userId);
      print('Predefined categories added successfully');
    } catch (e) {
      print('Error adding predefined categories: $e');
    }
  } else {
    print('User is not authenticated');
  }
} */
