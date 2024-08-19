import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:saveit/common/widgets/snackBars/loaders.dart';
import 'package:saveit/data/repositories/user_repository.dart';
import 'package:saveit/features/authentication/controllers/user/user_controller.dart';
import 'package:saveit/navigation_menu.dart';

class UpdateBudgetController extends GetxController {
  static UpdateBudgetController get instance => Get.find();

  final budget = TextEditingController();
  final userController = Get.put(UserController());
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> UpdateBudgetFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeBudget();
    super.onInit();
  }

  /* FETCH USER RECORDS */
  Future<void> initializeBudget() async {
    budget.text = userController.user.value.budget;
  }

  Future<void> updateBudget() async {
    try {
      /* laoding */
      /* check internet */
      /* form validation */
      if (!UpdateBudgetFormKey.currentState!.validate()) {
        return;
      }

      /* update budget in firebase */
      Map<String, dynamic> newBudget = {'Budget': budget.text.trim()};
      await userRepository.updateSingleField(newBudget);

      /* update the Rx User value */
      userController.user.value.budget = budget.text.trim();

      /* remove loader */
      /* move to next screen */
      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      /* stop loading */
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
