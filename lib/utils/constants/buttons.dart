import 'package:flutter/material.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';

final ButtonStyle  buttonPrimary = ElevatedButton.styleFrom(
minimumSize: Size(206.35,54.04),
backgroundColor: TColors.primary,

elevation: 0,
textStyle: TextStyle(fontFamily:"nunito", fontWeight: FontWeight.w600, fontSize: TSizes.fontMd, color:TColors.white)


);
final ButtonStyle  buttonquestions = ElevatedButton.styleFrom(
minimumSize: Size(334.06,60.52),
backgroundColor: TColors.primary,

elevation: 0,
textStyle: TextStyle(fontFamily:"nunito", fontWeight: FontWeight.w600, fontSize: TSizes.fontMd, color:TColors.white)


);
final ButtonStyle  buttonanContinueSecondary = ElevatedButton.styleFrom(
minimumSize: Size(203.34,53.26),
backgroundColor: TColors.accent,

elevation: 0,
textStyle: TextStyle(fontFamily:"nunito", fontWeight: FontWeight.w600, fontSize: TSizes.fontMd, color:TColors.white)


);