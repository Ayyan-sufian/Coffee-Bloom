class VerifyResponse {
  final int rescode;
  final String message;

  VerifyResponse({required this.rescode, required this.message});

  factory VerifyResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResponse(
      rescode: int.tryParse(json['rescode'].toString() ?? '') ?? 1,
      message: json['message'],
    );
  }
}
