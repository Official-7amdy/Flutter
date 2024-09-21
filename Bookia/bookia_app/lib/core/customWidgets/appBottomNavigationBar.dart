import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/assets.dart';
import 'package:bookia_app/feature/Bookmarks/View/bookmarks_view.dart';
import 'package:bookia_app/feature/Home/presentation/Views/home_view.dart';
import 'package:bookia_app/feature/category/category_view.dart';
import 'package:bookia_app/feature/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  AppBottomNavigationBarState createState() => AppBottomNavigationBarState();
}
class AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  // Keep track of cached screens to avoid re-creating them
  int currentIndex = 0;

   List<Widget> screens = [
    const HomeView(),
    const BookmarksView(),
    const CategoryView(),
    const ProfileView()
   
  ];



  @override
  Widget build(BuildContext context) {
    Color activeColor = AppColors.primaryColor;
    Color inactiveColor = AppColors.blackColor;

     return Scaffold(
      body: screens[
        currentIndex
      ],
      bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
        enableFeedback: false,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.home,
          ),
          activeIcon: SvgPicture.asset(
            AppAssets.home,
            colorFilter:
            
            const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            
          ) ,
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.bookmark,
            
          ),
            activeIcon: SvgPicture.asset(
            AppAssets.bookmark,
            colorFilter:
            
            const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            
          ) ,
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.category,
    
          ),
            activeIcon: SvgPicture.asset(
            AppAssets.category,
            colorFilter:
            
            const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            
          ) ,
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.profile,
       
          ),
            activeIcon: SvgPicture.asset(
            AppAssets.profile,
            colorFilter:
            
            const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            
          ) ,
          label: '',
        ),
      ],
      )
    );
  }
}
