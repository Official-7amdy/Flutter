import 'dart:async'; // Add this for the Timer
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  HomeCarouselState createState() => HomeCarouselState();
}

class HomeCarouselState extends State<HomeCarousel> {
  final PageController _pageController = PageController(initialPage: 0);
  final int _numPages = 2; // Number of carousel items
  Timer? _carouselTimer;

  @override
  void initState() {
    super.initState();
    // Start the timer to automatically change pages every 3 seconds
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _carouselTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      int nextPage = _pageController.page!.toInt() + 1;
      if (nextPage >= _numPages) {
        nextPage = 0; // Loop back to the first page
      }
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose(); // Dispose the controller to prevent memory leaks
    _carouselTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: PageView.builder(
              pageSnapping: true,
              controller: _pageController,
              itemCount: _numPages,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/books.png',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: SizedBox(
                        width: 200,
                        height: 100,
                        child: Text(
                          "Uncover the perfect books to read when you have no idea where to start!",
                          style: getCarouselTextStyle(),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 10,
                      child: WhiteCarouselButton(
                        context,
                        onPressed: () {},
                        text: 'Explore',
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _pageController, // Connect the controller here
            count: _numPages, // Set the correct number of pages
            effect: const ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
              dotColor: AppColors.accentColor,
              activeDotColor: AppColors.primaryColor,
            ), // Your preferred effect
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
