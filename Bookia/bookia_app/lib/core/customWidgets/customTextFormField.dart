import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookia_app/core/utils/text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? validatorText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.validatorText,
    this.keyboardType,
    this.isPassword = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.contentPadding,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && _isObscured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validatorText ?? 'This field cannot be empty';
        }
        return null;
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.dmSerifDisplay(
          textStyle: getSmallHintTextStyle(),
        ),
        hintText: widget.hintText,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
      ),
    );
  }
}
