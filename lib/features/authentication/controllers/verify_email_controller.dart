
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pkart/data/repositories/authentication_repository.dart';
import 'package:pkart/utils/popups/loaders.dart';

import '../screens/verify_email_success.dart';


class VerifyEmailController extends GetxController{

  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();

    super.onInit();
  }
  /// Sending Email Verification Link
sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent Successfully', message: 'Please Check your mailbox and verify your email.');

    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
}

/// Timer to Automatically Redirect
setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async{
      await FirebaseAuth.instance.currentUser?.reload();

      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false ) {
        timer.cancel();
        Get.off(()=> const SuccessScreen());
        
      }  
    },);
}

/// Manually Check if Email is Verified
checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(()=> const SuccessScreen());
    }  
    
}

}