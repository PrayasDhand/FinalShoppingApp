import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkart/features/authentication/screens/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  final PageController pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      updatePageIndicator(pageController.page!.round());
    });
  }

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    int nextPageIndex = currentPageIndex.value + 1;
    if (nextPageIndex < 3) {
      pageController.animateToPage(
        nextPageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Handle if you want to navigate to a different screen after the last page
      Get.offAll(const LoginScreen());
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}