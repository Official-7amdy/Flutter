import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Home/presentation/Views/bookDetails_view.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen:( previous,  current) => current is BestSellerLoadingState || current is BestSellerLoadedState,

      builder: (context, state) {

        if (state is BestSellerLoadingState) {
          // Display a skeleton loading screen while the data is being fetched
          return Skeletonizer(
            enabled: true,
            effect:const ShimmerEffect(
              highlightColor: Color.fromARGB(255, 49, 48, 48),
              duration: Duration(seconds: 2)
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4, // Placeholder skeleton count
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
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }

        if (state is BestSellerLoadedState) {
          var books = context.read<HomeBloc>().bestSellerResponseModel?.data;
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: books?.products?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var book = books?.products?[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BookdetailsView(book: book)),
                            );
                        },
                        child: Container(
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
                                Hero(
                                  tag: book?.id ?? '',
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            book?.image ?? ''),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                const Gap(15),
                                Text(
                                  book?.name ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: getSubTitleTextStyle(),
                                ),
                                const Gap(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                    '\$ ${book?.priceAfterDiscount?.toString() ?? ' '}',
                      
                                      style: getBookPriceTextStyle(),
                                    ),
                                    BookListButton(
                                      context,
                                      text: 'Buy',
                                      onPressed: () {
                                        // Add your action here
                                        print('Buy ${book?.name}');
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
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

        return const SizedBox(); // Empty widget when no state is loaded
      },
    );
  }
}
