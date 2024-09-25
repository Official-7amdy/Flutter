part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

//Best Seller
class BestSellerLoadingState extends HomeState {}

class BestSellerLoadedState extends HomeState {}

class BestSellerErrorState extends HomeState {}

//Slider
class SliderLoadingState extends HomeState {}

class SliderLoadedState extends HomeState {}

class SliderErrorState extends HomeState {}

//Wishlist
class AddToWishlistLoadingState extends HomeState {}

class AddToWishlistLoadedState extends HomeState {}

class AddToWishlistErrorState extends HomeState {}

class RemoveFromWishlistLoadingState extends HomeState {}

class RemoveFromWishlistLoadedState extends HomeState {}

class RemoveFromWishlistErrorState extends HomeState {}

class GetWishlistLoadingState extends HomeState {}

class GetWishlistLoadedState extends HomeState {}

class GetWishlistErrorState extends HomeState {}


//Cart
class AddToCartLoadingState extends HomeState {}

class AddToCartLoadedState extends HomeState {}

class AddToCartErrorState extends HomeState {}

class RemoveFromCartLoadingState extends HomeState {}

class RemoveFromCartLoadedState extends HomeState {}

class RemoveFromCartErrorState extends HomeState {}

class GetCartLoadingState extends HomeState {}

class GetCartLoadedState extends HomeState {}

class GetCartErrorState extends HomeState {}


class UpdateCartLoadingState extends HomeState {}

class UpdateCartLoadedState extends HomeState {}

class UpdateCartErrorState extends HomeState {}


