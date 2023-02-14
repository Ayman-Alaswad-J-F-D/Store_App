import 'package:store_app/app/constants.dart';
import 'package:store_app/helper/remote/product_api.dart';
import 'package:store_app/models/card_model.dart';
import 'package:store_app/services/end%20point/products_end_point.dart';

class AddToCard {
  static Future<CardModel> addToCard({
    required String userId,
    required String dataTime,
    required String productsId,
    required String quantity,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await ProductsApi.post(
      url: "$baseUrlProduct/$AddToCardtEndPoint",
      body: {
        "userId": userId,
        "date": dataTime,

        //! this line is important the spaces and the -> ""   for request and jsonDecode in CardModel
        //? Example :  '{"text": "foo", "value": 1, "statu": 5}'

        "products": '{"productId": $productsId, "quantity": $quantity}'
      },
    );

    return CardModel.toJson(data);
  }
}
