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
        data!.add( CategoryIdData.fromJson(v));
      });
    }
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coffee_id'] = coffeeId;
    data['coffee_name'] = coffeeName;
    data['coffee_description'] = coffeeDescription;
    data['coffee_price'] = coffeePrice;
    data['rating'] = rating;
    data['status'] = status;
    data['coffee_catagory_id'] = coffeeCatagoryId;
    data['coffee_catagory_name'] = coffeeCatagoryName;
    data['image_url'] = imageUrl;
    return data;
  }
}
