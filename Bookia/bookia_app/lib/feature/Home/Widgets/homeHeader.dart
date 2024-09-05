  import 'package:bookia_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar homeHeader() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        
        children: [
         Image.asset(
          AppAssets.logo,
          height: 40,
         ),
         const Spacer(),
         
         IconButton(onPressed: (){}, icon:SvgPicture.asset(AppAssets.notification,width: 24)),
         IconButton(onPressed: (){}, icon:SvgPicture.asset(AppAssets.search,width: 24,))

        ]
      ),
  );
  }