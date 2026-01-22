import 'package:coffee_bloom/helper/helper.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  final Dio _dio = Global().dio;

  Future<dynamic> callSignUpApi({
    required Map<String, dynamic> data,
    required String endPoint,
  }) async {
    try {
      final response = await _dio.post(data: data, endPoint);
      return response;
    }
    catch (e){
      throw Exception("This is  error : $e");
    }
  }
}


// } catch (e) {
//   throw Exception('Unexpected error: $e');
// }
