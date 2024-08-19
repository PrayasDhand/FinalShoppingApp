import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/data/repositories/authentication_repository.dart';
import 'package:pkart/data/repositories/user_repository.dart';
import 'package:pkart/features/authentication/screens/verify_email.dart';
import 'package:pkart/features/personalization/models/user_model.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/popups/full_screen_loader.dart';
import 'package:pkart/utils/popups/loaders.dart';
import '../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final RxBool hidePassword = true.obs;
  final email = TextEditingController();
  final RxBool privacyPolicy = true.obs;
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Signup
  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your Information....', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(
            title: 'Connection Error',
            message: 'Please check your internet connection.');
        return;
      }

      // Form Validations
      if (signupFormKey.currentState == null ||
          !signupFormKey.currentState!.validate()) {
        return;
      }

      // Terms and Conditions and Privacy CheckBox
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Terms of Use and Privacy Policy',
            message:
            'In order to create your account, you must have to read and accept the Privacy Policy and Terms of Use..');
        return;
      }

      // Registering User in Firebase Authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // Check if userCredential is not null


      // Save authenticated user data in Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid, // Ensure you use the correct user ID
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser); // Ensure this is awaited

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been Created Successfully! Verify your email to continue',
      );

// Navigate to the Verify Email screen
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAll(() =>  VerifyEmailAddress(email: email.text.trim(),));
      });

    } catch (e) {


      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }finally{
      TFullScreenLoader.stopLoading();
    }
  }
}