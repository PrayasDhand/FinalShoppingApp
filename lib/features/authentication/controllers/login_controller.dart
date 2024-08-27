import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pkart/data/repositories/authentication_repository.dart';
import 'package:pkart/features/authentication/screens/verify_email.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/popups/full_screen_loader.dart';

import '../../../navigation_menu.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/loaders.dart';
import '../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController{
  ///variables
  final RxBool rememberMe = false.obs;
  final RxBool  hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  ///----Email and Password Sign In

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Form Validations
      if (loginFormKey.currentState == null || !loginFormKey.currentState!.validate()) {
        return; // Return early if validation fails
      }

      // Start Loading only after validation passes
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: 'Connection Error',
          message: 'Please check your internet connection.',
        );
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login using Email and Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Check if the user's email is verified
      if (userCredentials.user != null && !userCredentials.user!.emailVerified) {
        // User is not verified, navigate to Verify Email screen
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
          title: 'Email Verification Required',
          message: 'Please verify your email to continue.',
        );
        Get.offAll(() => VerifyEmailAddress(email: email.text.trim()));
        return;
      }

      // Removing Loader
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'You have successfully logged in. Have a great shopping experience!',
      );

      // Redirecting to Home Screen
      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


  ///----Google Sign IN------
  Future<void> googleSignIn() async{
    try{
      
      //Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in....', TImages.docerAnimation);


      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(
            title: 'Connection Error',
            message: 'Please check your internet connection.');
        return;
      }



      // Google Authentication
      final userCredentials =  await AuthenticationRepository.instance.signInWithGoogle();
      
      //save user record
      await userController.saveUserRecord(userCredentials);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your Successfully Logged In. Have a great Shopping!',
      );

      //Redirecting
      AuthenticationRepository.instance.screenRedirect();


      
    }catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
}
}