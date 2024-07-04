import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:saveit/features/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      print('Error saving user: $e');
      throw 'Failed to save user. Please try again later.';
    }
  }
}
