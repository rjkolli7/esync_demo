import 'package:esync_demo/domain/model/body/add_product_body.dart';
import 'package:esync_demo/domain/model/response/products_response.dart';
import 'package:esync_demo/domain/product_repository_provider.dart';
import 'package:get/get.dart';

import '../helper/logger_utils.dart';

class ProductController extends GetxController with StateMixin<dynamic> {
  /// inject repo abstraction dependency
  final IProductRepository productRepository;
  ProductController({required this.productRepository});

  Future<String> addProduct(AddProductBody body) async {
    var response = await productRepository.addProduct(body).then((value) {
      Logger.write('');
      return Future.value(value);
    }, onError: (error) {
      Logger.write('');
      return error;
    });
    return response;
  }

  Future<ProductResponse> getProducts() async {
    var response = await productRepository.getProducts().then((value) {
      Logger.write('');
      return Future.value(value);
    }, onError: (error) {
      Logger.write('');
      return error;
    });
    return response;
  }
}
