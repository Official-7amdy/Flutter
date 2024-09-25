import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class profile_options extends StatelessWidget {
  const profile_options({
    super.key,
    required this.HeadText,
    required this.SubText,
  });
  final String HeadText;
  final String SubText;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Gap(30),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              HeadText,
              style: getSmallTitleTextStyle(),
            ),
            const SizedBox(height: 10),
            Text(
              SubText,
              style: getSmallHintTextStyle(),
            ),
          ]),
          Spacer(),
          Row(children: [
            Icon(
              color: AppColors.primaryColor,
              Icons.arrow_forward_ios_rounded,
            )
          ]),
        ],
      ),
      SizedBox(
        height: 30,
      )
    ]);
  }
}
