import 'package:get/get.dart';
import 'package:saveit/features/models/category_model.dart';
import 'package:saveit/data/repositories/category_repository.dart';

class CategoryController extends GetxController {
  final CategoryRepository _categoryRepo = CategoryRepository();
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  Future<List<CategoryModel>> loadCategories(String userId) async {
    final loadedCategories = await _categoryRepo.getCategories(userId);
    categories.value = loadedCategories;
    return loadedCategories; // Return the list of categories
  }

  Future<void> addCategory(String userId, CategoryModel category) async {
    await _categoryRepo.addCategory(userId, category);
    await loadCategories(userId); // Refresh the list after adding
  }

  Future<void> addPredefinedCategories(String userId) async {
    await _categoryRepo.addPredefinedCategories(userId);
    await loadCategories(userId); // Refresh the list after adding
  }
}
