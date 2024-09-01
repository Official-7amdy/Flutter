import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextFormField customTextFormField({String? hintText}) {
  return TextFormField(
    decoration: InputDecoration(
      hintStyle: GoogleFonts.dmSerifDisplay(
        textStyle: getSmallHintTextStyle(),
      ),
      hintText: hintText,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

TextFormField customPassTextFormField({String? hintText}) {
  return TextFormField(
    decoration: InputDecoration(
      hintStyle: GoogleFonts.dmSerifDisplay(
        textStyle: getSmallHintTextStyle(),
      ),
      suffixIcon: const Icon(Icons.visibility),
      hintText: hintText,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}