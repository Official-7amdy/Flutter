import 'dart:developer';
import 'package:bookia_app/core/Constants/constants.dart';
import 'package:bookia_app/feature/Auth/data/Models/request/register_params.dart';
import 'package:bookia_app/feature/Auth/data/Models/response/register_response_model/register_response_model.dart';
import 'package:bookia_app/services/dio_provider.dart';
import 'package:bookia_app/services/local_storage.dart';

class AuthRepo {
  static Future<RegisterResponseModel?> register(RegisterParams params) async {
    // call api here
    try {
      var response = await DioProvider.post(
          data: params.toJson(), endpoint: AppConstants.registerEndpoint);
      log("201 $response");

      if (response.statusCode == 201) {
        // ignore: non_constant_identifier_names
        var Model = RegisterResponseModel.fromJson(response.data);
        return Model;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }

  static Future<RegisterResponseModel?> login(
      {required String email, required String password}) async {
    // call api here
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.loginEndpoint,
          data: {"email": email, "password": password});
      log("201 $response");

      if (response.statusCode == 200) {
        // ignore: non_constant_identifier_names
        var Model = RegisterResponseModel.fromJson(response.data);
        return Model;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
static Future<bool?> logout(
    
  ) async {
    // call api here
    try {
      var response = await DioProvider.post(
          endpoint: AppConstants.logoutEndpoint,
         
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
}
