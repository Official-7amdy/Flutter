import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/assets.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380, // Set a fixed height for the ListView
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                Container(
                  height: 350,
                  width: 200,
                  decoration: BoxDecoration(
                    color: AppColors.bookListcolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(AppAssets.republic),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const Gap(10),
                        Text('The Republic', style: getSubTitleTextStyle()),
                        const Gap(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('400 EGP', style: getBookPriceTextStyle()),
                            BookListButton(
                              context,
                              text: 'Buy',
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
