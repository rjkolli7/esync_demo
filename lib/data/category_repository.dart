import 'package:esync_demo/domain/category_repository_provider.dart';
import 'package:esync_demo/domain/model/body/add_category_body.dart';
import 'package:esync_demo/domain/model/response/category_response.dart';
import 'package:esync_demo/helper/local_preference_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../helper/logger_utils.dart';

class CategoryRepository extends ICategoryRepository {
  @override
  Future<String> addCategory(AddCategoryBody categoryBody) async {
    try {
      String uId = await userId();
      final databaseRef = FirebaseDatabase.instance.ref('categories');
      var data = await databaseRef.get();

      data.children.toList().forEach((element) {
        var isExist = element.child('name').value == categoryBody.name;
        if (isExist) {
          throw FirebaseException(
              plugin: '', message: 'Category Already Existed');
        }
      });
      var index = data.children.length;
      await databaseRef.child('$index').set(<String, dynamic>{
        "name": categoryBody.name,
        "description": categoryBody.description,
        "uid": uId,
        "id": index,
      });
      Logger.write('');
      return Future.value('success');
    } on FirebaseException catch (error) {
      Logger.write('');
      return Future.error(error.message ?? 'Adding Category Failed');
    }
  }

  @override
  Future<CategoryResponse> getCategories() async {
    try {
      final databaseRef = FirebaseDatabase.instance.ref('categories');
      DataSnapshot data = await databaseRef.get();
      Logger.write(data.value.toString());
      return Future.value(CategoryResponse.fromMap(data.value));
    } on FirebaseException catch (error) {
      Logger.write('');
      return Future.error(
          CategoryResponse(error: error.message ?? 'Adding Category Failed'));
    }
  }
}
