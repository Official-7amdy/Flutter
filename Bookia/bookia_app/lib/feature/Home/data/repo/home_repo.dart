import 'dart:developer';
import 'package:bookia_app/core/Constants/constants.dart';
import 'package:bookia_app/feature/Home/data/models/response/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/feature/Home/data/models/response/slider_response_model/slider_response_model.dart';
import 'package:bookia_app/services/dio_provider.dart';

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
}
