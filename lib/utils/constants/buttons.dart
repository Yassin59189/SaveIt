import 'package:flutter/material.dart';
import 'package:saveit/utils/constants/colors.dart';
import 'package:saveit/utils/constants/sizes.dart';

final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(206.35, 54.04),
    backgroundColor: TColors.primary,
    elevation: 0,
    textStyle: const TextStyle(
        fontFamily: "nunito",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontMd,
        color: TColors.white));

final ButtonStyle buttonquestions = ElevatedButton.styleFrom(
    minimumSize: const Size(334.06, 60.52),
    backgroundColor: TColors.primary,
    elevation: 0,
    textStyle: const TextStyle(
        fontFamily: "nunito",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontMd,
        color: TColors.white));

final ButtonStyle buttonquestionSelected = ElevatedButton.styleFrom(
    minimumSize: const Size(334.06, 60.52),
    backgroundColor: TColors.secondary,
    elevation: 0,
    textStyle: const TextStyle(
        fontFamily: "nunito",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontMd,
        color: TColors.white));

final ButtonStyle buttonanContinueSecondary = ElevatedButton.styleFrom(
    minimumSize: const Size(203.34, 53.26),
    backgroundColor: TColors.accent,
    elevation: 0,
    textStyle: const TextStyle(
        fontFamily: "nunito",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontMd,
        color: TColors.white));
final ButtonStyle logostore = ElevatedButton.styleFrom(
  minimumSize: const Size(203.34, 53.26),
);
//vist Store
final ButtonStyle vistPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(82.04, 22),
    backgroundColor: TColors.primary,
    textStyle: const TextStyle(
        fontFamily: "nunito",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontexSm,
        color: TColors.white));
final ButtonStyle vistSecondary = ElevatedButton.styleFrom(
    minimumSize: const Size(25.94, 20.33),
    backgroundColor: TColors.accent,
    textStyle: const TextStyle(
        fontFamily: "nunito",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontexSm,
        color: TColors.white));
final ButtonStyle mdaccent = ElevatedButton.styleFrom(
    minimumSize: const Size(180.34, 51.71),
    backgroundColor: TColors.accent,
    textStyle: const TextStyle(
        fontFamily: "popins",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontexSm,
        color: TColors.white));
final ButtonStyle mdPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(180.34, 51.71),
    backgroundColor: TColors.primary,
    textStyle: const TextStyle(
        fontFamily: "popins",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontexSm,
        color: TColors.white));
final ButtonStyle mdDisabled = ElevatedButton.styleFrom(
    minimumSize: const Size(180.34, 51.71),
    backgroundColor: const Color.fromARGB(255, 63, 63, 65),
    textStyle: const TextStyle(
        fontFamily: "popins",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontexSm,
        color: TColors.white));
final ButtonStyle sSecondary = ElevatedButton.styleFrom(
    minimumSize: const Size(160.34, 40.71),
    backgroundColor: TColors.secondary,
    textStyle: const TextStyle(
        fontFamily: "popins",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontexSm,
        color: TColors.white));
final ButtonStyle sWhite = ElevatedButton.styleFrom(
    minimumSize: const Size(160.34, 40.71),
    backgroundColor: TColors.white,
    textStyle: const TextStyle(
        fontFamily: "popins",
        fontWeight: FontWeight.w600,
        fontSize: TSizes.fontexSm,
        color: TColors.white));
