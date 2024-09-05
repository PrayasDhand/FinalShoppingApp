import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pkart/features/shop/models/category_model.dart';

import '../../utils/exceptions/custom_exceptions.dart';

class CategoryRepository extends GetxController{

  static CategoryRepository get instance => Get.find();


  //variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get all categories
Future<List<CategoryModel>> getAllCategories()async{
  try{
 final snapshot  =await _db.collection('Categories').get();
 final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
 return list;
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

  //Getting all subcategories

  //Uploading categories to the cloud firestore




}