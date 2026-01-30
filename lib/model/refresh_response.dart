class RefreshResponse {
  final String? accessToken;
  final String? refreshToken;

  RefreshResponse({this.accessToken, this.refreshToken});
  factory RefreshResponse.fromJson(Map<String, dynamic> json) {
    return RefreshResponse(
      accessToken: json['accessToken']?.toString() ?? json['access_token']?.toString(),
      refreshToken: json['refreshToken']?.toString() ?? json['refresh_token']?.toString()
    );
  }

  Map<String, dynamic> toJson() => {
    'assessToken' : accessToken,
    'refreshToken' : refreshToken
  };
}
