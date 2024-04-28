import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saveit/utils/constants/buttons.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/image_strings.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/helpers/helper_functions.dart';

class mainStore extends StatefulWidget {
  const mainStore({super.key});

  @override
  State<mainStore> createState() => _mainStoreState();
}

class _mainStoreState extends State<mainStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("hello 1"),
              onTap: () {},
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: THelperFunctions.screenWidth(),
            height: THelperFunctions.screenHeight() * 0.15,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(TImage.sthead),
              /* fit: BoxFit.contain, */
              fit: BoxFit.fill,
            )),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: SizedBox(
                    width: 124,
                    height: 103,
                    child: IconButton(
                      hoverColor: const Color.fromARGB(117, 10, 106, 203),
                      style: logostore,
                      icon: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(TImage.horizantalwhiteLogo),
                          fit: BoxFit.fitWidth,
                        )),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                    child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        hoverColor: const Color.fromARGB(117, 10, 106, 203),
                        style: logostore,
                        icon: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(TImage.horizantalwhiteLogo),
                            fit: BoxFit.fitWidth,
                          )),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: IconButton(
                        hoverColor: const Color.fromARGB(117, 10, 106, 203),
                        style: logostore,
                        icon: Icon(Icons.menu_rounded),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
