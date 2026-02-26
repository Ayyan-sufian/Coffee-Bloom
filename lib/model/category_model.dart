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
        data!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rescode'] = rescode;
    data['status'] = status;
    data['message'] = message;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coffee_catagory_id'] = coffeeCatagoryId;
    data['coffee_catagory_name'] = coffeeCatagoryName;
    data['description'] = description;
    data['image_url'] = imageUrl;
    return data;
  }
}