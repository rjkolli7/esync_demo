import 'package:esync_demo/domain/model/body/add_product_body.dart';
import 'package:esync_demo/domain/model/response/products_response.dart';
import 'package:esync_demo/domain/product_repository_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../helper/local_preference_helper.dart';
import '../helper/logger_utils.dart';

class ProductRepository extends IProductRepository {
  @override
  Future<String> addProduct(AddProductBody productBody) async {
    try {
      String uId = await userId();
      final databaseRef = FirebaseDatabase.instance.ref('products');
      var data = await databaseRef.get();
      data.children.toList().forEach((element) {
        var isExist = element.child('name').value == productBody.name;
        if (isExist) {
          throw FirebaseException(
              plugin: '', message: 'Product Already Existed');
        }
      });
      var index = data.children.length;
      await databaseRef.child('$index').set(<String, dynamic>{
        "name": productBody.name,
        "description": productBody.description,
        "shortDescription": productBody.shortDescription,
        "price": productBody.price,
        "categoryId": productBody.categoryId,
        "categoryName": productBody.categoryName,
        "uid": uId,
        "id": index,
      });
      Logger.write('');
      return Future.value('success');
    } on FirebaseException catch (error) {
      Logger.write('');
      return Future.error(error.message ?? 'Adding Product Failed');
    }
  }

  @override
  Future<ProductResponse> getProducts() async {
    try {
      final databaseRef = FirebaseDatabase.instance.ref('products');
      DataSnapshot data = await databaseRef.get();
      Logger.write(data.value.toString());
      return Future.value(ProductResponse.fromMap(data.value));
    } on FirebaseException catch (error) {
      Logger.write('');
      return Future.error(
          ProductResponse(error: error.message ?? 'Adding Category Failed'));
    }
  }
}
