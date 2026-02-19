class CoffeeResponseModel {
  int? rescode;
  int? status;
  String? message;
  List<CoffeeModel>? data;

  CoffeeResponseModel({this.rescode, this.status, this.message, this.data});

  CoffeeResponseModel.fromJson(Map<String, dynamic> json) {
    rescode = json['rescode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CoffeeModel>[];
      json['data'].forEach((v) {
        data!.add(CoffeeModel.fromJson(v));
      });
    }
  }

}

class CoffeeModel {
  int? coffeeId;
  String? coffeeName;
  String? imageUrl;
  String? coffeeDescription;
  String? coffeePrice;
  int? rating;
  int? coffeeCatagoryId;
  String? coffeeCatagoryName;

  CoffeeModel(
      {this.coffeeId,
        this.coffeeName,
        this.imageUrl,
        this.coffeeDescription,
        this.coffeePrice,
        this.rating,
        this.coffeeCatagoryId,
        this.coffeeCatagoryName});

  CoffeeModel.fromJson(Map<String, dynamic> json) {
    coffeeId = json['coffee_id'];
    coffeeName = json['coffee_name'];
    imageUrl = json['image_url'];
    coffeeDescription = json['coffee_description'];
    coffeePrice = json['coffee_price'];
    rating = json['rating'];
    coffeeCatagoryId = json['coffee_catagory_id'];
    coffeeCatagoryName = json['coffee_catagory_name'];
  }

}
