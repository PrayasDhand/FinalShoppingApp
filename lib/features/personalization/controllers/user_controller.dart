import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pkart/data/repositories/user_repository.dart';
import 'package:pkart/features/personalization/models/user_model.dart';
import 'package:pkart/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final RxBool profileLoading = false.obs;
  final RxBool imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await UserRepository.instance.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //Save user record which comes from any registration providers

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //Refresh user record
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //converting name to first name and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          final user = UserModel(
              id: userCredentials.user!.uid,
              username: username,
              email: userCredentials.user!.email ?? '',
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              phoneNumber: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '');
          //save this user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information..You can re-save your data in your Profile');
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxWidth: 512,
          maxHeight: 512,
          imageQuality: 70);
      if (image != null) {
        imageUploading.value = true;

        final imageUrl = await userRepository.uploadImage(
            'Users/Images/ProfilePictures/', image);

        //updating the user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: 'Congratulations!',
            message: 'Your Profile Picture has been updated!');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
