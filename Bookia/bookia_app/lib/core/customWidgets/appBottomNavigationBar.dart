import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/assets.dart';
import 'package:bookia_app/feature/Bookmarks/View/bookmarks_view.dart';
import 'package:bookia_app/feature/Home/Views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  AppBottomNavigationBarState createState() => AppBottomNavigationBarState();
}

class AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int currentIndex = 0;

  void _onItemTapped(int index) {
    if (currentIndex != index) {
      setState(() {
        currentIndex = index;
      });

      // Navigate based on the selected tab
      switch (index) {
        case 0:
          pushWithReplacement(context, const HomeView());

          break;
        case 1:
          push(context, const BookmarksView());
          // Handle navigation for Bookmark
          break;
        case 2:
          // Handle navigation for Cart
          break;
        case 3:
          // Handle navigation for Profile
          break;
        default:
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex, // Set the current index
      onTap: _onItemTapped, // Handle tap events
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.bookmark),
          label: 'Bookmark',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.category),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppAssets.profile),
          label: 'Profile',
        ),
      ],
    );
  }
}
