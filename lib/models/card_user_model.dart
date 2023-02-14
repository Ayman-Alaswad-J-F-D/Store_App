class CardUsersModel {
  int? id;
  int? userId;
  String? date;
  List<Products>? products;

  CardUsersModel({this.id, this.userId, this.date, this.products});

  CardUsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];

    products = <Products>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson(Map<String, dynamic> data) {
  //   data['id'] = id;
  //   data['userId'] = userId;
  //   data['date'] = date;
  //   if (products != null) {
  //     data['products'] = products!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Products {
  int? productId;
  int? quantity;

  Products({this.productId, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  // Map<String, dynamic> toJson(Map<String, dynamic> data) {
  //   // final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['productId'] = productId;
  //   data['quantity'] = quantity;
  //   return data;
  // }
}
