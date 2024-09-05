 import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;


  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
  });
 //Starting with creating an empty helper function
  static CategoryModel empty() => CategoryModel(id: '',image: '',isFeatured: false ,name: '',);


  //since we have to store this data in firebase so we will convert this tho the json structure

 Map<String,dynamic> toJson(){
   return {
     'Name':name,
     'Image': image,
     'ParentId': parentId,
     'IsFeatured': isFeatured,
   };
 }

 //Now we will map this above json orienteed document snapshot from firebase to user model
 factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>document){
   if (document.data() != null) {
     final data = document.data()!;

     return CategoryModel(id: document.id, name: data['Name'] ?? '', image: data['Image'] ?? '', isFeatured: data['IsFeatured'] ?? false, parentId: data['ParentId'] ?? '');

   }else{
     return CategoryModel.empty();

   }

 }

 }



