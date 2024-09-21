import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/navigation.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookdetailsView extends StatefulWidget {
  const BookdetailsView({super.key, required this.book});
  final book;

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
    setState(() {
      isBookmarked = !isBookmarked;
      isBookmarked ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Details',
          style: getTitleTextStyle(),
        ),
        actions: [
          IconButton(
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Icon(
                isBookmarked
                    ? Icons.bookmark // Filled bookmark icon
                    : Icons.bookmark_add_outlined, // Outline bookmark
                key: ValueKey<bool>(isBookmarked), // Key differentiates icons
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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    children: [
                      const Gap(25),
                      Hero(
                        tag: widget.book.id,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: widget.book?.image ?? '',
                            height: 380,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Gap(20),
                          Text(
                            widget.book?.name ?? '',
                            style: getSubTitleTextStyle(),
                            textAlign: TextAlign.center,
                          ),
                          const Gap(30),
                          Text(
                            widget.book?.description ?? '',
                            style: getDescriptionTextStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Price and buttons at the bottom
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price Before Discount: ${widget.book?.price ?? ''}',
                  style: getBookDiscountPriceTextStyle(),
                ),
                Text(
                  'Price After Discount: ${widget.book?.priceAfterDiscount ?? ''}',
                  style: getBookPriceTextStyle(),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
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
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
