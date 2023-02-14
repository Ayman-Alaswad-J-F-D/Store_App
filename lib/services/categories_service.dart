import 'package:store_app/helper/remote/product_api.dart';
import 'package:store_app/models/catefories_model.dart';

import '../app/constants.dart';
import 'end point/products_end_point.dart';

class CategoriesService {
  static Future<List<CategoriesModel>> getCategoriesProduct({
    required String categoryName,
  }) async {
    List<dynamic> data =
        // ignore: missing_required_param
        await ProductsApi.get(
      url: "$baseUrlProduct/$CategoriesProductEndPoint/$categoryName",
    );

    List<CategoriesModel> categoriesProductList = [];

    for (var i = 0; i < data.length; i++) {
      categoriesProductList.add(
        CategoriesModel.fromJson(data[i]),
      );
    }

    return categoriesProductList;
  }
}
