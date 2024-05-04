import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/utils/constants/sizes.dart';
import 'package:saveit/utils/device/device_utility.dart';

class SAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SAppBar({
    super.key,
    this.showBackArrow=false,
    this.leadingOnPressed,
    this.leadingIcon,
    this.title,
    this.actions,});
    final Widget ? title;
    final bool showBackArrow;
    final VoidCallback ? leadingOnPressed;
    final IconData? leadingIcon;
    final List<Widget>? actions;
  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.only(top: 15, left: 5, right: 5),
    child: AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: showBackArrow ? IconButton(onPressed: ()=>Get.back(), icon: const Icon(Iconsax.arrow_left))
       : leadingIcon!=null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
      title: title,
      actions: actions,
    ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}