import 'dart:convert';

class CardModel {
  dynamic id;
  dynamic userId;
  dynamic data;
  List<Products>? product;

  CardModel({
    required this.id,
    required this.userId,
    required this.data,
    required this.product,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    data = json['date'];

    product = [];
    for (var data = 0; data < json['products'].length; data++) {
      product?.add(Products.fromJson(json['products'][data]));
    }
  }

  CardModel.toJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    data = json['date'];
    product = [];
    product?.add(Products.fromJson(jsonDecode(json['products'])));
  }
}

class Products {
  dynamic productId;
  dynamic quantity;

  Products({
    required this.productId,
    required this.quantity,
  });

  factory Products.fromJson(dynamic json) {
    return Products(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}
