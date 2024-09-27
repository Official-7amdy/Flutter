import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Home/presentation/Views/bookDetails_view.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetBestSellerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is BestSellerLoadingState || current is BestSellerLoadedState,
      builder: (context, state) {
        if (state is BestSellerLoadingState) {
          // Skeleton loading screen while data is being fetched
          return Skeletonizer(
            enabled: true,
            effect: const ShimmerEffect(
              highlightColor: Color.fromARGB(255, 49, 48, 48),
              duration: Duration(seconds: 2),
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
                    child: Container(
                      height: 350,
                      width: 200,
                      decoration: BoxDecoration(
                        color: AppColors.bookListcolor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }

        if (state is BestSellerLoadedState) {
          var books =
              context.read<HomeBloc>().bestSellerResponseModel?.data?.products;

          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: books?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      push(
                          context,
                          BookdetailsView(
                            product: books![index],
                          ));
                    },
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
                                Hero(
                                  tag: books?[index].id ?? '',
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            books?[index].image ?? ''),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                const Gap(15),
                                Text(
                                  books?[index].name ?? '',
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
                                      '\$ ${books?[index].priceAfterDiscount?.toString() ?? ' '}',
                                      style: getBookPriceTextStyle(),
                                    ),
                                    BookListButton(
                                      context,
                                      text: 'Buy',
                                      onPressed: () {
                                        // Action on button press
                                        context.read<HomeBloc>().add(
                                            AddToCartEvent(
                                                productId:
                                                    books![index].id ?? 0));
                                        //add to cart
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Added To Cart Sucessfully'),
                                            backgroundColor:
                                                AppColors.primaryColor,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
