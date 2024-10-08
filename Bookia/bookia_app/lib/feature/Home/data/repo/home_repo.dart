import 'dart:developer';
import 'package:bookia_app/core/Constants/constants.dart';
import 'package:bookia_app/feature/Home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/Home/data/models/response/slider_response_model/slider_response_model.dart';
import 'package:bookia_app/feature/Wishlist/data/models/response/get_wishlist_response_model/get_wishlist_response_model.dart';
import 'package:bookia_app/feature/cart/data/models/response/get_cart_response_model/get_cart_response_model.dart';
import 'package:bookia_app/feature/profile/data/models/response/get_profile_response_model/get_profile_response_model.dart';
import 'package:bookia_app/services/dio_provider.dart';
import 'package:bookia_app/services/local_storage.dart';

class HomeRepo {
  static Future<BestSellerResponseModel?> getBestSellerBooks() async {
    // call api here
    try {
      var response =
          await DioProvider.get(endpoint: AppConstants.bestSellerEndpoint);
      log("201 $response");

      if (response.statusCode == 200) {
        // ignore: non_constant_identifier_names
        var Model = BestSellerResponseModel.fromJson(response.data);
        return Model;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  static Future<SliderResponseModel?> getSlider() async {
    // call api here
    try {
      var response =
          await DioProvider.get(endpoint: AppConstants.sliderEndpoint);
      log("200 $response");

      if (response.statusCode == 200) {
        // ignore: non_constant_identifier_names
        var Model = SliderResponseModel.fromJson(response.data);
        return Model;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  static Future<bool?> addToWishlist({
    required int productId,
  }) async {
    // call api here
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.addToWishlistEndpoint,
          data: {
            'product_id': productId
          },
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      log("200 $response");

      if (response.statusCode == 200) {
        return true;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
    return false;
  }

  static Future<bool?> removeFromWishlist({
    required int productId,
  }) async {
    // call api here
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.removeFromWishlistEndpoint,
          data: {
            'product_id': productId
          },
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      log("200 $response");

      if (response.statusCode == 200) {
        return true;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
    return false;
  }

  static Future<GetWishlistResponseModel?> getWishlist() async {
    // call api here
    try {
      var response = await DioProvider.get(
          endpoint: AppConstants.getWishlistEndpoint,
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      log("200 $response");

      if (response.statusCode == 200) {
        // ignore: non_constant_identifier_names
        var Model = GetWishlistResponseModel.fromJson(response.data);
        return Model;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  //Cart

  static Future<bool?> addToCart({
    required int productId,
  }) async {
    // call api here
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.addToCartEndpoint,
          data: {
            'product_id': productId
          },
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      log("200 $response");

      if (response.statusCode == 200) {
        return true;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
    return false;
  }

  static Future<bool?> removeFromCart({
    required int productId,
  }) async {
    // call api here
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.removeFromCartEndpoint,
          data: {
            'cart_item_id': productId
          },
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      log("200 $response");

      if (response.statusCode == 200) {
        return true;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
    return false;
  }

  static Future<bool?> updateCart({
    required int productId,
    required dynamic quantity,
  }) async {
    // call api here
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.updateCartEndpoint,
          data: {
            'cart_item_id': productId,
            'quantity': quantity
          },
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      log("200 $response");

      if (response.statusCode == 200) {
        return true;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
    return false;
  }

  static Future<GetCartResponseModel?> getCart() async {
    // call api here
    try {
      var response = await DioProvider.get(
          endpoint: AppConstants.getCartEndpoint,
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      log("200 $response");

      if (response.statusCode == 200) {
        // ignore: non_constant_identifier_names
        var Model = GetCartResponseModel.fromJson(response.data);
        return Model;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }


  
//Profile

  static Future<GetProfileResponseModel?> getProfile() async {
    // call api here
    try {
      var response = await DioProvider.get(
          endpoint: AppConstants.getProfileEndpoint,
          headers: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
          });
      log("200 $response");

      if (response.statusCode == 200) {
        // ignore: non_constant_identifier_names
        var Model = GetProfileResponseModel.fromJson(response.data);
        return Model;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

}
