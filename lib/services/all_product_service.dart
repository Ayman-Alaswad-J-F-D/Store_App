import 'package:store_app/helper/remote/product_api.dart';
import 'package:store_app/models/product_model.dart';

import '../app/constants.dart';
import 'end point/products_end_point.dart';

class AllProductService {
  static Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await ProductsApi.get(url: "$baseUrlProduct/$AllProductEndPoint");
    List<ProductModel> productList = [];

    for (var i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
