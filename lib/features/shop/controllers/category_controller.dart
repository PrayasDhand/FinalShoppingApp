import 'package:get/get.dart';
import 'package:pkart/data/repositories/category_repository.dart';

import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController{

  static CategoryController get instance => Get.find();

  final RxBool isLoading = false.obs;

  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

// Load Category data
Future<void> fetchCategories() async {
  try {
    // Showing loader when we load categories
    isLoading.value = true;




    //Fetching Categories from the source....can be from an API OR from our Firestore whatever
    final categories = await _categoryRepository.getAllCategories();




    //updating the categories list
    allCategories.assignAll(categories);




    //filtering the featured categories
featuredCategories.assignAll(allCategories.where((category)=> category.isFeatured && category.parentId.isEmpty).take(8).toList());

















  } catch (e) {


    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }finally{
    isLoading.value=false;

  }
}

  //loading selected category data

  //Getiign catehory or subcategory data

}