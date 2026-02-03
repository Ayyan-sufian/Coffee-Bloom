import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:dio/dio.dart';

class Global {
  static final Global _instance = Global._internal();
  late final Dio dio;

  factory Global() => _instance;

  Global._internal () {
    dio = Dio(
        BaseOptions(
            baseUrl: AppConstants.baseUrl,
            connectTimeout: Duration(seconds: 30),
            receiveTimeout: Duration(seconds: 30),
            headers: {
              'Content-Type' : 'application/json'
            }
        )
    );
  }
}