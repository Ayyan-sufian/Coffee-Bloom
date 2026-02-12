class CategoryIdModel {
  int? rescode;
  int? status;
  String? message;
  List<CategoryIdData>? data;

  CategoryIdModel({this.rescode, this.status, this.message, this.data});

  CategoryIdModel.fromJson(Map<String, dynamic> json) {
    rescode = json['rescode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryIdData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryIdData.fromJson(v));
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

class CategoryIdData {
  int? coffeeId;
  String? coffeeName;
  String? coffeeDescription;
  String? coffeePrice;
  int? rating;
  int? status;
  int? coffeeCatagoryId;
  String? coffeeCatagoryName;
  String? imageUrl;

  CategoryIdData(
      {this.coffeeId,
        this.coffeeName,
        this.coffeeDescription,
        this.coffeePrice,
        this.rating,
        this.status,
        this.coffeeCatagoryId,
        this.coffeeCatagoryName,
        this.imageUrl});

  CategoryIdData.fromJson(Map<String, dynamic> json) {
    coffeeId = json['coffee_id'];
    coffeeName = json['coffee_name'];
    coffeeDescription = json['coffee_description'];
    coffeePrice = json['coffee_price'];
    rating = json['rating'];
    status = json['status'];
    coffeeCatagoryId = json['coffee_catagory_id'];
    coffeeCatagoryName = json['coffee_catagory_name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coffee_id'] = this.coffeeId;
    data['coffee_name'] = this.coffeeName;
    data['coffee_description'] = this.coffeeDescription;
    data['coffee_price'] = this.coffeePrice;
    data['rating'] = this.rating;
    data['status'] = this.status;
    data['coffee_catagory_id'] = this.coffeeCatagoryId;
    data['coffee_catagory_name'] = this.coffeeCatagoryName;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
