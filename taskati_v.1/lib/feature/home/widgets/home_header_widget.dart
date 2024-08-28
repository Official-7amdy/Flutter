import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati_8_19/core/functions/navigation.dart';
import 'package:taskati_8_19/core/services/local_storage.dart';
import 'package:taskati_8_19/core/utils/colors.dart';
import 'package:taskati_8_19/core/utils/text_style.dart';
import 'package:taskati_8_19/feature/profile/profile_view.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${AppLocalStorage.getCachedData(AppLocalStorage.kName)}',
              style: getTitleTextStyle(color: AppColors.primaryColor),
            ),
                    Text(
            DateTime.now().hour < 12 
                ? 'Good Morning,'
                : DateTime.now().hour < 18 
                    ? 'Good Afternoon, '
                    : 'Good Evening, ',
            style: getBodyTextStyle(),
          )

          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            push(context, const ProfileView());
          },
          child: CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.primaryColor,
            backgroundImage: AppLocalStorage.getCachedData(
                        AppLocalStorage.kImage) !=
                    null
                ? FileImage(
                    File(AppLocalStorage.getCachedData(AppLocalStorage.kImage)))
                : const AssetImage('assets/user.png'),
          ),
        )
      ],
    );
  }
}
