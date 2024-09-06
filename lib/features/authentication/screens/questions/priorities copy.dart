import 'package:flutter/material.dart';

import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/constants/text_strings.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:iconsax/iconsax.dart';

class priorities extends StatefulWidget {
  const priorities({super.key});

  @override
  State<priorities> createState() => _prioritiesState();
}

class _prioritiesState extends State<priorities> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [],
    )));
  }
}

class listOfGategorys extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const listOfGategorys({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });
  @override
  State<listOfGategorys> createState() => _listOfGategorys();
}

class _listOfGategorys extends State<listOfGategorys> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.all(TColors.secondary.withOpacity(0.2)),
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          onPressed: widget.onPressed,
          child: Row(
            children: [
              Transform.scale(
                  scale: 0.8, child: Icon(color: TColors.primary, widget.icon)),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.text,
                  style: TextStyle(color: TColors.primary, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
