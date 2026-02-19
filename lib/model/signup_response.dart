class SignupResponse {
  int? rescode;
  int? status;
  String? message;
  SignUpData? data;

  SignupResponse({this.rescode, this.status, this.message, this.data});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    rescode = json['rescode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SignUpData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['rescode'] = this.rescode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SignUpData {
  int? id;
  String? name;
  String? email;
  String? address;
  String? token;

  SignUpData({this.id, this.name, this.email, this.address, this.token});

  SignUpData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['address'] = this.address;
    data['token'] = this.token;
    return data;
  }
}
