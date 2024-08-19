import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pkart/features/authentication/screens/login.dart';
import 'package:pkart/features/authentication/screens/onboarding.dart';
import 'package:pkart/features/authentication/screens/verify_email.dart';
import 'package:pkart/navigation_menu.dart';

import '../../utils/exceptions/custom_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();
  
  
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  
  @override void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        print("Navigating to Home Screen");
        Get.offAll(() => const NavigationMenu());
      } else {
        print("Navigating to Email Verification Screen");
        Get.offAll(() => VerifyEmailAddress(email: _auth.currentUser?.email));
      }
    } else {
      print("Navigating to Login or Onboarding Screen");
      deviceStorage.writeIfNull('isFirstTime', true);
      bool isFirstTime = deviceStorage.read('isFirstTime');
      Get.offAll(() => isFirstTime ? const OnboardingScreen() : const LoginScreen());
    }
  }


  /// Email Authentication- Sign iN
  Future<UserCredential> loginWithEmailAndPassword(String email,String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;

    }on FormatException catch(_){
      throw const TFormatException();

    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went Wrong! Try again';
    }

  }

/// Email Authentication - Register
  Future<UserCredential> registerWithEmailAndPassword(String email,String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;

    }on FormatException catch(_){
      throw const TFormatException();

    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went Wrong! Try again';
    }

  }

  /// [EmailVerification] - MAIL VERIFICATION
Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;

    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;

    }on FormatException catch(_){
      throw const TFormatException();

    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something went Wrong! Try again';
    }
}

/// [LogoutUser] - valid for any authentication
Future<void> logout() async{
  try {
    await FirebaseAuth.instance.signOut();
    Get.offAll(()=> const LoginScreen());
  }on FirebaseAuthException catch(e){
    throw TFirebaseAuthException(e.code).message;

  }on FirebaseException catch(e){
    throw TFirebaseException(e.code).message;

  }on FormatException catch(_){
    throw const TFormatException();

  } on PlatformException catch(e){
    throw TPlatformException(e.code).message;
  } catch (e){
    throw 'Something went Wrong! Try again';
  }

}

  
}