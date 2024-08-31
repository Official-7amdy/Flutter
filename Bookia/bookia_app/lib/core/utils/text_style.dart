

import 'package:flutter/material.dart';


TextStyle getTitleTextStyle(
  {double?  fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? 20.0,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,

    


);
  }
  
TextStyle getButtonTextStyle(
  {double?  fontSize, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: fontSize ?? 20.0,
      color: color ?? const Color.fromARGB(255, 255, 255, 255),
      fontWeight: fontWeight ?? FontWeight.normal,

    


);
  }