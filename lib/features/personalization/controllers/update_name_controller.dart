import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pkart/data/repositories/user_repository.dart';
import 'package:pkart/features/personalization/controllers/user_controller.dart';
import 'package:pkart/features/personalization/screens/profile/profile.dart';
import 'package:pkart/utils/constants/image_strings.dart';
import 'package:pkart/utils/popups/full_screen_loader.dart';

import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  // Convert firstName and lastName to RxString
  final firstName = ''.obs;
  final lastName = ''.obs;

  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.value = userController.user.value.firstName;
    lastName.value = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are updating your information...Kindly wait for a moment',
        TImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(
          title: 'Connection Error',
          message: 'Please check your internet connection.',
        );
        return;
      }

      // Form Validations
      if (updateUserNameFormKey.currentState == null ||
          !updateUserNameFormKey.currentState!.validate()) {
        return;
      }

      // Update the changes in Firestore Firebase
      Map<String, dynamic> name = {
        'FirstName': firstName.value.trim(),
        'LastName': lastName.value.trim(),
      };
      await userRepository.updateSingleField(name);

      // Update the Rx user values
      userController.user.value.firstName = firstName.value.trim();
      userController.user.value.lastName = lastName.value.trim();

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Details Updated',
        message: 'Your details have been updated successfully!',
      );

      // Moving back to profile SCREEN
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
