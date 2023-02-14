import 'package:store_app/app/constants.dart';
import 'package:store_app/helper/remote/product_api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/end%20point/products_end_point.dart';

class AddProduct {
  static Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String categories,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await ProductsApi.post(
      url: "$baseUrlProduct/$AddProductEndPoint",
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "categories": categories,
      },
    );

    return ProductModel.fromJson(data);
  }
}
