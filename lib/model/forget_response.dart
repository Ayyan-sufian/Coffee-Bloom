class ForgetResponse {
  final int rescode;
  final String message;

  ForgetResponse({required this.rescode, required this.message});

  factory ForgetResponse.fromJson(Map<String, dynamic> json) {
    return ForgetResponse(
      rescode: int.tryParse(json['rescode']?.toString() ?? '') ?? 1,
      message: json['message'] ?? '',
    );
  }
}
