import 'package:coffee_bloom/model/forget_response.dart';
import 'package:coffee_bloom/model/login_response.dart';
import 'package:coffee_bloom/model_view/auth_view_model.dart';
import 'package:coffee_bloom/service/auth_api_service.dart';
import 'package:coffee_bloom/service/auth_local_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ForgotViewModel extends ChangeNotifier {
  final AuthApiService _authService = AuthApiService();
  final AuthLocalStorage _authStorage = AuthLocalStorage();

  bool isLoading = false;
  String? Error;
  ForgetResponse? forgetResponse;

  Future<dynamic> sendEmail(String email) async {
    isLoading = true;
    Error = null;
    notifyListeners();

    try {
      final response = await _authService.callSendEmailApi(email: email);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = ForgetResponse.fromJson(response.data);
        if (parse.rescode == 1) {
          forgetResponse = parse;
        } else {
          Error = parse.message;
        }
      }
    } on DioException catch (e) {
      Error =
          e.response?.data?['message'] ?? e.message ?? 'Something went wrong';
    } catch (e) {
      Error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
