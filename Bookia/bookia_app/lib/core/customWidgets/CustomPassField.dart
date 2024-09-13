import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custompassfield extends StatefulWidget {
  final String customHintText;

  const Custompassfield(
      {super.key,
      required this.customHintText,
      TextEditingController? Textcontroller});

  @override
  State<Custompassfield> createState() => _CustompassfieldState();
}

class _CustompassfieldState extends State<Custompassfield> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.dmSerifDisplay(
          textStyle: getSmallHintTextStyle(),
        ),
        suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            }),
        hintText: widget.customHintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
