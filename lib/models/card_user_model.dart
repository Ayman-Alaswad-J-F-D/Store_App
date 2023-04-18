class LocalCardUsersModel {
  final int id;
  final int idProduct;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final int quantity;
  final String dataTime;

  LocalCardUsersModel({
    required this.id,
    required this.idProduct,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.quantity,
    required this.dataTime,
  });

  factory LocalCardUsersModel.fromJson(Map<String, dynamic> json) {
    return LocalCardUsersModel(
      id: json['id'],
      idProduct: json['productId'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      quantity: json['quantity'],
      dataTime: json['dataTime'],
    );
  }
}
