import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saveit/features/models/category_model.dart';

class CategoryRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addCategory(String userId, CategoryModel category) async {
    // Add a new document with an auto-generated ID
    await _db
        .collection('users')
        .doc(userId)
        .collection('categories')
        .add(category.toMap());
  }

  Future<List<CategoryModel>> getCategories(String userId) async {
    final snapshot = await _db
        .collection('users')
        .doc(userId)
        .collection('categories')
        .get();
    return snapshot.docs
        .map((doc) => CategoryModel.fromMap(doc.id, doc.data()!))
        .toList();
  }

  Future<void> addPredefinedCategories(String userId) async {
    final predefinedCategories = [
      CategoryModel(
        id: '',
        name: 'House',
        priority: true,
        icon: Iconsax.house,
        amount: 0,
      ),
      CategoryModel(
        id: '',
        name: 'Shopping',
        priority: false,
        icon: Iconsax.shopping_cart,
        amount: 0,
      ),
      CategoryModel(
        id: '',
        name: 'Travel',
        priority: false,
        icon: Iconsax.airplane,
        amount: 0,
      ),
      CategoryModel(
        id: '',
        name: 'Enterteinment',
        priority: false,
        icon: Iconsax.weight_1,
        amount: 0,
      ),
    ];

    for (var category in predefinedCategories) {
      await addCategory(userId, category);
    }
  }
}
