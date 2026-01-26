
import 'package:coffee_bloom/model/user_data.dart';

class SignupResponse {
  final int rescode;
  final String message;
  final UserData? data;

  SignupResponse({
    required this.rescode,
    required this.message,
    required this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];

    UserData? parsedUser;

    if (rawData is Map<String, dynamic>) {
      parsedUser = UserData.fromJson(rawData);
    } else if (rawData is List && rawData.isNotEmpty) {
      parsedUser = UserData.fromJson(rawData.first);
    }

    return SignupResponse(
      rescode: int.tryParse(json['rescode']?.toString() ?? '') ?? 1,
      message: json['message'] ?? '',
      data: parsedUser
    );
  }

  bool get isSuccess => rescode == 1;
}
