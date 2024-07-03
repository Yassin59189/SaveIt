import 'package:get/get.dart';
import 'package:saveit/data/repositories/authentication/authentication.dart';
import 'package:saveit/utils/constants/colors.dart';

class verifyEmailController extends GetxController {
  static verifyEmailController get instance => Get.find();
  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
  }
}

sendEmailVerification() async {
  try {
    await AuthenticationRepository.instance.sendEmailVerification();
    Get.snackbar(
      "email sent",
      "please check your index and verify you mail !",
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
    );
  } catch (e) {
    Get.snackbar(
      "Error",
      "${e.toString()}",
      backgroundColor: TColors.accent,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
