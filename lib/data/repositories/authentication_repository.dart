import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pkart/features/authentication/screens/login.dart';
import 'package:pkart/features/authentication/screens/onboarding.dart';

import '../../utils/exceptions/custom_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();
  
  
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  
  @override void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  screenRedirect()  async {

    if (kDebugMode) {
      print('+++++++++++++++++++++++++++GetStorage+++++++++++++++++++++++++++++');
      print(deviceStorage.read('isFirstTime'));

    }
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime' ) != true ? Get.offAll(()=> const LoginScreen()): Get.offAll(const OnboardingScreen());
  }

  /// Email Authentication- Sign iN
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

  
}