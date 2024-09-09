
  import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';

AppBar bookmarkAppBar() {
    return AppBar(
      centerTitle:true,
      automaticallyImplyLeading: false,
      title: Text(
        "Favourite Books",
        style: getTitleTextStyle(),
      ),
    );
  }
