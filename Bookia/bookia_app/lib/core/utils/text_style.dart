import 'package:bookia_app/core/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTitleTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.dmSerifDisplay(
      textStyle: TextStyle(
    fontSize: fontSize ?? 30.0,
    color: color ?? AppColors.blackColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  ));
}

TextStyle getSubTitleTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.dmSerifDisplay(
      textStyle: TextStyle(
    fontSize: fontSize ?? 25.0,
    color: color ?? AppColors.secondaryColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  ));
}

TextStyle getBookPriceTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.dmSerifDisplay(
      textStyle: TextStyle(
    fontSize: fontSize ?? 20.0,
    color: color ?? AppColors.secondaryColor,
    fontWeight: fontWeight ?? FontWeight.bold,
  ));
}

TextStyle getCarouselTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.dmSerifDisplay(
      textStyle: TextStyle(
    fontSize: fontSize ?? 17.0,
    color: color ?? const Color.fromARGB(255, 255, 255, 255),
    fontWeight: fontWeight ?? FontWeight.normal,
  ));
}

TextStyle getSmallTitleTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.dmSerifDisplay(
      textStyle: TextStyle(
    fontSize: fontSize ?? 20.0,
    color: color ?? Colors.black,
    fontWeight: fontWeight ?? FontWeight.normal,
  ));
}

TextStyle getSmallHintTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.dmSerifDisplay(
      textStyle: TextStyle(
    fontSize: fontSize ?? 15.0,
    color: color ?? const Color(0xff8391A1),
    fontWeight: fontWeight ?? FontWeight.normal,
  ));
}

TextStyle getSmallTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.dmSerifDisplay(
      textStyle: TextStyle(
    fontSize: fontSize ?? 15.0,
    color: color ?? const Color(0xff6A707C),
    fontWeight: fontWeight ?? FontWeight.normal,
  ));
}

TextStyle getButtonTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.dmSerifDisplay(
      textStyle: TextStyle(
    fontSize: fontSize ?? 15.0,
    color: color ?? const Color.fromARGB(255, 255, 255, 255),
    fontWeight: fontWeight ?? FontWeight.normal,
  ));
}

TextStyle getSmallButtonTextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.dmSerifDisplay(
      textStyle: TextStyle(
    fontSize: fontSize ?? 18.0,
    color: color ?? AppColors.whiteColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  ));
}
