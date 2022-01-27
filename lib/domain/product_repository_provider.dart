import 'package:esync_demo/domain/model/body/add_product_body.dart';

import 'model/response/products_response.dart';

abstract class IProductRepository {
  Future<String> addProduct(AddProductBody productBody);
  Future<ProductResponse> getProducts();
}
