import 'package:store_app/helper/remote/product_api.dart';
import 'package:store_app/models/card_model.dart';

import '../app/constants.dart';
import 'end point/products_end_point.dart';

class GetUserCart {
  static Future<List<CardModel>> getUserCart({required String userId}) async {
    List<dynamic> data =
        // ignore: missing_required_param
        await ProductsApi.get(
      url: "$baseUrlProduct/$GetUserCartEndPoint/$userId",
    );
    List<CardModel> cartUserList = [];

    for (var i = 0; i < data.length; i++) {
      cartUserList.add(
        CardModel.fromJson(data[i]),
      );
    }
    return cartUserList;
  }
}
