import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:saveit/features/authentication/screens/home/home.dart';
import 'package:saveit/utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  
  const NavigationMenu({super.key});
  @override
  
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    
    return Scaffold(
      
      bottomNavigationBar: 
        Container(
          
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: TColors.secondary.withOpacity(0.2),
                blurRadius: 40,
                spreadRadius: 20
              )
            ]
          ),
          child: CurvedNavigationBar(
            
            onTap: (index){
              
              controller.selectedIndex.value = index;
            },
            
            backgroundColor: Colors.transparent,
            color: Color(0xFFF8F7FB),
            animationDuration: Duration(milliseconds: 300),
            items: [
            Icon(Icons.percent,
            color: TColors.secondary,),
            Icon(Icons.person,
            color: TColors.secondary,),
            Icon(Icons.shop,
            color: TColors.secondary,),
          ]),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      );
      
      
    
  }
}
class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 1.obs;  
  final screens = [Container(color: const Color.fromARGB(255, 226, 226, 226),),HomeScreen(),Container(color: const Color.fromARGB(255, 206, 10, 10),)];
}