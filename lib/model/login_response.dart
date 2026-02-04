import 'package:coffee_bloom/model/user_data.dart';

class LoginResponse {
  final int rescode;
  final String message;
  final UserData? data;

  LoginResponse({
    required this.rescode,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json){
    final rawData = json['data'];

    UserData? parsedUser;

    if (rawData is Map<String, dynamic>) {
      parsedUser = UserData.fromJson(rawData);
    } else if (rawData is List && rawData.isNotEmpty) {
      parsedUser = UserData.fromJson(rawData.first);
    }

    return LoginResponse(
        rescode: int.tryParse(json['rescode']?.toString() ?? '0') ?? 0,
        message: json['message'] ?? '',
        data: parsedUser
    );
  }
}
