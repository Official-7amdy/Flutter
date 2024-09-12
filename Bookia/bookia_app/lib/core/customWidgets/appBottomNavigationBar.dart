import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
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

  // A list of screens corresponding to each tab
  final List<Widget> screens = [
    const HomeView(),
    const BookmarksView(),
    // Add other views like Cart, Profile, etc.
  ];

  void _onItemTapped(int index) {
    if (index != currentIndex) {
      // Only navigate if the selected tab is different from the current one
      setState(() {
        currentIndex = index;
      });

      // Navigate to the corresponding screen based on index
      pushWithReplacement(context, screens[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define your active and inactive colors
    Color activeColor = AppColors.primaryColor;
    Color inactiveColor = AppColors.blackColor;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex, // Set the current index
      onTap: _onItemTapped, // Handle tap events
      showSelectedLabels: false, // Hide selected labels
      showUnselectedLabels: false, // Hide unselected labels
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.home,
            color: currentIndex == 0 ? activeColor : inactiveColor, // Change color based on active index
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.bookmark,
            color: currentIndex == 1 ? activeColor : inactiveColor, // Change color based on active index
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.category,
            color: currentIndex == 2 ? activeColor : inactiveColor, // Change color based on active index
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.profile,
            color: currentIndex == 3 ? activeColor : inactiveColor, // Change color based on active index
          ),
          label: '',
        ),
      ],
    );
  }
}
