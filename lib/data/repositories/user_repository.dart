import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pkart/data/repositories/authentication_repository.dart';
import 'package:pkart/features/personalization/models/user_model.dart';
import 'package:pkart/utils/exceptions/custom_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save this user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Firebase Error: ${e.code} - ${e.message}');
      }
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('General Error: $e');
      }
      throw 'Something went wrong, please try again';
    }
  }

  /// Function to fetch user details based on the user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);

      }else
        {
          return UserModel.empty();
        }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Firebase Error: ${e.code} - ${e.message}');
      }
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('General Error: $e');
      }
      throw 'Something went wrong, please try again';
    }
  }

  /// function to update user data in firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Firebase Error: ${e.code} - ${e.message}');
      }
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('General Error: $e');
      }
      throw 'Something went wrong, please try again';
    }
  }
  
  ///function to update any field in specific user collection
  Future<void> updateSingleField(Map<String,dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Firebase Error: ${e.code} - ${e.message}');
      }
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('General Error: $e');
      }
      throw 'Something went wrong, please try again';
    }
  }

  ///function to remove the user data from the firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('Firebase Error: ${e.code} - ${e.message}');
      }
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) {
        print('General Error: $e');
      }
      throw 'Something went wrong, please try again';
    }
  }
}
