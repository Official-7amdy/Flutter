
import 'package:flutter/material.dart';

TextStyle getTitleTextStyle({double? fontSize,Color? colors}){
  return  TextStyle(
                    fontSize:fontSize?? 45,
                    color:colors?? Colors.black,
                    fontWeight: FontWeight.w700,
                  );

  
}