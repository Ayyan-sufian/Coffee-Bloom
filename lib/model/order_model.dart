class OrderResponseModel {
  int? rescode;
  int? status;
  String? message;
  List<OrderModel>? data;

  OrderResponseModel({this.rescode, this.status, this.message, this.data});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    rescode = json['rescode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderModel>[];
      json['data'].forEach((v) {
        data!.add(new OrderModel.fromJson(v));
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

class OrderModel {
  int? userId;
  String? totalAmount;
  int? coffeeId;
  String? coffeeName;
  int? sizeId;
  int? milkId;
  int? quantity;
  String? price;
  String? imageUrl;

  OrderModel(
      {this.userId,
        this.totalAmount,
        this.coffeeId,
        this.coffeeName,
        this.sizeId,
        this.milkId,
        this.quantity,
        this.price,
        this.imageUrl});

  OrderModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    totalAmount = json['total_amount'];
    coffeeId = json['coffee_id'];
    coffeeName = json['coffee_name'];
    sizeId = json['size_id'];
    milkId = json['milk_id'];
    quantity = json['quantity'];
    price = json['price'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['total_amount'] = this.totalAmount;
    data['coffee_id'] = this.coffeeId;
    data['coffee_name'] = this.coffeeName;
    data['size_id'] = this.sizeId;
    data['milk_id'] = this.milkId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
