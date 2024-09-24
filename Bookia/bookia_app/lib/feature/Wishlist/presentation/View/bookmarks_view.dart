import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/assets.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/Wishlist/presentation/Widgets/bookmarkAppBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class BookmarksView extends StatefulWidget {
  const BookmarksView({super.key});

  @override
  State<BookmarksView> createState() => _BookmarksViewState();
}

class _BookmarksViewState extends State<BookmarksView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetWishlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bookmarkAppBar(),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is RemoveFromWishlistLoadedState) {
            context.read<HomeBloc>().add(GetWishlistEvent());
          }
        },
        builder: (context, state) {
          if (state is GetWishlistLoadedState) {
            var wishlistBooks = context.read<HomeBloc>().getWishlistResponseModel?.data?.data;

            if (wishlistBooks == null || wishlistBooks.isEmpty) {
              // Display a message when the wishlist is empty
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppAssets.empty, width: 300, height: 300),
                     Text(
                      'Your Wishlist is Empty',
                      style: getSmallTitleTextStyle()
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                itemCount: wishlistBooks.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(thickness: 3, color: Colors.grey[300]);
                },
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            width: 120,
                            height: 150,
                            fit: BoxFit.cover,
                            imageUrl: wishlistBooks[index].image.toString(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(20),
                                    Text(
                                      wishlistBooks[index].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '\$ ${wishlistBooks[index].price}',
                                      style: getBookPriceTextStyle(),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      wishlistBooks[index].description.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Gap(10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomButton(
                                          context,
                                          onPressed: () {},
                                          text: 'Add To Cart',
                                          width: 200,
                                          hight: 40,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<HomeBloc>()
                                      .add(RemoveFromWishlistEvent(productId: wishlistBooks[index].id!));
                                },
                                icon: const Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: AppColors.redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            // Show a loading animation if the state is not loaded
            return Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: LottieBuilder.asset(
                  AppAssets.searching,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
