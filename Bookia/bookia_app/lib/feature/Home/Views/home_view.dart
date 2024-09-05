import 'package:bookia_app/feature/Home/Widgets/homeHeader.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeHeader(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: CarouselView(
          controller: CarouselController(
            
          ),
          itemExtent: 430,
          shrinkExtent: 200,
          children: List<Widget>.generate(2, (int index) {
            return Container(
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
            );
          }),
        ),
      ),
    )
          ]
          ),
          ),

    );
  }


}