part of 'home_bloc.dart';

class HomeEvent {}

class GetBestSellerEvent extends HomeEvent {}

class GetSliderEvent extends HomeEvent {}

class AddToWishlistEvent extends HomeEvent {
  final int productId;

  AddToWishlistEvent({required this.productId});
}

class RemoveFromWishlistEvent extends HomeEvent {
  final int productId;
  RemoveFromWishlistEvent({required this.productId});
}

class GetWishlistEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {
  final int productId;

  AddToCartEvent({required this.productId});
}

class RemoveFromCartEvent extends HomeEvent {
  final int productId;
  RemoveFromCartEvent({required this.productId});
}

class UpdateCartEvent extends HomeEvent {
  final int productId;
  final dynamic quantity;

  UpdateCartEvent({required this.productId, required this.quantity});
}

class GetCartEvent extends HomeEvent {}

class GetProfileEvent extends HomeEvent {}
