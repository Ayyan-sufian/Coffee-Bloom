import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/model/coffee_model.dart';
import 'package:coffee_bloom/model/order_model.dart';
import 'package:coffee_bloom/model_view/auth_vm.dart';
import 'package:coffee_bloom/service/coffee_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CoffeeViewModel extends ChangeNotifier {
  final CoffeeApiService _apiService = CoffeeApiService();
  final AuthViewModel _authVM = AuthViewModel();

  bool isLoading = false;
  String? message;

  OrderResponseModel? orderResponse;

  /// Coffee List
  List<CoffeeModel> coffee = [];

  /// coffee function
  Future<void> fetchCoffee({required String id}) async {
    isLoading = true;
    message = null;
    notifyListeners();

    try {
      final token = await _authVM.getAccessToken();

      if (token == null) return;

      final coffeeEnd = AppConstants.coffeeEnd + id;

      final response = await _apiService.callCoffeeApi(
        endpoint: coffeeEnd,
        token: token,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = CoffeeResponseModel.fromJson(response.data);

        coffee.clear();

        coffee = parse.data ?? [];
      } else {
        message = "error";
      }
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        message: e.message,
        type: e.type,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Order function
  Future<void> sendOrder({required Map<String, dynamic> data}) async {
    isLoading = true;
    message = null;

    try {
      final token = await _authVM.getAccessToken();

      if (token == null) return;

      final response = await _apiService.callOrderApi(
        endpoint: AppConstants.coffeeEnd,
        data: data,
        token: token,
      );

      if(response.statusCode == 200 || response.statusCode == 201){

        final parse = OrderResponseModel.fromJson(response.data);

        if (parse.rescode == 1) {
          orderResponse = parse;
        } else {
          message = parse.message;
          orderResponse = null;
        }
      } else {
        message = "Invalid otp";

      }

    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        message: e.message,
        type: e.type,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
