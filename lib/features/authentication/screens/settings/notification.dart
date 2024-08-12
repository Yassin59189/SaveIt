import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
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
                SizedBox(
                  width: screenWidth * 0.225,
                ),
                const Text(
                  "Notification",
                  style: TextStyle(
                      color: TColors.primary,
                      fontSize: TSizes.lg,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
            Column(
              children: [],
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class Notification_settings extends StatefulWidget {
  final String text;

  final double width;
  final double height;
  final VoidCallback onPressed;
  const Notification_settings({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  State<Notification_settings> createState() => _Notification_settingsState();
}

class _Notification_settingsState extends State<Notification_settings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(color: TColors.primary, fontSize: TSizes.fontMd),
            ),
            Transform.scale(
              scale: 0.8,
              child: Switch(
                  activeColor: Color.fromARGB(255, 255, 255, 255),
                  activeTrackColor: TColors.secondary,
                  inactiveTrackColor: Color.fromRGBO(177, 177, 177, 0.719),
                  inactiveThumbColor: TColors.white,
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      isSwitched ? widget.onPressed() : null;
                    });
                  }),
            )
          ],
        ));
  }
}
