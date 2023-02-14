class CategoriesModel {
  dynamic id;
  dynamic title;
  dynamic price;
  dynamic description;
  dynamic image;
  dynamic category;

  CategoriesModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
  });

  factory CategoriesModel.fromJson(dynamic json) {
    return CategoriesModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
    );
  }
}

//  title: 'test product',
//                     price: 13.5,
//                     description: 'lorem ipsum set',
//                     image: 'https://i.pravatar.cc',
//                     category: 'electronic'