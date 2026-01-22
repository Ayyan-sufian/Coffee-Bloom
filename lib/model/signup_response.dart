
import 'package:coffee_bloom/model/user_data.dart';

class SignupResponse {
  final int rescode;
  final String message;
  final UserData data;

  SignupResponse({
    required this.rescode,
    required this.message,
    required this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      rescode: json['response'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] ?? '',
    );
  }

  bool get isSuccess => rescode == 1;
}
