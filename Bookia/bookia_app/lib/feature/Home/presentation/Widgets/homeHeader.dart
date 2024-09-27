import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar homeHeader() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.whiteColor, // Set a fixed background color
    elevation: 0, // Optional: Remove shadow to keep it flat
    title: Row(
      children: [
        SvgPicture.asset(
          AppAssets.logo,
          height: 40,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            // Add notification action here
          },
          icon: SvgPicture.asset(
            AppAssets.notification,
            width: 24,
          ),
          padding: const EdgeInsets.all(
              8.0), // Adds some padding for a better hit area
        ),
        IconButton(
          onPressed: () {
            // Add search action here
          },
          icon: SvgPicture.asset(
            AppAssets.search,
            width: 24,
          ),
          padding:
              const EdgeInsets.all(8.0), // Same padding for consistent hit area
        ),
      ],
    ),
  );
}
