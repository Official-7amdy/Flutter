import 'package:bookia_app/feature/Home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/Home/data/models/response/slider_response_model/slider_response_model.dart';
import 'package:bookia_app/feature/Home/data/repo/home_repo.dart';
import 'package:bookia_app/feature/Wishlist/data/models/response/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetBestSellerEvent>(getBestSellerBooks);
    on<GetSliderEvent>(getSlider);
    add(GetSliderEvent());
    add(GetBestSellerEvent());
    on<AddToWishlistEvent>(addToWishlist);
    on<RemoveFromWishlistEvent>(removeFromWishlist);
    on<GetWishlistEvent>(getWishlist);
  }
  BestSellerResponseModel? bestSellerResponseModel;
  SliderResponseModel? sliderResponseModel;
  GetWishlistResponseModel? getWishlistResponseModel;


  Future<void> getBestSellerBooks(
      GetBestSellerEvent event, Emitter<HomeState> emit) async {
    emit(BestSellerLoadingState());

    try {
      final value = await HomeRepo.getBestSellerBooks();
      if (value != null) {
        bestSellerResponseModel = value;
        emit(BestSellerLoadedState());
      } else {
        emit(BestSellerErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(BestSellerErrorState());
    }
  }

  Future<void> getSlider(GetSliderEvent event, Emitter<HomeState> emit) async {
    emit(SliderLoadingState());

    try {
      final value = await HomeRepo.getSlider();
      if (value != null) {
        sliderResponseModel = value;
        emit(SliderLoadedState());
      } else {
        emit(SliderErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(SliderErrorState());
    }
  }

  Future<void> addToWishlist(
      AddToWishlistEvent event, Emitter<HomeState> emit) async {
    emit(AddToWishlistLoadingState());

    try {
      bool? value = await HomeRepo.addToWishlist(productId: event.productId);

      if (value == true) {
        emit(AddToWishlistLoadedState());
      } else {
        emit(AddToWishlistErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(AddToWishlistErrorState());
    }
  }

  Future<void> removeFromWishlist(
      RemoveFromWishlistEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromWishlistErrorState());

    try {
      bool? value =
          await HomeRepo.removeFromWishlist(productId: event.productId);

      if (value == true) {
        emit(RemoveFromWishlistLoadedState());
      } else {
        emit(RemoveFromWishlistErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(RemoveFromWishlistErrorState());
    }
  }

  
  Future<void> getWishlist(
      GetWishlistEvent event, Emitter<HomeState> emit) async {
    emit(GetWishlistLoadingState());

    try {
      final value = await HomeRepo.getWishlist();
      if (value != null) {
        getWishlistResponseModel = value;
        emit(GetWishlistLoadedState());
      } else {
        emit(GetWishlistErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(GetWishlistErrorState());
    }
  }
}
