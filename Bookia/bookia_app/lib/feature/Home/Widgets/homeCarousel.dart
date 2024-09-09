import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: camel_case_types
class homeCarousel extends StatelessWidget {
  const homeCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: CarouselView(
              controller: CarouselController(
                initialItem: 0,
              ),
              itemExtent: 430,
              shrinkExtent: 200,
              children: List<Widget>.generate(2, (int index) {
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
                        )),
                    Positioned(
                        bottom: 30,
                        left: 10,
                        child: WhiteCarouselButton(
                          context,
                          onPressed: () {},
                          text: 'Explore',
                        )),
                  ],
                );
              }),
            ),
          ),
          SmoothPageIndicator(
              controller: PageController(), // PageController
              count: 6,
              effect: const ExpandingDotsEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  dotColor: AppColors.accentColor,
                  activeDotColor:
                      AppColors.primaryColor), // your preferred effect
              onDotClicked: (index) {})
        ],
      ),
    );
  }
}
