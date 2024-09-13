import 'dart:convert';
import 'dart:developer';

import 'package:bookia_app/core/Constants/constants.dart';
import 'package:bookia_app/feature/Auth/data/Models/request/register_params.dart';
import 'package:bookia_app/feature/Auth/data/Models/response/register_response_model/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  static Future<RegisterResponseModel?> register(RegisterParams params) async {
    // call api here
    try {
      Uri url = Uri.parse(AppConstants.baseUrl + AppConstants.registerEndpoint);
      var response = await http.post(url, body: params.toJson());
      log("201 $response");

      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        return RegisterResponseModel.fromJson(jsonResponse);
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
      Uri url = Uri.parse(AppConstants.baseUrl + AppConstants.loginEndpoint);
      var response =
          await http.post(url, body: {'email': email, 'password': password});
      log("201 $response");

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return RegisterResponseModel.fromJson(jsonResponse);
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
}
