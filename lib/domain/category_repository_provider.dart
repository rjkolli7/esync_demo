import 'package:esync_demo/domain/model/body/add_category_body.dart';
import 'package:esync_demo/domain/model/response/category_response.dart';

abstract class ICategoryRepository {
  Future<String> addCategory(AddCategoryBody categoryBody);
  Future<CategoryResponse> getCategories();
}
