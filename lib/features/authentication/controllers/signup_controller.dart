import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/popups/full_screen_loader.dart';
import 'package:pkart/utils/popups/loaders.dart';
import '../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Signup
  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your Information....', TImages.comeBackLater);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(title: 'Connection Error', message: 'Please check your internet connection.');
        return;
      }

      // Form Validations
      if (signupFormKey.currentState == null || !signupFormKey.currentState!.validate()) {
        return;
      }

      // Proceed with signup logic...
      // Add your signup logic here, such as API calls

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}