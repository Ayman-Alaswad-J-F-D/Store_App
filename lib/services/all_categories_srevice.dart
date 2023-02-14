import 'package:store_app/helper/remote/product_api.dart';

import '../app/constants.dart';
import 'end point/products_end_point.dart';

class AllCategoriesSrevice {
  static Future<List<dynamic>> getAllCategories() async {
    List<dynamic> categoriesList =
        // ignore: missing_required_param
        await ProductsApi.get(url: "$baseUrlProduct/$AllCategoriesEndPoint");

    return categoriesList;
  }
}
