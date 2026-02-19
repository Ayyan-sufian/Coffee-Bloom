import 'package:coffee_bloom/model/category_id_model.dart';
import 'package:coffee_bloom/model/category_model.dart';
import 'package:coffee_bloom/model_view/auth_vm.dart';
import 'package:coffee_bloom/service/category_api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryApiService _apiService = CategoryApiService();
final AuthViewModel _authVM = AuthViewModel();
  bool isLoading = false;
  bool _initialized = false;
  String? error;

  /// List of category
  List<CategoryData> categoryList = [];

  /// List of category id
  List<CategoryIdData> categoryIdList = [];

  /// call function
  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    await fetchCategories();
  }


  /// Function of category
  Future<void> fetchCategories() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final token = await _authVM.getAccessToken();

      if (token == null) return;

      final response = await _apiService.callCategoryApi(token: token);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = CategoryModel.fromJson(response.data);

        categoryList.clear();

        categoryList = parse.data ?? [];

      }
    } on DioException catch (e) {
      error = e.response?.data?['message'] ?? 'Network error';
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// Function of category id
  Future<void> fetchCategoryId(String token, String id) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final token = await _authVM.getAccessToken();

      if (token == null) return;

      final response = await _apiService.callCategoryIdApi(
        token: token,
        id: id,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final parse = CategoryIdModel.fromJson(response.data);

        categoryIdList.clear();

        categoryIdList = parse.data ?? [];

      }
    } on DioException catch (e) {
      throw DioException(
        requestOptions: e.requestOptions,
        message: e.message,
        type: e.type,
      );
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

