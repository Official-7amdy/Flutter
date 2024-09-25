import 'package:bookia_app/core/customWidgets/customButton.dart';
import 'package:bookia_app/core/utils/appColors.dart';
import 'package:bookia_app/core/utils/assets.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/feature/Home/presentation/bloc/home_bloc.dart';
import 'package:bookia_app/feature/cart/presentation/widgets/cartAppBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppbar(),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is RemoveFromCartLoadedState||State is UpdateCartLoadedState) {
            context.read<HomeBloc>().add(GetCartEvent());
          }
        },
        builder: (context, state) {
          if (state is GetCartLoadedState) {
            var cartBooks = context.read<HomeBloc>().getCartResponseModel?.data?.cartItems;
            var totalPrice = context.read<HomeBloc>().getCartResponseModel?.data?.total ?? 0.0;
            var itemCounts = context.read<HomeBloc>().getCartResponseModel?.data?.total??0;

            if (cartBooks == null || cartBooks.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppAssets.empty, width: 300, height: 300),
                    Text('Your Cart is Empty', style: getSmallTitleTextStyle()),
                  ],
                ),
              );
            }

           

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cartBooks.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(thickness: 3, color: Colors.grey[300]);
                      },
                     itemBuilder: (BuildContext context, int index) {
                var item = cartBooks[index];
                int itemCount = item.itemQuantity ?? 1; // Get the quantity of the current item

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          width: 120,
          height: 150,
          fit: BoxFit.cover,
          imageUrl: item.itemProductImage.toString(),
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
                    item.itemProductName.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${item.itemProductPrice}',
                    style: getBookDiscountPriceTextStyle(),
                  ),
                  Text(
                    '\$${item.itemProductPriceAfterDiscount}',
                    style: getBookPriceTextStyle(),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            itemCount++;
                            context.read<HomeBloc>().add(
                              UpdateCartEvent(
                                quantity: itemCount,
                                productId: item.itemId!,
                              ),
                            );
                          });
                       
                        },
                        mini: true,
                        backgroundColor: Colors.white,
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(width: 8),
                      Text('$itemCount', style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      FloatingActionButton(
                        onPressed: () {
                          if (itemCount > 1) {
                            setState(() {
                              itemCount--;
                              context.read<HomeBloc>().add(
                                UpdateCartEvent(
                                  quantity: itemCount,
                                  productId: item.itemId!,
                                ),
                              );
                            });
                           
                          }
                        },
                        mini: true,
                        backgroundColor: Colors.white,
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(
                    RemoveFromCartEvent(productId: item.itemId!));
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
  );
}

                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        'Total Price: \$${totalPrice}',
                        style: getBookPriceTextStyle(),
                      ),
                     
                      const Gap(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        
                    
                          CustomButton(
                            context,
                            color: AppColors.darkScaffoldBg,
                            width: 350,
                            text: "Checkout",
                            style: getSubDetailsButtonTextStyle(),
                            onPressed: () {
                              // Handle Checkout Action
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: LottieBuilder.asset(AppAssets.searching),
              ),
            );
          }
        },
      ),
    );
  }
}
