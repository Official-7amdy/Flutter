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