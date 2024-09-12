import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar homeHeader() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor:AppColors.whiteColor, // Set a fixed background color
    elevation: 0, // Optional: Remove shadow to keep it flat
    title: Row(children: [
      Image.asset(
        AppAssets.logo,
        height: 40,
      ),
      const Spacer(),
      IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.notification, width: 24)),
      IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.search,
            width: 24,
          ))
    ]),
  );
}
