import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Home/data/models/response/best_seller_response_model/product.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BookdetailsView extends StatefulWidget {
  const BookdetailsView({super.key, required this.product});
  final Product product;

  @override
  _BookdetailsViewState createState() => _BookdetailsViewState();
}

class _BookdetailsViewState extends State<BookdetailsView>
    with SingleTickerProviderStateMixin {
  bool isBookmarked = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleBookmark() {
    if (widget.product.id != null) {
      setState(() {
        isBookmarked = !isBookmarked;
        isBookmarked ? _controller.forward() : _controller.reverse();

        if (isBookmarked) {
          context
              .read<HomeBloc>()
              .add(AddToWishlistEvent(productId: widget.product.id!));
        } else {
          context
              .read<HomeBloc>()
              .add(RemoveFromWishlistEvent(productId: widget.product.id!));
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product ID is missing.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AddToWishlistLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Added to Wishlist')),
          );
        } else if (state is RemoveFromWishlistLoadedState) {
          setState(() {
            isBookmarked = !isBookmarked;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Removed from Wishlist')),
          );
        } else if (state is AddToWishlistErrorState ||
            state is RemoveFromWishlistErrorState) {
          setState(() {
            isBookmarked = !isBookmarked;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update Wishlist')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Book Details', style: getTitleTextStyle()),
          actions: [
            IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
                  key: ValueKey<bool>(isBookmarked),
                  size: 30,
                  color: isBookmarked
                      ? AppColors.primaryColor
                      : AppColors.darkScaffoldBg,
                ),
              ),
              onPressed: toggleBookmark,
            ),
          ],
          leading: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const Gap(25),
                      Hero(
                        tag: widget.product.id ?? '',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.image ??
                                'https://placeholder.com/placeholder.png',
                            height: 380,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const Gap(20),
                      Text(
                        widget.product.name ?? '',
                        style: getSubTitleTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(30),
                      Text(
                        widget.product.description ?? '',
                        style: getDescriptionTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(30),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  topEnd: Radius.circular(20),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 30,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price Before Discount: ${widget.product.price ?? ''}',
                    style: getBookDiscountPriceTextStyle(),
                  ),
                  Text(
                    'Price After Discount: ${widget.product.priceAfterDiscount ?? ''}',
                    style: getBookPriceTextStyle(),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Implement share action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Share clicked')),
                          );
                        },
                        icon: const Icon(
                          Icons.ios_share,
                          color: AppColors.darkScaffoldBg,
                          size: 30,
                        ),
                      ),
                      CustomButton(
                        context,
                        color: AppColors.darkScaffoldBg,
                        width: 300,
                        text: "Buy Now",
                        style: getSubDetailsButtonTextStyle(),
                        onPressed: () {
                          // Placeholder for Buy Now action
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Buy Now clicked')),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
