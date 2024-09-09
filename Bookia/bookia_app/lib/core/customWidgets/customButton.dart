import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    BuildContext context, {
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
      width: width ?? MediaQuery.sizeOf(context).width / 1.1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(text, style: getButtonTextStyle())),
    );
  }
}

class WhiteCustomButton extends CustomButton {
  const WhiteCustomButton(super.context,
      {super.key, required super.text, required super.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 50,
      width: width ?? MediaQuery.sizeOf(context).width / 1.1,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(text,
              style: getButtonTextStyle(color: AppColors.blackColor))),
    );
  }
}

class WhiteCarouselButton extends CustomButton {
  const WhiteCarouselButton(super.context,
      {super.key, required super.text, required super.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 30,
      width: width ?? MediaQuery.sizeOf(context).width / 4,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(text,
              style: getButtonTextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.w700))),
    );
  }
}

class BookListButton extends CustomButton {
  const BookListButton(super.context,
      {super.key, required super.text, required super.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 30,
      width: width ?? 80,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
          onPressed: onPressed,
          child: Text(text,
              style: getSmallButtonTextStyle(fontWeight: FontWeight.w400))),
    );
  }
}
