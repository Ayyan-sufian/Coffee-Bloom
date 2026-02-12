class CategoryModel {
  int? rescode;
  int? status;
  String? message;
  List<CategoryData>? data;

  CategoryModel({this.rescode, this.status, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    rescode = json['rescode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rescode'] = this.rescode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  int? coffeeCatagoryId;
  String? coffeeCatagoryName;
  String? description;
  String? imageUrl;

  CategoryData(
      {this.coffeeCatagoryId,
        this.coffeeCatagoryName,
        this.description,
        this.imageUrl});

  CategoryData.fromJson(Map<String, dynamic> json) {
    coffeeCatagoryId = json['coffee_catagory_id'];
    coffeeCatagoryName = json['coffee_catagory_name'];
    description = json['description'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coffee_catagory_id'] = this.coffeeCatagoryId;
    data['coffee_catagory_name'] = this.coffeeCatagoryName;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    return data;
  }
}