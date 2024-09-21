import 'dart:async'; // Add this for the Timer
import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  HomeCarouselState createState() => HomeCarouselState();
}
class HomeCarouselState extends State<HomeCarousel> {
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _carouselTimer;

  @override
  void initState() {
    super.initState();
    // Start auto-scroll
    
  }

  @override
  void dispose() {
    _pageController.dispose();
    _carouselTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is SliderLoadedState || current is SliderLoadingState,
      builder: (context, state) {
        var slider = context.read<HomeBloc>().sliderResponseModel?.data;

        if (state is SliderLoadedState && slider != null && slider.sliders!.isNotEmpty) {
          return Center(
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: PageView.builder(
                    pageSnapping: true,
                    controller: _pageController,
                    itemCount: slider.sliders?.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  slider.sliders?[index].image ?? 'fallback_image_url',
                                ),
                              ),
                            ),
                          ),
                          // Positioned elements...
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: slider.sliders!.length,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    dotColor: AppColors.accentColor,
                    activeDotColor: AppColors.primaryColor,
                  ),
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
        } else {
          return Center(child: Text('No books found'));
        }
      },
    );
  }
}
