import '../app/constants.dart';
import '../helper/remote/product_api.dart';
import '../models/product_model.dart';
import 'end point/products_end_point.dart';

class UpdateProductService {
  static Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String categories,
    // required dynamic rate,
    // required dynamic count,
  }) async {
    // ignore: avoid_print
    print("product id = $id");
    // ignore: missing_required_param
    Map<String, dynamic> data = await ProductsApi.put(
      url: "$baseUrlProduct/$AddProductEndPoint/$id",
      body: {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
        "categories": categories,
        // "rating": {
        //   "rate": rate,
        //   "count": count,
        // }
      },
    );

    return ProductModel.fromJson(data);
  }
}
