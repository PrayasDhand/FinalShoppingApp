import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pkart/data/repositories/user_repository.dart';
import 'package:pkart/features/personalization/models/user_model.dart';
import 'package:pkart/utils/popups/loaders.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  //Save user record which comes from any registration providers

 Future<void> saveUserRecord(UserCredential? userCredentials) async{
   try{
     if (userCredentials != null) {
       //converting name to first name and last name
       final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
       final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');
       
       final user = UserModel(id: userCredentials.user!.uid, username: username, email: userCredentials.user!.email ?? '', firstName: nameParts[0], lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' '): '', phoneNumber: userCredentials.user!.phoneNumber ?? '', profilePicture: userCredentials.user!.photoURL ?? '');
       //save this user data
       await userRepository.saveUserRecord(user);
     }



   }catch (e){
     TLoaders.warningSnackBar(title: 'Data not saved',message: 'Something went wrong while saving your information..You can re-save your data in your Profile');
   }
 }
}