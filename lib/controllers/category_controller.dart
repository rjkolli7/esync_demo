import 'package:esync_demo/domain/category_repository_provider.dart';
import 'package:esync_demo/domain/model/body/add_category_body.dart';
import 'package:esync_demo/domain/model/response/category_response.dart';
import 'package:esync_demo/helper/logger_utils.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController with StateMixin<dynamic> {
  /// inject repo abstraction dependency
  final ICategoryRepository categoryRepository;
  CategoryController({required this.categoryRepository});

  Future<String> addCategory(AddCategoryBody body) async {
    var response = await categoryRepository.addCategory(body).then((value) {
      Logger.write('');
      return Future.value(value);
    }, onError: (error) {
      Logger.write('');
      return error;
    });
    return response;
  }

  Future<CategoryResponse> getCategories() async {
    var response = await categoryRepository.getCategories().then((value) {
      Logger.write('');
      return Future.value(value);
    }, onError: (error) {
      Logger.write('');
      return error;
    });
    return response;
  }
}
