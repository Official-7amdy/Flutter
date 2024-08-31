import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(BuildContext context, {
    super.key,
    this.width,
    this.hight,
    required this.text,
    required this.onPressed,
  });
  final double? width;
  final double? hight;
  final String text;
  final Function() onPressed;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 50,
      width: width ??  MediaQuery.sizeOf(context).width / 1.1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.dmSerifDisplay(
                  textStyle: getButtonTextStyle()
                 ),
          )),
    );
  }
}
class WhiteCustomButton extends CustomButton{
  const WhiteCustomButton(super.context, {super.key, required super.text, required super.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 50,
      width: width ??  MediaQuery.sizeOf(context).width / 1.1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            
            style: GoogleFonts.dmSerifDisplay(
                  textStyle: getButtonTextStyle(color:AppColors.secondaryColor)
                 ),
            
          )),
    );
  }
}