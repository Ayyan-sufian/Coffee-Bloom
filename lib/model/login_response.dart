class LoginResponse {
  int? rescode;
  int? status;
  String? message;
  LoginData? data;

  LoginResponse({this.rescode, this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    rescode = json['rescode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['rescode'] = this.rescode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  String? accessToken;
  String? refreshToken;

  LoginData({this.accessToken, this.refreshToken});

  LoginData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}