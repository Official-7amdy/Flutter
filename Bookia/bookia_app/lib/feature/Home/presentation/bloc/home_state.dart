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
