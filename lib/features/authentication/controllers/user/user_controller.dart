import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:saveit/common/widgets/snackBars/loaders.dart';
import 'package:saveit/data/repositories/user_repository.dart';
import 'package:saveit/features/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /* FETCH USER RECORD */
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /* SAVE USER RECORD */
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final username =
            UserModel.generateUserName(userCredentials.user!.displayName ?? '');
      }

      /* MAP DATA */
      final user = UserModel(
        id: userCredentials!.user!.uid,
        fullName: userCredentials.user!.displayName ?? '',
        email: userCredentials.user!.email ?? '',
        budget: userCredentials.user!.phoneNumber ?? "0",
        profilePicture: userCredentials.user!.photoURL ?? '',
      );

      /* save user data */
      await userRepository.saveUserRecord(user);
    } catch (e) {
      Loaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information.');
    }
  }
}
