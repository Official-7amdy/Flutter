import 'package:bookia_app/core/customWidgets/appBottomNavigationBar.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Home/Widgets/bookList.dart';
import 'package:bookia_app/feature/Home/Widgets/homeCarousel.dart';
import 'package:bookia_app/feature/Home/Widgets/homeHeader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(),
      appBar: homeHeader(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const homeCarousel(),
              const Gap(20),
              Text('Popular Books', style: getTitleTextStyle(fontSize: 26)),
              const Gap(10),
              // Wrap ListView.builder in Expanded
              const BookList(),
              Text('New Collection', style: getTitleTextStyle(fontSize: 26)),
              const Gap(10),
              // Wrap ListView.builder in Expanded
              const BookList(),
            ],
          ),
        ),
      ),
    );
  }
}
