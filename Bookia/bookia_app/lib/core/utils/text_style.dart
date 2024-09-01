

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle getTitleTextStyle(
  {double?  fontSize, Color? color, FontWeight? fontWeight}) {
    return  GoogleFonts.dmSerifDisplay(
      textStyle:  TextStyle(
      fontSize: fontSize ?? 30.0,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,


    )
);
  }
  TextStyle getSmallTitleTextStyle(
  {double?  fontSize, Color? color, FontWeight? fontWeight}) {
  return  GoogleFonts.dmSerifDisplay(
      textStyle:  TextStyle(
      fontSize: fontSize ?? 20.0,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,

      )

);
  }
   TextStyle getSmallHintTextStyle(
  {double?  fontSize, Color? color, FontWeight? fontWeight}) {
    return  GoogleFonts.dmSerifDisplay(
      textStyle:  TextStyle(
      fontSize: fontSize ?? 15.0,
      color: color ?? const Color(0xff8391A1),
      fontWeight: fontWeight ?? FontWeight.normal,

      )


);
  }

  TextStyle getSmallTextStyle(
  {double?  fontSize, Color? color, FontWeight? fontWeight}) {
    return  GoogleFonts.dmSerifDisplay(
      textStyle:  TextStyle(
      fontSize: fontSize ?? 15.0,
      color: color ?? const Color(0xff6A707C),
      fontWeight: fontWeight ?? FontWeight.normal,

      )


);
  }
  
  
TextStyle getButtonTextStyle(
  {double?  fontSize, Color? color, FontWeight? fontWeight}) {
   return  GoogleFonts.dmSerifDisplay(
      textStyle:  TextStyle(
      fontSize: fontSize ?? 15.0,
      color: color ?? const Color.fromARGB(255, 255, 255, 255),
      fontWeight: fontWeight ?? FontWeight.normal,

    
      )

);
  }