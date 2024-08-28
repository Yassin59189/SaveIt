import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/profile/profile_bg.png"),
        )),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.spaceBtsections),
                  child: SizedBox(
                    child: IconButton(
                        hoverColor: TColors.secondary,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_rounded)),
                  ),
                ),
                Container(
                  child: Image(
                      image: AssetImage("assets/logos/logo_horizontal.png")),
                )
              ],
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        color: TColors.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: TColors.primary,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Your Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: TColors.primary),
                        ),
                      ),
                      IconButton(
                        icon:
                            const Icon(Iconsax.edit_2, color: TColors.primary),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Connected Accounts
                  settings_button(
                      text: 'Notifications',
                      icon: Iconsax.notification,
                      width: screenWidth * 0.8,
                      onPressed: () {},
                      height: screenHeight * 0.06),
                  const SizedBox(
                    height: 10,
                  ),
                  // Privacy and Security
                  settings_button(
                      text: 'Privacy and Security',
                      onPressed: () {},
                      icon: Iconsax.security,
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.06),
                  const SizedBox(
                    height: 10,
                  ),
                  // Login Settings
                  settings_button(
                      text: 'Account Settings',
                      icon: Iconsax.key,
                      onPressed: () {},
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.06),
                  const SizedBox(
                    height: 10,
                  ),
                  // Service Center
                  settings_button(
                      text: 'Service Center',
                      icon: Iconsax.message_question,
                      onPressed: () {},
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.06),
                  const SizedBox(
                    height: 10,
                  ),
                  // Service Center
                  settings_button(
                      text: 'Language',
                      icon: Iconsax.global,
                      onPressed: () {},
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.06),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Delete Account
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 220,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text("Log Out",
                                            style: TextStyle(
                                              fontSize: TSizes.xl,
                                              color: TColors.accent,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "are you sure you want to log out?",
                                          style: TextStyle(
                                            fontSize: TSizes.fontLg,
                                            color: TColors.primary,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: mdDisabled,
                                                child: Text(
                                                  "Close",
                                                  style: TextStyle(
                                                    color: TColors.white,
                                                    fontSize: TSizes.fontMd,
                                                  ),
                                                )),
                                            ElevatedButton(
                                                onPressed: () {
                                                  AuthenticationRepository
                                                      .instance
                                                      .logout();
                                                },
                                                style: mdPrimary,
                                                child: Text(
                                                  "Yes",
                                                  style: TextStyle(
                                                    color: TColors.white,
                                                    fontSize: TSizes.fontMd,
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        customBorder: const CircleBorder(),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: TColors.accent, width: 1)),
                            child: const Center(
                              child: Icon(
                                Iconsax.logout,
                                color: TColors.accent,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 8), // Space between the icon and text
                      const Text("Log out",
                          style: TextStyle(
                            color: TColors.accent,
                            fontSize: 16,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class settings_button extends StatefulWidget {
  final String text;
  final IconData icon;
  final double width;
  final double height;
  final VoidCallback onPressed;
  const settings_button({
    super.key,
    required this.text,
    required this.icon,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  State<settings_button> createState() => _settings_buttonState();
}

class _settings_buttonState extends State<settings_button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.transparent),
              elevation: WidgetStateProperty.all<double>(0),
              side: WidgetStateProperty.all<BorderSide>(
                  const BorderSide(color: TColors.primary, width: 1)),
              padding: WidgetStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    widget.icon,
                    color: TColors.primary,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                          color: TColors.primary,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const Icon(
                Iconsax.arrow_right_3,
                size: 20,
                color: TColors.primary,
              )
            ],
          )),
    );
  }
}
