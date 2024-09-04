import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/features/authentication/screens/New_Transaction/new_transaction.dart';
import 'package:saveit/features/authentication/screens/Store/mainpage.dart';
import 'package:saveit/features/authentication/screens/home/home.dart';
import 'package:saveit/features/authentication/screens/home/wallet.dart';
import 'package:saveit/features/authentication/screens/settings/profile.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: TColors.secondary.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: TColors.accent,
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return TextStyle(
                    color: TColors.accent, // Selected label color
                    fontWeight: FontWeight.bold, // Bold selected label
                  );
                }
                return TextStyle(
                  color: TColors.primary, // Unselected label color
                );
              },
            ),
          ),
          child: NavigationBar(
            elevation: 1.0,
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: TColors.primary,
                ),
                label: 'E-Shop',
              ),
              NavigationDestination(
                icon: Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Icon(
                    Iconsax.wallet_25,
                    color: TColors.primary,
                  ),
                ),
                label: 'Wallet',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.home_filled,
                  color: TColors.primary,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Iconsax.add_circle5,
                  color: TColors.primary,
                ),
                label: 'New',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.settings,
                  color: TColors.primary,
                ),
                label: 'Settings',
              ),
            ],
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            selectedIndex: currentPageIndex,
            backgroundColor: TColors.white,
            animationDuration: Duration(milliseconds: 500),
          ),
        ),
      ),
      body: [
        const mainStore(),
        const Wallet(),
        const HomeScreen(),
        const NewTransaction(),
        const Profile(),
      ][currentPageIndex],
    );
  }
}
