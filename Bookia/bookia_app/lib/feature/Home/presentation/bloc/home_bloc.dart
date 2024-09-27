import 'package:bookia_app/feature/Home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/Home/data/models/response/slider_response_model/slider_response_model.dart';
import 'package:bookia_app/feature/Home/data/repo/home_repo.dart';
import 'package:bookia_app/feature/Wishlist/data/models/response/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:bookia_app/feature/cart/data/models/response/get_cart_response_model/get_cart_response_model.dart';
import 'package:bookia_app/feature/profile/data/models/response/get_profile_response_model/get_profile_response_model.dart';
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
    on<AddToCartEvent>(addToCart);
    on<RemoveFromCartEvent>(removeFromCart);
    on<UpdateCartEvent>(updateCart);
    on<GetCartEvent>(getCart);
    on<GetProfileEvent>(getProfile);
  }
  BestSellerResponseModel? bestSellerResponseModel;
  SliderResponseModel? sliderResponseModel;
  GetWishlistResponseModel? getWishlistResponseModel;
  GetCartResponseModel? getCartResponseModel;
  GetProfileResponseModel?  getProfileResponseModel;

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

  //Wishlist

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

  //Cart

  Future<void> addToCart(AddToCartEvent event, Emitter<HomeState> emit) async {
    emit(AddToCartLoadingState());

    try {
      bool? value = await HomeRepo.addToCart(productId: event.productId);

      if (value == true) {
        emit(AddToCartLoadedState());
      } else {
        emit(AddToCartErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(AddToCartErrorState());
    }
  }

  Future<void> removeFromCart(
      RemoveFromCartEvent event, Emitter<HomeState> emit) async {
    emit(RemoveFromCartLoadingState());

    try {
      bool? value = await HomeRepo.removeFromCart(productId: event.productId);

      if (value == true) {
        emit(RemoveFromCartLoadedState());
      } else {
        emit(RemoveFromCartErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(RemoveFromCartErrorState());
    }
  }

  Future<void> updateCart(
      UpdateCartEvent event, Emitter<HomeState> emit) async {
    emit(UpdateCartLoadingState());

    try {
      bool? value = await HomeRepo.updateCart(
          productId: event.productId, quantity: event.quantity);

      if (value == true) {
        emit(UpdateCartLoadedState());
      } else {
        emit(UpdateCartErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(UpdateCartErrorState());
    }
  }

  Future<void> getCart(GetCartEvent event, Emitter<HomeState> emit) async {
    emit(GetCartLoadingState());

    try {
      final value = await HomeRepo.getCart();
      if (value != null) {
        getCartResponseModel = value;
        emit(GetCartLoadedState());
      } else {
        emit(GetCartErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(GetCartErrorState());
    }
  }

  
  Future<void> getProfile(GetProfileEvent event, Emitter<HomeState> emit) async {
    emit(GetProfileLoadingState());

    try {
      final value = await HomeRepo.getProfile();
      if (value != null) {
        getProfileResponseModel = value;
        emit(GetProfileLoadedState());
      } else {
        emit(GetProfileErrorState());
      }
    } catch (e) {
      // Handle any exceptions that may occur during the asynchronous operation
      emit(GetProfileErrorState());
    }
  }
}
