class RefreshResponse {
  int? rescode;
  String? message;
  RefreshTokenData? data;

  RefreshResponse({this.rescode, this.message, this.data});

  RefreshResponse.fromJson(Map<String, dynamic> json) {
    rescode = json['rescode'];
    message = json['message'];
    data = json['data'] != null ? new RefreshTokenData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rescode'] = this.rescode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RefreshTokenData {
  String? refreshToken;

  RefreshTokenData({this.refreshToken});

  RefreshTokenData.fromJson(Map<String, dynamic> json) {
    refreshToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.refreshToken;
    return data;
  }
}
