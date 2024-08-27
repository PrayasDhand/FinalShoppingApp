import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/data/repositories/authentication_repository.dart';
import 'package:pkart/features/authentication/screens/reset_password.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/popups/full_screen_loader.dart';

import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      //Start Full Screen Loader
      TFullScreenLoader.openLoadingDialog(
          'Processing your Information....Please Wait for a moment',
          TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(
            title: 'Connection Error',
            message: 'Please check your internet connection.');
        return;
      }

      // Form Validations
      if (forgetPasswordFormKey.currentState == null ||
          !forgetPasswordFormKey.currentState!.validate()) {
        return;
      }

      //Send email to reset Password
      await AuthenticationRepository.instance.sendPassword(email.text.trim());

      //Remove the Loader

      TFullScreenLoader.stopLoading();

      // Show Success Message
      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Reset Email Sent Successfully',
        message:
            'An email with the reset password link has been sent to your mail. Kindly reset your password from link provided..',
      );

      Future.delayed(const Duration(seconds: 1), () {
        Get.to(() => ResetPassword(
              email: email.text.trim(),
            ));
      });
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //Start Full Screen Loader
      TFullScreenLoader.openLoadingDialog(
          'Processing your Information....Please Wait for a moment',
          TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(
            title: 'Connection Error',
            message: 'Please check your internet connection.');
        return;
      }

      //Send email to reset Password
      await AuthenticationRepository.instance.sendPassword(email);

      //Remove the Loader

      TFullScreenLoader.stopLoading();

      // Show Success Message
      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Reset Email Sent Successfully',
        message:
            'An email with the reset password link has been sent to your mail. Kindly reset your password from link provided..',
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
