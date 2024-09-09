import 'package:saveit/features/authentication/controllers/category_controller.dart';

class CategoryService {
  final CategoryController _categoryController = CategoryController();

  Future<void> initializeCategories(String userId) async {
    // Check if the user already has categories
    final categories = await _categoryController.loadCategories(userId);
    if (categories.isEmpty) {
      await _categoryController.addPredefinedCategories(userId);
    }
  }

  // Additional service methods if needed
}
