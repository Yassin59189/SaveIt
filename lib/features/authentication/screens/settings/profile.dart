import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/common/widgets/appbar/appbar.dart';
import 'package:saveit/utils/constants/colors.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: TColors.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [Image(image: AssetImage("assets/logos/logo_horizontal.png"))],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    color: TColors.primary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: TColors.primary,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
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
                    icon: Icon(Iconsax.edit_2, color: TColors.primary),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              // Connected Accounts
              settings_button(
                  text: 'Connected Accounts',
                  icon: Iconsax.link,
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06),
              const SizedBox(
                height: 10,
              ),
              // Privacy and Security
              settings_button(
                  text: 'Privacy and Security',
                  icon: Iconsax.security,
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06),
              const SizedBox(
                height: 10,
              ),
              // Login Settings
              settings_button(
                  text: 'Login Settings',
                  icon: Iconsax.key,
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06),
              const SizedBox(
                height: 10,
              ),
              // Service Center
              settings_button(
                  text: 'Service Center',
                  icon: Iconsax.message_question,
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 40,
              ),
              // Delete Account
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    customBorder: CircleBorder(),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: TColors.accent, width: 1)),
                        child: Center(
                          child: Icon(
                            Iconsax.trash,
                            color: TColors.accent,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8), // Space between the icon and text
                  Text("Delete Account",
                      style: TextStyle(
                        color: TColors.accent,
                        fontSize: 16,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class settings_button extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;
  final double height;
  const settings_button({
    super.key,
    required this.text,
    required this.icon,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              elevation: MaterialStateProperty.all<double>(0),
              side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: TColors.secondary, width: 1)),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    icon,
                    color: TColors.secondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: TColors.secondary,
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Icon(
                Iconsax.arrow_right_3,
                size: 20,
                color: TColors.secondary,
              )
            ],
          )),
    );
  }
}
