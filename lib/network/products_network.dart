import 'package:http/http.dart';

import '../models/products_model.dart';

class GoodsNetwork {
  
Future  <List<ProductModel>> getAllProducts() async {
  final response = await get(Uri.parse("https://api.escuelajs.co/api/V1/products"),);

  if (response.statusCode == 200) {
    print(response.body);

    return productModelFromJson(response.body);
  }else {
    throw{
      Exception("Failed to fetch data from API"),
    };
  }
}
}