import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

AppBar cartAppbar() {
  return AppBar(
    backgroundColor: AppColors.whiteColor,
    centerTitle: true,
    title: Text(
      'Cart',
      style: getTitleTextStyle(),
    ),
  );
}
