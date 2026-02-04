class ResetPassResponse {
  final int rescode;
  final String message;

  ResetPassResponse({required this.rescode, required this.message});

  factory ResetPassResponse.fromJson(Map<String, dynamic> json) {
    return ResetPassResponse(
      rescode: int.tryParse(json['rescode'].toString()) ?? 1,
      message: json['message'],
    );
  }
}
