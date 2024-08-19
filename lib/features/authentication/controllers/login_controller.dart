import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pkart/data/repositories/authentication_repository.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/popups/full_screen_loader.dart';

import '../../../navigation_menu.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/loaders.dart';

class LoginController extends GetxController{
  ///variables
  final RxBool rememberMe = false.obs;
  final RxBool  hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  ///----Email and Password Sign In

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(
            title: 'Connection Error',
            message: 'Please check your internet connection.');
        return;
      }

      // Form Validations
      if (loginFormKey.currentState == null || !loginFormKey.currentState!.validate()) {
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login using Email and Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Removing Loader
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your Successfully Logged In. Have a great Shopping!',
      );

      // Redirecting
      Get.offAll(() => const NavigationMenu());

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}