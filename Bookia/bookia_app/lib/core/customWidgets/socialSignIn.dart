import 'package:bookia_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Social_SignIn extends StatelessWidget {
  const Social_SignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppAssets.facebookIcon,
                width: 30,
                height: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppAssets.googleIcon,
                width: 30,
                height: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppAssets.appleIcon,
                width: 30,
                height: 30,
              ))
        ],
      ),
    );
  }
}
